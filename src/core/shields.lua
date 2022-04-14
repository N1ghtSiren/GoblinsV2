shields = {}

function shields.remove(target, shieldid)
    local unittable = unitstats.get(target)
    local shielddata = unittable.shield_list[shieldid]

    if(shielddata == nil)then
        _print("shields.remove: trying to remove non-existing shield " .. shieldid .. " from unit " .. GetUnitName(target))
        _print(debug.traceback())
        return
    end

    shielddata.removefunc()
end

function shields.apply(target, shielddata)
    local unittable = unitstats.get(target)
    local shield_exists = unittable.shield_list[shielddata.id] ~= nil

    if(shield_exists)then
        unittable.shield_list[shielddata.id].removefunc()
    end

    unittable.shield_list[shielddata.id] = shielddata
    events.shields.invoke(shielddata, EX_EVENT_SHIELD_APPLY, target, shielddata)

    shielddata.timer = CreateTimer()
    shielddata.removefunc = function()
        DestroyTimer(shielddata.timer)

        events.shields.invoke(shielddata, EX_EVENT_SHIELD_EXPIRE, target, shielddata)
        unittable.shield_list[shielddata.id] = nil
        _print("shield removed")
    end

    TimerStart(shielddata.timer, shielddata.duration, false, shielddata.removefunc)
end

function shields.applyInstance(target, shielddata)
    local copy = deepcopy(shielddata)
    shields.apply(copy, target)
end

--@todo : shields are regenerating if damage is negative
function shields.work(caster, source, damage)
    local unittable = unitstats.get(caster)
    for shieldid, shielddata in pairs(unittable.shield_list)do
        if(damage == 0)then
            break
        end
        if(damage > shielddata.life)then
            local damage_after_shield = damage - shielddata.life
            local absorbed_damage = damage - damage_after_shield

            events.shields.invoke(shielddata, EX_EVENT_SHIELD_DAMAGE, caster, source, absorbed_damage, shielddata)
            events.shields.invoke(shielddata, EX_EVENT_SHIELD_BREAK, caster, source, absorbed_damage, shielddata)
            shields.remove(caster, shielddata.id)

            damage = damage_after_shield
        elseif(damage <= shielddata.life)then
            local new_shield_life = shielddata.life - damage
            local absorbed_damage = shielddata.life - new_shield_life

            events.shields.invoke(shielddata, EX_EVENT_SHIELD_DAMAGE, caster, source, absorbed_damage, shielddata)
            shielddata.life = new_shield_life

            damage = 0
        end
    end

    return damage
end

function shields.removeAll(unit)
    local unittable = unitstats.get(unit)
    for shieldid, shielddata in pairs(unittable.shield_list)do
        shields.remove(unit, shieldid)
    end
end
--