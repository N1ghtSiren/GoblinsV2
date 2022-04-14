--------------------------------------------------------------------
--template buff to create on-fly with overrided id
--------------------------------------------------------------------
database.NewBuff({
    id = TEMPLATE_BUFF_ID,
    stats = {
        [STATS_STR] = 0,
        [STATS_AGI] = 0,
        [STATS_INT] = 0,
        [STATS_LIFE] = 0,
        [STATS_MANA] = 0,
        [STATS_LIFE_REGEN] = 0,
        [STATS_MANA_REGEN] = 0,
        [STATS_ARMOUR] = 0,
        [STATS_DAMAGE] = 0,

        [STATS_STR_PERCENT] = 0,
        [STATS_AGI_PERCENT] = 0,
        [STATS_INT_PERCENT] = 0,
        [STATS_LIFE_PERCENT] = 0,
        [STATS_MANA_PERCENT] = 0,
        [STATS_LIFE_REGEN_PERCENT] = 0,
        [STATS_MANA_REGEN_PERCENT] = 0,
        [STATS_ARMOUR_PERCENT] = 0,
        [STATS_DAMAGE_PERCENT] = 0,
        [STATS_ATTACKSPEED_PERCENT] = 0,
    },
    events = {
        [EX_EVENT_BUFF_APPLY] = function() end,
        [EX_EVENT_BUFF_REMOVE] = function() end,
    }
})