unitstats = {}

unitstats.get = function(unit)
    local stats = unitstats[unit]
        if(stats == nil)then
        _print("unitstats.get: nil data on unit " .. tostring(unit))
        _print(debug.traceback())
    end

    return stats
end

unitstats.alloc = function(unit, unitid)
    local stats = unitstats.get(unit)
    if(stats ~= nil)then
        _print("database.alloc: trying to realloc existring unit stats")
        _print(debug.traceback())
    end

    return 
end

unitstats.allocCopy = function(unit, unitid)
    local copy = database.getCopy(unitid)
    unitstats[unit] = copy
end

unitstats.free = function(unit)
    unitstats[unit] = nil
end

unitstats.apply = function(unit)
    --_print("unistats.apply called")

    local unittable = unitstats.get(unit)
    local stats = unittable.stats

    local str_final = R2I(stats[STATS_STR] * (0.01 * stats[STATS_STR_PERCENT]))
    local agi_final = R2I(stats[STATS_AGI] * (0.01 * stats[STATS_AGI_PERCENT]))
    local int_final = R2I(stats[STATS_INT] * (0.01 * stats[STATS_INT_PERCENT]))

    local life_final = R2I(stats[STATS_LIFE] * (0.01 * stats[STATS_LIFE_PERCENT]))
    local mana_final = R2I(stats[STATS_MANA] * (0.01 * stats[STATS_MANA_PERCENT]))
    
    local life_regen_final = R2I(stats[STATS_LIFE_REGEN] + (stats[STATS_LIFE_REGEN_PERCENT] * 0.01 * life_final))
    local mana_regen_final = R2I(stats[STATS_MANA_REGEN] + (stats[STATS_MANA_REGEN_PERCENT] * 0.01 * mana_final))

    local damage_final = R2I(stats[STATS_DAMAGE] * (0.01 * stats[STATS_DAMAGE_PERCENT]))
    local armour_final = R2I(stats[STATS_ARMOUR] * (0.01 * stats[STATS_ARMOUR_PERCENT]))

    local attack_speed = clamp(stats[STATS_ATTACKSPEED_PERCENT], ATTACKSPEED_PERCENT_MIN_LIMIT, ATTACKSPEED_PERCENT_MAX_LIMIT) * 0.01
    local attack_speed_final = stats[STATS_BASE_ATTACKSPEED] / attack_speed

    --make 20 damage look like 19~21; editor: 1 dice, 3 sides
    damage_final = damage_final - 2

    SetHeroStr(unit, str_final, true)
    SetHeroAgi(unit, agi_final, true)
    SetHeroInt(unit, int_final, true)
    SetUnitMaxLife(unit, RMaxBJ(1, life_final))
    SetUnitMaxMana(unit, RMaxBJ(0, mana_final))
    SetUnitLifeRegen(unit, life_regen_final)
    SetUnitManaRegen(unit, mana_regen_final)
    SetUnitBaseDamage(unit, damage_final)
    SetUnitArmor(unit, armour_final)
    SetUnitMoveSpeed(unit, stats[STATS_BASE_MOVESPEED])
    SetUnitAttackSpeed(unit, attack_speed_final)
end

unitstats.getUnbuffedStats = function(unit)
    local unittable = unitstats.get(unit)
    local buffed_stats = deepcopy(unittable.stats)
    local stats_from_buffs = database.getStatsTemplate()
    local unbuffed_stats

    for id, buff in pairs(unittable.buff_list) do
        stats_from_buffs = stats.sum(stats_from_buffs, buff.stats)
    end

    unbuffed_stats = stats.sub(buffed_stats, stats_from_buffs)

    return unbuffed_stats
end