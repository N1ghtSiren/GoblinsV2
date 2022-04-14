function UnitAddAbilityEx(unit, abilityid)
    UnitAddAbility(unit, abilityid)
    events.ability.invoke(abilityid, EX_EVENT_ABILITY_ON_ADD, unit, abilityid)
end

function UnitRemoveAbilityEx(unit, abilityid)
    UnitRemoveAbility(unit, abilityid)
    events.ability.invoke(abilityid, EX_EVENT_ABILITY_ON_REMOVE, unit, abilityid)
end

function UnitInitAbils(unit, unitid)
    local stats = unitstats.get(unit)

    for k, abilityid in pairs(stats.abil_list) do
        UnitAddAbilityEx(unit, abilityid)
    end
end

function UnitFreeAbils(unit)
    local stats = unitstats.get(unit)

    for k, abilityid in pairs(stats.abil_list) do
        UnitRemoveAbilityEx(unit, abilityid)
    end
end

function RemoveUnitEx(unit)
    shields.removeAll(unit)
    buffs.removeAll(unit)
    shields.removeAll(unit)
    buffs.removeAll(unit)
    UnitFreeAbils(unit)
    unitstats.free(unit)
    RemoveUnit(unit)
end

function CreateItemEx(itemid, x, y)
    local item = CreateItem(itemid, x, y)
    --based on stats on saved item?
    RegisterItemDeath(item)
    return item
end

function CreateUnitEx(player, unitid, posx, posy, facing)
    local unit = CreateUnit(player, unitid, posx, posy, facing)
    unitstats.allocCopy(unit, unitid)
    UnitInitAbils(unit, unitid)
    unitstats.apply(unit)
    UnitAddAbility(unit, SPELLBOOK_ID)
    DamageReduction_Register(unit)
    return unit
end

function UnitEquipItemEx(unit, item)
    local itemid = GetItemTypeId(item)
    local itemtable = database.get(itemid)
    local unittable = unitstats.get(unit)

    stats.sum(unittable.stats, itemtable.stats)

    events.item.invoke(itemid, EX_EVENT_ITEM_EQUIP, unit, item)

    unitstats.apply(unit)
end

function UnitDropItemEx(unit, item)
    local itemid = GetItemTypeId(item)
    local itemtable = database.get(itemid)
    local unittable = unitstats.get(unit)

    stats.sub(unittable.stats, itemtable.stats)

    events.item.invoke(itemid, EX_EVENT_ITEM_DROP, unit, item)

    unitstats.apply(unit)
end


local stuntable = {}

function UnitRemoveStun(unit)
    local st = stuntable[unit]
    st.remove_stun()
end

function UnitAddStun(unit, duration)
    local st = stuntable[unit]
    local has_stun = st ~= nil

    _print("has_stun: " .. tostring(has_stun))

    if(has_stun)then
        local old_duration = TimerGetRemaining(stuntable.timer)
        if(old_duration > duration)then
            return
        else
            st.remove_stun()
        end
    end

    st = {}
    stuntable[unit] = st

    UnitAddStunEx(unit)
    st.timer = CreateTimer()
    st.remove_stun = function()
        UnitRemoveStunEx(unit)
        stuntable[unit] = nil
        DestroyTimer(st.timer)
        _print("stun removed")
    end
    _print("here duration: " .. duration)
    TimerStart(st.timer, duration, false, st.remove_stun)
end

function UnitAddHeal(caster, amount)
    local life = GetUnitLife(caster)
    local new_life = math.min(GetUnitMaxLife(caster), life + amount)
    local healed = new_life - life

    texttags.new(caster, 1.3, 0.03, ("|cff34eb46+ " .. R2I(healed)))

    SetUnitLife(caster, new_life)

    return healed
end

function UnitDoDamage(caster, target, amount)
    UnitDamageTarget(caster, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS)
end

function UnitFullHeal(unit)
    SetUnitLifePercentBJ(unit, 100)
    SetUnitManaPercentBJ(unit, 100)
end