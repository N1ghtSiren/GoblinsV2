--to throw data between events
local abildata = {}

local function GetAData(caster, abilityid)
    local casterdata = abildata[caster]
    if(casterdata == nil) then casterdata = {} abildata[caster] = casterdata end
    local adata = casterdata[abilityid]
    if(adata == nil) then adata = {} casterdata[abilityid] = adata end
    return adata
end

local function FreeAData(caster, abilityid)
    local casterdata = abildata[caster]
    if(casterdata == nil) then 
        _print("FreeAData: trying to free casterdata which not exists: " .. GetUnitName(caster) .. " + " .. abilityid) 
        return 
    end
    casterdata[abilityid] = nil
end
--------------------------------------------------------------------
--@misc abils for logging
--------------------------------------------------------------------
database.NewAbility({
    id = DUMMY_STUN_ID,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid) 
            --_print("someone got stunned")
        end,
    }
})

database.NewAbility({
    id = SPELLBOOK_ID,
})
--------------------------------------------------------------------
--@heroes
--------------------------------------------------------------------
--@stalker
--------------------------------------------------------------------
database.NewAbility({
    id = heroes.stalker.q,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid) 
            local G = CreateGroup()
            local x, y = GetUnitX(caster), GetUnitY(caster)
            local damage = GetHeroStr(caster, true) * 1

            GroupEnumUnitsInRange(G, x, y, 600, filters.enum.alive)

            while(true) do
                local target = FirstOfGroup(G)

                if(target == nil or target == NULL_UNIT)then
                    break
                end
                GroupRemoveUnit(G, target)

                if(filters.aliveAndEnemy(caster, target))then
                    DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl", GetUnitX(target), GetUnitY(target)))
                    SetUnitX(target, x)
                    SetUnitY(target, y)

                    UnitDamageTarget(caster, target, damage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS)
                end
            end
            
            GroupClear(G)
            DestroyGroup(G)

            _print("stalker Q was casted!")
        end,
    }
})

database.NewAbility({
    id = heroes.stalker.w,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid) 
            local heal = GetUnitMaxLife(caster) * 0.05 + GetHeroStr(caster, true) * 1
            UnitAddHeal(caster, heal)
            _print("stalker W was casted!")
        end,
    }
})

database.NewAbility({
    id = heroes.stalker.e,
    events = {
        [EX_EVENT_ABILITY_ON_ADD] = function(caster, abilityid) 
            local data = GetAData(caster, abilityid)

            data.damage_taken = 0
            data.procs = 0

            data.onhit = function(caster, source, damage)
                local damage_breakpoint = GetUnitMaxLife(caster) * 0.2

                data.damage_taken = data.damage_taken + damage

                while(data.damage_taken > damage_breakpoint)do
                    data.damage_taken = data.damage_taken - damage_breakpoint
                    data.procs = data.procs + 1
                end
            end

            data.timer = CreateTimer()
            data.periodicCheck = function()
                if(data.procs > 0)then
                    data.procs = data.procs - 1
                    --proc
                    local G = CreateGroup()
                    local damage = GetUnitArmor(caster) + GetUnitMaxLife(caster) * 0.05

                    DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Feedback\\ArcaneTowerAttack.mdl", GetUnitX(caster), GetUnitY(caster)))

                    GroupEnumUnitsInRange(G, GetUnitX(caster), GetUnitY(caster), 400, filters.enum.alive)
                    
                    while(true) do
                        local target = FirstOfGroup(G)

                        if(target == nil or target == NULL_UNIT)then
                            break
                        end
                        GroupRemoveUnit(G, target)

                        if(filters.aliveAndEnemy(caster, target))then
                            DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Feedback\\ArcaneTowerAttack.mdl", GetUnitX(target), GetUnitY(target)))

                            UnitDoDamage(caster, target, damage)
                            UnitAddStun(target, 0.2)
                        end
                    end
                    
                    GroupClear(G)
                    DestroyGroup(G)
                end
            end
            TimerStart(data.timer, 0.25, true, data.periodicCheck)

            events.unit.add(caster, EX_EVENT_UNIT_HIT, data.onhit)
        end,
        [EX_EVENT_ABILITY_ON_REMOVE] = function(caster, abilityid) 
            local data = GetAData(caster, abilityid)
            DestroyTimer(data.timer)
            events.unit.remove(caster, EX_EVENT_UNIT_HIT, data.onhit)
            FreeAData(caster, abilityid)
        end,
    }
})

