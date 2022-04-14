--------------------------------------------------------------------
--@heroes
--------------------------------------------------------------------
database.NewUnit({
    id = heroes.stalker.id,
    stats = {
        [STATS_LEVEL] = 1,
        [STATS_BASE_ATTACKSPEED] = 1.2,
        [STATS_BASE_MOVESPEED] = 300,

        [STATS_STR] = 10,
        [STATS_AGI] = 10,
        [STATS_INT] = 10,
        [STATS_LIFE] = 100,
        [STATS_MANA] = 85,
        [STATS_LIFE_REGEN] = 1,
        [STATS_MANA_REGEN] = 0.85,
        [STATS_ARMOUR] = 2,
        [STATS_DAMAGE] = 10,

        [STATS_STR_PERCENT] = 100,
        [STATS_AGI_PERCENT] = 100,
        [STATS_INT_PERCENT] = 100,
        [STATS_LIFE_PERCENT] = 100,
        [STATS_MANA_PERCENT] = 100,
        [STATS_LIFE_REGEN_PERCENT] = 0,
        [STATS_MANA_REGEN_PERCENT] = 0,
        [STATS_ARMOUR_PERCENT] = 100,
        [STATS_DAMAGE_PERCENT] = 100,
        [STATS_ATTACKSPEED_PERCENT] = 100,
    },
    abil_list = {
        heroes.stalker.q,
        heroes.stalker.w,
        heroes.stalker.e,
        heroes.stalker.r,
        heroes.stalker.t
    },
})
database.NewUnit({
    id = heroes.medic.id,
    stats = {
        [STATS_LEVEL] = 1,
        [STATS_BASE_ATTACKSPEED] = 1.5,
        [STATS_BASE_MOVESPEED] = 300,

        [STATS_STR] = 10,
        [STATS_AGI] = 10,
        [STATS_INT] = 10,
        [STATS_LIFE] = 100,
        [STATS_MANA] = 85,
        [STATS_LIFE_REGEN] = 1,
        [STATS_MANA_REGEN] = 0.85,
        [STATS_ARMOUR] = 2,
        [STATS_DAMAGE] = 10,

        [STATS_STR_PERCENT] = 100,
        [STATS_AGI_PERCENT] = 100,
        [STATS_INT_PERCENT] = 100,
        [STATS_LIFE_PERCENT] = 100,
        [STATS_MANA_PERCENT] = 100,
        [STATS_LIFE_REGEN_PERCENT] = 0,
        [STATS_MANA_REGEN_PERCENT] = 0,
        [STATS_ARMOUR_PERCENT] = 100,
        [STATS_DAMAGE_PERCENT] = 100,
        [STATS_ATTACKSPEED_PERCENT] = 100,
    },
    abil_list = {
        heroes.medic.q,
        heroes.medic.w,
        heroes.medic.e,
        heroes.medic.r,
    },
})
--------------------------------------------------------------------
--@summons
--------------------------------------------------------------------
database.NewUnit({
    id = id_summons.medic_r.id,
    stats = {
        [STATS_LEVEL] = 1,
        [STATS_BASE_ATTACKSPEED] = 1.2,
        [STATS_BASE_MOVESPEED] = 300,

        [STATS_STR] = 10,
        [STATS_AGI] = 10,
        [STATS_INT] = 10,
        [STATS_LIFE] = 100,
        [STATS_MANA] = 85,
        [STATS_LIFE_REGEN] = 1,
        [STATS_MANA_REGEN] = 0.85,
        [STATS_ARMOUR] = 2,
        [STATS_DAMAGE] = 10,

        [STATS_STR_PERCENT] = 100,
        [STATS_AGI_PERCENT] = 100,
        [STATS_INT_PERCENT] = 100,
        [STATS_LIFE_PERCENT] = 100,
        [STATS_MANA_PERCENT] = 100,
        [STATS_LIFE_REGEN_PERCENT] = 0,
        [STATS_MANA_REGEN_PERCENT] = 0,
        [STATS_ARMOUR_PERCENT] = 100,
        [STATS_DAMAGE_PERCENT] = 100,
        [STATS_ATTACKSPEED_PERCENT] = 100,
    },
    abil_list = {
        id_summons.shared_abils.relocate,
        id_summons.shared_abils.unsummon,
        id_summons.medic_r.q,
    }
})
--------------------------------------------------------------------
--@waves
--------------------------------------------------------------------
database.NewUnit({
    id = WAVEUNITS[0],
    stats = {
        [STATS_LEVEL] = 1,
        [STATS_BASE_ATTACKSPEED] = 1.5,
        [STATS_BASE_MOVESPEED] = 200,
        [STATS_LIFE] = 10,
        [STATS_MANA] = 0,
        [STATS_LIFE_REGEN] = 1,
        [STATS_MANA_REGEN] = 0,
        [STATS_ARMOUR] = 0,
        [STATS_DAMAGE] = 4,
        [STATS_ATTACKSPEED_PERCENT] = 100,
    },
})