summons = {}

summons.unlinkFromMaster = function(summon)
    local summontable = unitstats.get(summon)
    local master = summontable.master
    local mastertable = unitstats.get(master)
    mastertable.summon_list[GetUnitTypeId(summon)] = nil
    summontable.master = nil
end

summons.linkToMaster = function(master, summon)
    local mastertable = unitstats.get(master)
    mastertable.summon_list[GetUnitTypeId(summon)] = {unit = summon}
    unitstats.get(summon).master = master
    return
end

summons.getMaster = function(summon)
    local master = unitstats.get(summon).master
    if(master == nil)then 
        _print("summons.getMaster: summon " .. GetUnitName(summon) .. " no master.") 
    return end
    return master
end

summons.get = function(master, unitid)
    local mastertable = unitstats.get(master)
    local summontable = mastertable.summon_list[unitid]
    if(summontable == nil)then
        return false
    end
    return summontable.unit
end

summons.create = function(master, unitid, x, y)
    local summon = CreateUnitEx(GetOwningPlayer(master), unitid, x, y, 0)
    summons.linkToMaster(master, summon)
    return summon
end

summons.getOrCreate = function(master, unitid, x, y)
    local summon = summons.get(master, unitid)

    if(summon ~= false)then
        _print("summons recreated")
        --on on re-create
        UnitFullHeal(summon)
        
        shields.removeAll(summon)
        buffs.removeAll(summon)
        shields.removeAll(summon)
        buffs.removeAll(summon)

        summons.show(summon, x, y)
        SetUnitPosition(summon, x, y)
        return summon
    end

    summon = summons.create(master, unitid, x, y)
    return summon
end

summons.alloc = function(master, unitid)
    local summon = summons.create(master, unitid, 0, 0)
    ShowUnit(summon, false)
    SetUnitLifePercentBJ(summon, 0)
    return summon
end

summons.remove = function(summon)
    summons.unlinkFromMaster(summon)
    RemoveUnitEx(summon)
end

summons.hide = function(summon)
    ShowUnit(summon, false)
    SetUnitLifePercentBJ(summon, 0)
end

summons.show = function(summon, x, y)
    ReviveHero(summon, x, y, false)
    ShowUnit(summon, true)
end
--
function isSummon(unit)
    return GetUnitAbilityLevel(unit, id_summons.shared_abils.relocate) >= 1
end