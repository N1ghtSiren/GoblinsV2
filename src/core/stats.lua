stats = {}

stats.sum = function(main, delta)
    main[STATS_STR]                     = main[STATS_STR]                       + delta[STATS_STR]
    main[STATS_AGI]                     = main[STATS_AGI]                       + delta[STATS_AGI]
    main[STATS_INT]                     = main[STATS_INT]                       + delta[STATS_INT]
    main[STATS_LIFE]                    = main[STATS_LIFE]                      + delta[STATS_LIFE]
    main[STATS_MANA]                    = main[STATS_MANA]                      + delta[STATS_MANA]
    main[STATS_LIFE_REGEN]              = main[STATS_LIFE_REGEN]                + delta[STATS_LIFE_REGEN]
    main[STATS_MANA_REGEN]              = main[STATS_MANA_REGEN]                + delta[STATS_MANA_REGEN]
    main[STATS_ARMOUR]                  = main[STATS_ARMOUR]                    + delta[STATS_ARMOUR]
    main[STATS_DAMAGE]                  = main[STATS_DAMAGE]                    + delta[STATS_DAMAGE]
    main[STATS_STR_PERCENT]             = main[STATS_STR_PERCENT]               + delta[STATS_STR_PERCENT]
    main[STATS_AGI_PERCENT]             = main[STATS_AGI_PERCENT]               + delta[STATS_AGI_PERCENT]
    main[STATS_INT_PERCENT]             = main[STATS_INT_PERCENT]               + delta[STATS_INT_PERCENT]
    main[STATS_LIFE_PERCENT]            = main[STATS_LIFE_PERCENT]              + delta[STATS_LIFE_PERCENT]
    main[STATS_MANA_PERCENT]            = main[STATS_MANA_PERCENT]              + delta[STATS_MANA_PERCENT]
    main[STATS_LIFE_REGEN_PERCENT]      = main[STATS_LIFE_REGEN_PERCENT]        + delta[STATS_LIFE_REGEN_PERCENT]
    main[STATS_MANA_REGEN_PERCENT]      = main[STATS_MANA_REGEN_PERCENT]        + delta[STATS_MANA_REGEN_PERCENT]
    main[STATS_ARMOUR_PERCENT]          = main[STATS_ARMOUR_PERCENT]            + delta[STATS_ARMOUR_PERCENT]
    main[STATS_DAMAGE_PERCENT]          = main[STATS_DAMAGE_PERCENT]            + delta[STATS_DAMAGE_PERCENT]
    main[STATS_ATTACKSPEED_PERCENT]     = main[STATS_ATTACKSPEED_PERCENT]       + delta[STATS_ATTACKSPEED_PERCENT]

    return main
end

stats.sub = function(main, delta)
    main[STATS_STR]                     = main[STATS_STR]                       - delta[STATS_STR]
    main[STATS_AGI]                     = main[STATS_AGI]                       - delta[STATS_AGI]
    main[STATS_INT]                     = main[STATS_INT]                       - delta[STATS_INT]
    main[STATS_LIFE]                    = main[STATS_LIFE]                      - delta[STATS_LIFE]
    main[STATS_MANA]                    = main[STATS_MANA]                      - delta[STATS_MANA]
    main[STATS_LIFE_REGEN]              = main[STATS_LIFE_REGEN]                - delta[STATS_LIFE_REGEN]
    main[STATS_MANA_REGEN]              = main[STATS_MANA_REGEN]                - delta[STATS_MANA_REGEN]
    main[STATS_ARMOUR]                  = main[STATS_ARMOUR]                    - delta[STATS_ARMOUR]
    main[STATS_DAMAGE]                  = main[STATS_DAMAGE]                    - delta[STATS_DAMAGE]
    main[STATS_STR_PERCENT]             = main[STATS_STR_PERCENT]               - delta[STATS_STR_PERCENT]
    main[STATS_AGI_PERCENT]             = main[STATS_AGI_PERCENT]               - delta[STATS_AGI_PERCENT]
    main[STATS_INT_PERCENT]             = main[STATS_INT_PERCENT]               - delta[STATS_INT_PERCENT]
    main[STATS_LIFE_PERCENT]            = main[STATS_LIFE_PERCENT]              - delta[STATS_LIFE_PERCENT]
    main[STATS_MANA_PERCENT]            = main[STATS_MANA_PERCENT]              - delta[STATS_MANA_PERCENT]
    main[STATS_LIFE_REGEN_PERCENT]      = main[STATS_LIFE_REGEN_PERCENT]        - delta[STATS_LIFE_REGEN_PERCENT]
    main[STATS_MANA_REGEN_PERCENT]      = main[STATS_MANA_REGEN_PERCENT]        - delta[STATS_MANA_REGEN_PERCENT]
    main[STATS_ARMOUR_PERCENT]          = main[STATS_ARMOUR_PERCENT]            - delta[STATS_ARMOUR_PERCENT]
    main[STATS_DAMAGE_PERCENT]          = main[STATS_DAMAGE_PERCENT]            - delta[STATS_DAMAGE_PERCENT]
    main[STATS_ATTACKSPEED_PERCENT]     = main[STATS_ATTACKSPEED_PERCENT]       - delta[STATS_ATTACKSPEED_PERCENT]

    return main
end

stats.set = function(unit, stats)
    local unittable = unitstats.get(unit)
    unittable.stats = stats
    unitstats.apply(unit)
end

--stats.clone = function(source, target)
--    local source_stats = unitstats.get(source).stats
--    local cloned_stats = deepcopy(source_stats)
--    local unittable = unitstats.get(target)
--    unittable.stats = cloned_stats
--    unitstats.apply(target)
--end