--[[
Накладывает щит на ближайших союзников, также повышая их броню.
.range: 600
.shield life: caster max life * 20%
.armour buff: caster armour * 10%
.duration: 15
..buff also removes if shield breaks
..dosent work on caster

.cooldown: 60
]]
database.NewAbility({
    id = heroes.stalker.r,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            --construct all
            local buff_id = "stalker_r"

            local buff_duration = 15
            local buffed_armour = buffs.getStat(caster, buff_id, STATS_ARMOUR)    
            local real_armour = (GetUnitArmor(caster) - buffed_armour)  -- buff dosent overlaps with self
            
            local shield = database.getShieldTemplate()
            shield.id = buff_id
            shield.life =  GetUnitMaxLife(caster) * 0.2
            shield.duration = buff_duration
            shield.events[EX_EVENT_SHIELD_BREAK] = function(caster, source, damage, shielddata)
                buffs.remove(caster, shielddata.id)
                _print("shield breaked")
            end
            shield.events[EX_EVENT_SHIELD_DAMAGE] = function(caster, source, damage, shielddata)
                _print("shield absorbed: " .. damage .. " from " .. GetUnitName(source))
            end

            local buff = database.getBuffTemplate()
            buff.id = buff_id
            buff.duration = buff_duration
            buff.source = GetUnitName(caster)
            buffs.setStat(buff, STATS_ARMOUR, real_armour * 0.1)

            local G = CreateGroup()
            GroupEnumUnitsInRange(G, GetUnitX(caster), GetUnitY(caster), 600, filters.enum.alive)
            GroupRemoveUnit(G, caster)

            while(true) do
                local target = FirstOfGroup(G)

                if(target == nil or target == NULL_UNIT)then
                    break
                end
                GroupRemoveUnit(G, target)

                --loop
                if(filters.aliveAndAlly(caster, target))then
                    --add buff
                    buffs.applyInstance(buff, target)
                    shields.applyInstance(shield, target)
                end
            end

            GroupClear(G)
            DestroyGroup(G)
        end,
    }
})
--[[
Разряд
Торкает себя ёбом, восстанавливая себе life.
.heal: 50 + (max life * (0.5 * lvl)%)

.cooldown 60
]]
database.NewAbility({
    id = heroes.stalker.t,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            local heal = 50 + (GetUnitMaxLife(caster) * 0.01) * GetHeroLevel(caster) * 0.5
            UnitAddHeal(caster, heal)
        end,
    }
})
--------------------------------------------------------------------
--@medic
--------------------------------------------------------------------
--[[
.castrange: 650
.radius: 200
.heal: int * 2

.cooldown: 1
]]
database.NewAbility({
    id = heroes.medic.q,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            local model = "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl"
            local x, y = GetSpellTargetX(), GetSpellTargetY()
            local z = GetPointZ(x, y) + 40
            local int = GetHeroInt(caster, true)
            local heal = int * 2

            projectiles.simpleground(model, caster, x, y, z, 800, 
                function(ex, ey, ez)
                    local G = CreateGroup()
                    GroupEnumUnitsInRange(G, ex, ey, 200, filters.enum.alive)

                    while(true) do
                        local target = FirstOfGroup(G)
        
                        if(target == nil or target == NULL_UNIT)then
                            break
                        end
                        GroupRemoveUnit(G, target)
        
                        --loop
                        if(filters.aliveAndAlly(caster, target))then
                            UnitAddHeal(target, heal)
                        end
                    end

                    GroupClear(G)
                    DestroyGroup(G)
                end
            )
        end,
    }
})
--[[
.castrange: 650
.radius: 150
.life regen: 2% per sec
.armour buff: int * 1
.duration: 10

.cooldown: 5
]]
database.NewAbility({
    id = heroes.medic.w,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            local model = "Abilities\\Spells\\NightElf\\TargetArtLumber\\TargetArtLumber.mdl"
            local sx, sy = GetSpellTargetX(), GetSpellTargetY()

            local buffid = "medic_w"
            local armour = GetHeroInt(caster, true)

            local buff = database.getBuffTemplate()
            buff.source = GetUnitName(caster)
            buff.id = buffid
            buff.duration = 1.2
            buffs.setStat(buff, STATS_LIFE_REGEN_PERCENT, 2)
            buffs.setStat(buff, STATS_ARMOUR, armour)

            local eff = AddSpecialEffect(model, sx, sy)
            local ticks = 10
            local timer = CreateTimer()

            local function on_timer()

                ticks = ticks - 1
                if(ticks <= 0)then
                    DestroyTimer(timer)
                    DestroyEffect(eff)
                    return
                end

                local G = CreateGroup()
                GroupEnumUnitsInRange(G, sx, sy, 150, filters.enum.alive)
    
                while(true) do
                    local target = FirstOfGroup(G)
            
                    if(target == nil or target == NULL_UNIT)then
                        break
                    end
                    GroupRemoveUnit(G, target)
            
                    if(filters.aliveAndAlly(caster, target))then
                        buffs.applyInstance(buff, target)
                    end
                end

                GroupClear(G)
                DestroyGroup(G)
            end

            TimerStart(timer, 1, true, on_timer)
        end
    }
})
--[[
.castrange: 100
.proc breakpoint: target life * 20%
.regen: target life * 10% per sec for 3 sec

.cooldown: 15
]]
database.NewAbility({
    id = heroes.medic.e,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            local model = "Abilities\\Spells\\Human\\InnerFire\\InnerFireTarget.mdl"
            local buffid = "medic_e"
            
            local buff = database.getBuffTemplate()
            buff.source = GetUnitName(caster)
            buff.id = buffid
            buff.duration = 3
            buffs.setStat(buff, STATS_LIFE_REGEN_PERCENT, 10)

            local eff = AddSpecialEffectTarget(model, target, "overhead")
            local timer = CreateTimer()

            local on_timer = function()
                if(GetUnitLifePercent(target) <= 20)then
                    DestroyEffect(eff)
                    DestroyTimer(timer)
                    buffs.applyInstance(buff, target)
                    _print("medic E activated on " .. GetUnitName(target))
                end
            end

            TimerStart(timer, TIMER_PERIOD_32, true, on_timer)
        end
    }
})
--[[
.stats: caster stats * 100%

.cooldown: 1
]]
database.NewAbility({
    id = heroes.medic.r,
    events = {
        [EX_EVENT_ABILITY_ON_ADD] = function(caster, abilityid)
            local summon = summons.alloc(caster, id_summons.medic_r.id)
            summons.hide(summon)
        end,
        [EX_EVENT_ABILITY_ON_REMOVE] = function(caster, abilityid)
            local summon = summons.get(caster, id_summons.medic_r.id)
            summons.remove(summon)
        end,
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            local summon = summons.getOrCreate(caster, id_summons.medic_r.id, GetUnitX(caster), GetUnitY(caster))
            stats.set(summon, unitstats.getUnbuffedStats(caster))
        end
    }
})
--------------------------------------------------------------------
--@summons
--------------------------------------------------------------------
database.NewAbility({
    id = id_summons.shared_abils.relocate,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            local timer = CreateTimer()
            local master = summons.getMaster(caster)
            local mx, my = GetUnitX(master), GetUnitY(master)

            TimerStart(timer, 2, false,
                function()
                    DestroyTimer(timer)
                    local newx, newy = PolarProjectionXY(mx, my, 100, GetRandomReal(0, 360))
                    SetUnitX(caster, newx)
                    SetUnitY(caster, newy)
                end
            )
        end
    }
})

