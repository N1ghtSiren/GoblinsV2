database = {}

function database.NewUnit(unitdata)
    local template = {
        id = "null",
        stats = {
            [STATS_LEVEL] = 0,
            [STATS_BASE_ATTACKSPEED] = 4,
            [STATS_BASE_MOVESPEED] = 150,

            [STATS_STR] = 0,
            [STATS_AGI] = 0,
            [STATS_INT] = 0,
            [STATS_LIFE] = 10,
            [STATS_MANA] = 10,
            [STATS_LIFE_REGEN] = 1,
            [STATS_MANA_REGEN] = 1,
            [STATS_ARMOUR] = 0,
            [STATS_DAMAGE] = 3,

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
        events = {
            [EX_EVENT_UNIT_CAST] = {},      --  function(caster, target)
            [EX_EVENT_UNIT_ATTACK] = {},    --  function(caster, target, damage)
            [EX_EVENT_UNIT_DAMAGE] = {},    --  function(caster, target, damage)
            [EX_EVENT_UNIT_HIT] = {},       --  function(caster, source, damage)
            [EX_EVENT_UNIT_KILL] = {},      --  function(caster, target)
            [EX_EVENT_UNIT_LEVELUP] = {},   --  function(caster)
            [EX_EVENT_UNIT_DEATH] = {},     --  function(caster, source)
        },
        buff_list = {},
        abil_list = {},
        shield_list = {},
        summon_list = {},   -- [id] = {[unit] = unit}
    }

    local merged = MergeTables(template, unitdata)

    database[unitdata.id] = merged
end

function database.NewItem(itemdata)
    local template = {
        id = "null",
        icon = "",
        name = "",
        ubertip = "",

        stats = {
            [STATS_LEVEL] = 0,

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
            [STATS_ATTACKSPEED_PERCENT] = 0
        },
        events = {
            [EX_EVENT_ITEM_EQUIP] = function(caster, item) end,
            [EX_EVENT_ITEM_DROP] = function(caster, item) end,
        },
    }

    RemoveItem(CreateItem(itemdata.id, 0, 0))
    SetItemBaseNameById(itemdata.id, itemdata.name)
    SetItemBaseUbertipById(itemdata.id, itemdata.ubertip)
    SetItemBaseIconPathById(itemdata.id, itemdata.icon)

    local merged = MergeTables(template, itemdata)
    database[itemdata.id] = merged
end

function database.NewAbility(abilitydata)
    local template = {
        id = "null",
        events = {
            [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid) end,
            [EX_EVENT_ABILITY_ON_ADD] = function(caster, abilityid) end,
            [EX_EVENT_ABILITY_ON_REMOVE] = function(caster, abilityid) end,
        },
    }

    local merged = MergeTables(template, abilitydata)

    database[abilitydata.id] = merged
end

function database.NewBuff(buffdata)
    local template = {
        id = TEMPLATE_BUFF_ID,
        duration = 0,
        removefunc = nil,
        timer = nil,
        source = nil,
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
            [EX_EVENT_BUFF_APPLY] = function(caster, buffdata) end,
            [EX_EVENT_BUFF_REMOVE] = function(caster, buffdata) end,
        }
    }

    local merged = MergeTables(template, buffdata)
    database[buffdata.id] = merged
end

function database.NewShield(shielddata)
    local template = {
        id = TEMPLATE_SHIELD_ID,
        duration = 0,
        life = 0,
        removefunc = nil,
        timer = nil,
        source = nil,
        events = {
            [EX_EVENT_SHIELD_APPLY] = function(caster, shielddata) end,
            [EX_EVENT_SHIELD_DAMAGE] = function(caster, source, damage, shielddata) end,
            [EX_EVENT_SHIELD_BREAK] = function(caster, source, damage, shielddata) end,
            [EX_EVENT_SHIELD_EXPIRE] = function(caster, shielddata) end,
        }
    }

    local merged = MergeTables(template, shielddata)
    database[shielddata.id] = merged
end

database.waves = {}
function database.NewWave(wavedata)
    local template = {
        number = -1,
        mob = 'n000',
        mob_amount = 0,
        spawn_interval = 0,
        grace_duration = 0,
    }

    local merged = MergeTables(template, wavedata)
    database.waves[merged.number] = merged
end

function database.getWave(wavenumber)
    local wavedata = database.waves[wavenumber]
    if(wavedata == nil)then
        _print("database.get: nil wave on wavenumber " .. tostring(wavenumber))
    end

    return wavedata
end

function database.get(id)
    local data = database[id]
    if(data == nil)then
        _print("database.get: nil data on id " .. tostring(id))
        --_print(debug.traceback())
    end

    return data
end
function database.getCopy(id)
    return deepcopy(database.get(id))
end

function database.getBuffTemplate()
    return deepcopy(database.get(TEMPLATE_BUFF_ID))
end

function database.getShieldTemplate()
    return deepcopy(database.get(TEMPLATE_SHIELD_ID))
end
function database.getStatsTemplate()
    return {
        [STATS_LEVEL] = 0,
        [STATS_BASE_ATTACKSPEED] = 0,
        [STATS_BASE_MOVESPEED] = 0,

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
    }
end
