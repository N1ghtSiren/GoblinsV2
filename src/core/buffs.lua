buffs = {}

function buffs.setStat(buffdata, stat_type, value)
    buffdata.stats[stat_type] = value
end

function buffs.getStat(caster, buffid, stat_type)
    local unittable = unitstats.get(caster)
    local bufftable = unittable.buff_list[buffid]

    if(bufftable == nil)then
        return 0    
    end

    return bufftable.stats[stat_type]
end

function buffs.remove(target, buffid)
    local unittable = unitstats.get(target)
    local buffdata = unittable.buff_list[buffid]

    if(buffdata == nil)then
        _print("buffs.remove: trying to remove non-existing buff " .. buffid .. " from unit " .. GetUnitName(target))
        _print(debug.traceback())
        return
    end

    buffdata.removefunc()
end

function buffs.apply(buffdata, target)
    local unittable = unitstats.get(target)
    local buff_exists = unittable.buff_list[buffdata.id] ~= nil

    if(buff_exists)then
        unittable.buff_list[buffdata.id].removefunc()
    end

    unittable.buff_list[buffdata.id] = buffdata

    stats.sum(unittable.stats, buffdata.stats)
    unitstats.apply(target)
    events.buffs.invoke(buffdata, EX_EVENT_BUFF_APPLY, target, buffdata)

    buffdata.timer = CreateTimer()
    buffdata.removefunc = function()
        DestroyTimer(buffdata.timer)
        stats.sub(unittable.stats, buffdata.stats)

        events.buffs.invoke(buffdata, EX_EVENT_BUFF_REMOVE, target, buffdata)
        unitstats.apply(target)
        unittable.buff_list[buffdata.id] = nil
        _print("buff removed")
    end

    TimerStart(buffdata.timer, buffdata.duration, false, buffdata.removefunc)
end

function buffs.applyInstance(buffdata, target)
    local copy = deepcopy(buffdata)
    buffs.apply(copy, target)
end

function buffs.removeAll(unit)
    local unittable = unitstats.get(unit)
    for buffid, buffdata in pairs(unittable.buff_list)do
        buffs.remove(unit, buffid)
    end
end