--cast trig
local cast_trig = CreateTrigger()
for i = 0, 11 do
    TriggerRegisterPlayerUnitEvent(cast_trig, Player(i), EVENT_PLAYER_UNIT_SPELL_EFFECT, DoNothing)
end

TriggerAddAction(cast_trig, 
    function()
        local id = GetSpellAbilityId()
        local caster = GetTriggerUnit()
        local target = GetSpellTargetUnit()
        _print("ability casted: " .. tostring(id))

        events.ability.invoke(id, EX_EVENT_ABILITY_ON_CAST, caster, target, id)
    end
)
--cast trig end

--itemequip trig
local item_equip_trig = CreateTrigger()
for i = 0, 11 do
    TriggerRegisterPlayerUnitEvent(item_equip_trig, Player(i), EVENT_PLAYER_UNIT_PICKUP_ITEM, DoNothing)
end
TriggerAddAction(item_equip_trig, 
    function()
        _print("item pickup: " .. tostring(GetManipulatedItem()) .. " id: " ..GetItemTypeId(GetManipulatedItem()))
        UnitEquipItemEx(GetTriggerUnit(), GetManipulatedItem())
    end
)
--itemequip trig end

--itemdrop trig
local item_drop_trig = CreateTrigger()
for i = 0, 11 do
    TriggerRegisterPlayerUnitEvent(item_drop_trig, Player(i), EVENT_PLAYER_UNIT_DROP_ITEM, DoNothing)
end
TriggerAddAction(item_drop_trig, 
    function()
        _print("item drop: " .. tostring(GetManipulatedItem()) .. " id: " ..GetItemTypeId(GetManipulatedItem()))
        UnitDropItemEx(GetTriggerUnit(), GetManipulatedItem())
    end
)
--itemdrop trig end

--itemdeath trig
local item_death_trig = CreateTrigger()

TriggerAddAction(item_death_trig, 
    function()
        local item = GetTriggerWidget()
        events.item.invoke(GetItemTypeId(item), EX_EVENT_ITEM_DEATH, item)
    end
)

function RegisterItemDeath(item)
    TriggerRegisterDeathEvent(item_death_trig, item)
end

--chat trig
local function chatters()
    local p = GetTriggerPlayer()
    local str = GetEventPlayerChatString()

    _print(GetPlayerName(p) .. " wrote: " .. str)
end

local chat_trig = CreateTrigger()
TriggerAddAction(chat_trig, chatters)
for i = 0, 11 do
    TriggerRegisterPlayerChatEvent( chat_trig, Player(i), "-new", false )
end
--chat trig end

--unit death trig
local death_trig = CreateTrigger()
for i = 0, 11 do
    TriggerRegisterPlayerUnitEvent(death_trig, Player(i), EVENT_PLAYER_UNIT_DEATH, DoNothing)
end
TriggerAddAction(death_trig,
    function()
        local u = GetTriggerUnit()
        if(isSummon(u))then return end 
        
        TimerStart(CreateTimer(), 20., false, 
            function()
                DestroyTimer(GetExpiredTimer())
                RemoveUnitEx(u)
            end
        )
    end
)
--unit death trig

--dr trig
local hp_abil_id = 'A001'
local aa_buff_id = 'B000'
local aa_buff_id_2 = 'Bpoi'
local dmg_trig = CreateTrigger()
TriggerAddAction(dmg_trig, 
    function()
        local target = GetTriggerUnit()
        local source = GetEventDamageSource()
        local damage = GetEventDamage()
        local is_aa = GetUnitAbilityLevel(target, aa_buff_id) > 0 or GetUnitAbilityLevel(target, aa_buff_id_2) > 0

        --bug: any buff apply does 0 damage
        if(damage <= 0.01) then return end

        if(is_aa)then
            UnitRemoveAbility(target, aa_buff_id)
            UnitRemoveAbility(target, aa_buff_id_2)
        end

        UnitAddAbility(target, hp_abil_id)

        TimerStart(CreateTimer(), 0, false, 
            function()
                DestroyTimer(GetExpiredTimer())
                UnitRemoveAbility(target, hp_abil_id)
                
                damage = damage - GetUnitArmor(target)

                --bug: negative damage will heal shields
                damage = math.max(damage, 0)
                damage = shields.work(target, source, damage)
                
                DisableTrigger(dmg_trig)

                if(UnitDamageTarget(source, target, RMaxBJ(0, damage), is_aa, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS))then
                    --damage done
                    --proc shit
                    if(is_aa)then
                        events.unit.invoke(source, EX_EVENT_UNIT_ATTACK, source, target, damage)
                    end
                    events.unit.invoke(source, EX_EVENT_UNIT_DAMAGE, source, target, damage)
                    events.unit.invoke(target, EX_EVENT_UNIT_HIT, target, source, damage)
                end 

                EnableTrigger(dmg_trig)
            end
        )
        
    end
)
function DamageReduction_Register(u)
    TriggerRegisterUnitEvent(dmg_trig, u, EVENT_UNIT_DAMAGED)
end
--dr trig end