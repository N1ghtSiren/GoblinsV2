events = {}
events.unit = {}

events.unit.add = function(unit, event_type, func)
    local stats = unitstats.get(unit)
    local event_table = stats.events[event_type]

    table.insert(event_table, func)
end

events.unit.remove = function(unit, event_type, func)
    local stats = unitstats.get(unit)
    local event_table = stats.events[event_type]

    for key, value in pairs(event_table)do
        if(value == func)then
            event_table[key] = nil
            return
        end
    end
end

events.unit.invoke = function(unit, event_type, ...)
    local stats = unitstats.get(unit)
    local event_table = stats.events[event_type]

    for _, func in pairs(event_table) do
        func(...)
    end
end

--id-based
events.item = {}
events.item.invoke = function(itemid, event_type, ...)  --itemid, event_type, item, caster
    local stats = database.get(itemid)
    
    if(stats == nil)then return end
    

    local func = stats.events[event_type]
    func(...)
end

events.ability = {}
events.ability.invoke = function(abilityid, event_type, ...)
    local stats = database.get(abilityid)

    if(stats == nil)then return end

    local func = stats.events[event_type]
    func(...)
end

--data-based things which are dynamic
events.buffs = {}
events.buffs.invoke = function(buffdata, event_type, ...)
    local func = buffdata.events[event_type]
    func(...)
end

events.shields = {}
events.shields.invoke = function(shielddata, event_type, ...)
    local func = shielddata.events[event_type]
    func(...)
end