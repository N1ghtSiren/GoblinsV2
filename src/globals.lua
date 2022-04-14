local i = 0
local function alloc()
    i = i + 1
    return i
end



EX_EVENT_UNIT_CAST = alloc()                       -- func(caster, target)
EX_EVENT_UNIT_ATTACK = alloc()                     -- func(caster, target, damage)
EX_EVENT_UNIT_DAMAGE = alloc()                     -- func(caster, target, damage)
EX_EVENT_UNIT_KILL = alloc()                       -- func(caster, target)
EX_EVENT_UNIT_HIT = alloc()                        -- func(caster, source, damage)
EX_EVENT_UNIT_LEVELUP = alloc()                    -- func(caster, new_level)
EX_EVENT_UNIT_DEATH = alloc()                      -- func(caster, source)
EX_EVENT_ITEM_EQUIP = alloc()                      -- func(caster, item)
EX_EVENT_ITEM_DROP = alloc()                       -- func(caster, item)
EX_EVENT_ITEM_DEATH = alloc()                      -- func(item)
EX_EVENT_BUFF_APPLY = alloc()                      -- func(caster, buffdata)
EX_EVENT_BUFF_REMOVE = alloc()                     -- func(caster, buffdata)
EX_EVENT_SHIELD_APPLY = alloc()                    -- func(caster, shielddata)
EX_EVENT_SHIELD_DAMAGE = alloc()                   -- func(caster, source, damage, shielddata)
EX_EVENT_SHIELD_BREAK = alloc()                    -- func(caster, source, damage, shielddata)
EX_EVENT_SHIELD_EXPIRE = alloc()                   -- func(caster, shielddata)
EX_EVENT_ABILITY_ON_CAST = alloc()                 -- func(caster, target)
EX_EVENT_ABILITY_ON_ADD = alloc()                  -- func(caster, abilityid)
EX_EVENT_ABILITY_ON_REMOVE = alloc()               -- func(caster, abilityid)



STATS_LEVEL = alloc()
STATS_BASE_ATTACKSPEED = alloc()
STATS_BASE_MOVESPEED = alloc()
STATS_STR = alloc()
STATS_AGI = alloc()
STATS_INT = alloc()
STATS_LIFE = alloc()
STATS_MANA = alloc()
STATS_LIFE_REGEN = alloc()
STATS_MANA_REGEN = alloc()
STATS_ARMOUR = alloc()
STATS_DAMAGE = alloc()
STATS_STR_PERCENT = alloc()
STATS_AGI_PERCENT = alloc()
STATS_INT_PERCENT = alloc()
STATS_LIFE_PERCENT = alloc()
STATS_MANA_PERCENT = alloc()
STATS_LIFE_REGEN_PERCENT = alloc()
STATS_MANA_REGEN_PERCENT = alloc()
STATS_ARMOUR_PERCENT = alloc()
STATS_DAMAGE_PERCENT = alloc()
STATS_ATTACKSPEED_PERCENT = alloc()


BUFF_TEMPRORARY = alloc()
BUFF_PERMANENT = alloc()
BUFF_POSITIVE = alloc()
BUFF_NEGATIVE = alloc()



ATTACKSPEED_PERCENT_MIN_LIMIT = 20
ATTACKSPEED_PERCENT_MAX_LIMIT = 500

TIMER_PERIOD_32 = 0.03125

SPAWN_POINTS = {
    [0] = {
        x = -7000,
        y =  6700,
    },
    [1] = {
        x = -7300,
        y = 1000,
    },
    [2] = {
        x = 700,
        y = -7300,
    },
    [3] = {
        x = 2300,
        y = 7300,
    }
}