database.NewAbility({
    id = id_summons.shared_abils.unsummon,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            summons.hide(caster)
        end
    }
})

database.NewAbility({
    id = id_summons.medic_r.q,
    events = {
        [EX_EVENT_ABILITY_ON_CAST] = function(caster, target, abilityid)
            local cx, cy, cz = GetUnitXYZ(caster)
            local tx, ty, tz = GetUnitXYZ(target)
            local delay = 0.5
            local timer = CreateTimer()
            local lightning = AddLightningEx("FORK", true, cx, cy, cz, tx, ty, tz)

            local on_timer = function()
                cx, cy, cz = GetUnitXYZ(caster)
                tx, ty, tz = GetUnitXYZ(target)
                MoveLightningEx(lightning, true, cx, cy, cz, tx, ty, tz)

                delay = delay - TIMER_PERIOD_32
                if(delay <= 0)then
                    DestroyLightning(lightning)
                    DestroyTimer(timer)

                    SetUnitPosition(caster, tx, ty)
                    SetUnitPosition(target, cx, cy)
                    DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", caster, "origin"))
                    DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", target, "origin"))
                end
            end

            TimerStart(timer, TIMER_PERIOD_32, true, on_timer)
        end
    }
})
--------------------------------------------------------------------
--@waves
--------------------------------------------------------------------