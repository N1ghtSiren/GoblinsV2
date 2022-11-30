---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Siren.
--- DateTime: 26.11.2022 14:53
---


---@class gplayerData
---@field name string
---@field pid integer
---@field onDoDamage trigger
---@field onGetDamage trigger
---@field onItemEquip trigger
---@field onItemDrop trigger
---@field onAbilityCast trigger
---@field onUnitDeath trigger
---@field hero unit
---@field onPlayerChat trigger
---@field onPlayerLeave trigger


---@type gplayerData
local template_gplayerData = {
  name = "playerName",
  pid = nil,
  onDoDamage = nil,
  onGetDamage = nil,
  onItemEquip = nil,
  onItemDrop = nil,
  onAbilityCast = nil,
  onUnitDeath = nil,
  hero = nil,
  onPlayerLeave = nil,
}

--[[
view

alloc
init
create
validate
delete
]]

--------------------------------------------------------------------
-- private logic
--------------------------------------------------------------------

local branch = storage.CreateNewBranch(storage.branch_ids.gplayer)

privateDataRequest.register.gplayer(branch)


local function GetTemplate()
  return table.deepCopy(template_gplayerData)
end


---@param pid integer
local function Alloc(pid)
  local gplayerData = GetTemplate()
  gplayerData.pid = pid
  gplayerData.name = GetPlayerName(Player(pid))

  branch:set(pid, gplayerData)

  return gplayerData
end


---@param gplayerData gplayerData
local function Init(gplayerData)

  ---@param gpd gplayerData
  ---@param player player
  local function InitTriggers(gpd, player)
    gpd.onDoDamage = CreateTrigger()
    TriggerRegisterPlayerUnitEvent(gpd.onDoDamage, player, EVENT_PLAYER_UNIT_DAMAGING, nil)
    TriggerAddAction(gpd.onDoDamage, function()
      --events

      messages.Send(messages.levels.debug,"%s dealt %s damage", GetUnitName(GetEventDamageSource()), GetEventDamage())
    end)

    gpd.onGetDamage = CreateTrigger()
    TriggerRegisterPlayerUnitEvent(gpd.onGetDamage, player, EVENT_PLAYER_UNIT_DAMAGED, nil)
    TriggerAddAction(gpd.onGetDamage, function()
      local dmg = GetEventDamage() - GetUnitArmour(GetTriggerUnit())
      SetEventDamage(math.max(dmg, 1))

      messages.Send(messages.levels.debug,"%s received %s damage", GetUnitName(GetTriggerUnit()), GetEventDamage())
    end)

    gpd.onItemEquip = CreateTrigger()
    TriggerRegisterPlayerUnitEvent(gpd.onItemEquip, player, EVENT_PLAYER_UNIT_PICKUP_ITEM, nil)
    TriggerAddAction(gpd.onItemEquip, function()
      messages.Send(messages.levels.debug,"%s picked up item: %s", GetUnitName(GetManipulatingUnit()), GetItemName(GetManipulatedItem()))

      gunit.EquipItem(GetManipulatingUnit(), GetManipulatedItem())
    end)

    gpd.onItemDrop = CreateTrigger()
    TriggerRegisterPlayerUnitEvent(gpd.onItemDrop, player, EVENT_PLAYER_UNIT_DROP_ITEM, nil)
    TriggerAddAction(gpd.onItemDrop, function()
      messages.Send(messages.levels.debug,"%s dropped item: %s", GetUnitName(GetManipulatingUnit()), GetItemName(GetManipulatedItem()))

      gunit.DropItem(GetManipulatingUnit(), GetManipulatedItem())
    end)

    gpd.onAbilityCast = CreateTrigger()
    TriggerRegisterPlayerUnitEvent(gpd.onAbilityCast, player, EVENT_PLAYER_UNIT_SPELL_EFFECT, nil)
    TriggerAddAction(gpd.onAbilityCast, function()
      gability.Cast(GetTriggerUnit(), GetSpellTargetUnit(), GetSpellAbilityId())

      messages.Send(messages.levels.debug,"%s casted ability: %s", GetUnitName(GetTriggerUnit()), fourci(GetSpellAbilityId()))
    end)

    gpd.onUnitDeath = CreateTrigger()
    TriggerRegisterPlayerUnitEvent(gpd.onUnitDeath, player, EVENT_PLAYER_UNIT_DEATH, nil)
    TriggerAddAction(gpd.onUnitDeath, function()
      --events
      messages.Send(messages.levels.debug, "unit %s is died", GetUnitName(GetTriggerUnit()))
    end)

    gpd.onPlayerChat = CreateTrigger()
    TriggerRegisterPlayerChatEvent(gpd.onPlayerChat, player, "-", false)
    TriggerAddAction(gpd.onPlayerChat, function()
      local action, args = chatCommands.ParseChatString(GetEventPlayerChatString())

      if(action ~= nil)then
        action(GetPlayerId(GetTriggerPlayer()), args)
      end

    end)

    gpd.onPlayerLeave = CreateTrigger()
    TriggerRegisterPlayerEvent(gpd.onPlayerLeave, player, EVENT_PLAYER_LEAVE)
    TriggerAddAction(gpd.onPlayerLeave, function()
      messages.Send(messages.levels.info, "%s has left the game!", GetPlayerName(GetTriggerPlayer()))
    end)
  end

  InitTriggers(gplayerData, Player(gplayerData.pid))

end


---@param pid integer
local function Create(pid)
  local gplayerData = Alloc(pid)
  Init(gplayerData)
end


---@param pid integer
local function Delete(pid)
  --deleting triggers is EXTREMELY unsafe (which spawns a lot of nils to handle), so not doing this

  -- haha unused local warning
  pid = pid
end


local function InitAllPlayers()
  for i = 0, 15 do
    Create(i)
  end
end

--------------------------------------------------------------------

---@param pid integer
local function HasHero(pid)
  return branch:get(pid).hero ~= nil
end

---@param pid integer
local function RemovePlayerHero(pid)
  local gplayerData = branch:get(pid)

  gunit.Delete(gplayerData.hero)
  gplayerData.hero = nil
end

---@param pid integer
---@param unitid string|integer
local function CreatePlayerHero(pid, unitid)

  if(HasHero(pid))then
    messages.SendLocal(pid, messages.levels.info, "you already have hero")
    return
  end

  local function SetPlayerHero(_pid, hero)
    ---@type gplayerData
    local gplayerData = branch:get(_pid)
    gplayerData.hero = hero
  end

  local u = gunit.Create(pid, unitid, 0, 0)
  SetPlayerHero(pid, u)
  return u
end

---@param pid integer
local function RepickPlayerHero(pid)
  if(HasHero(pid) == false)then
    messages.SendLocal(pid, messages.levels.info, "you have no hero to repick ")
    return
  end

  RemovePlayerHero(pid)
end

--------------------------------------------------------------------

local hero_pick_dialog

---@param pid integer
local function ShowHeroPickDialog(pid)

  local function InitHeroPickDialog()
    if(hero_pick_dialog ~= nil) then return end

    hero_pick_dialog = DialogCreate()
    local dialogTrig = CreateTrigger()
    local table_buttons = {}
    DialogSetMessage(hero_pick_dialog, "Выберите героя: ")

    TriggerRegisterDialogEvent(dialogTrig, hero_pick_dialog)  --handle leak

    TriggerAddAction(dialogTrig, function()
      local pid = GetPlayerId(GetTriggerPlayer())
      CreatePlayerHero(pid, table_buttons[GetClickedButton()])

      DialogDisplay(GetTriggerPlayer(), hero_pick_dialog, false)
      return
    end)

    local function addButt(buttonText, buttonValue)
      local butt = DialogAddButton(hero_pick_dialog, buttonText, 0)
      table_buttons[butt] = buttonValue
    end

    addButt("Стулк", constants.heroes.stalker)
    addButt("Мёд", constants.heroes.medic)
    addButt("Ынж", constants.heroes.engineer)
    addButt("Снип", constants.heroes.sniper)
    addButt("Пулек", constants.heroes.gunner)
    addButt("Роцк", constants.heroes.racketeer)
    addButt("Пиро", constants.heroes.pyromaniac)
    addButt("Демонтажник", constants.heroes.demolitionist)
  end

  InitHeroPickDialog()

  DialogDisplay(Player(pid), hero_pick_dialog, true)
end

--------------------------------------------------------------------

local function InitChatCommands()

  chatCommands.Add("-new", function(pid, args)
    ShowHeroPickDialog(pid)
  end)

  chatCommands.Add(constants.chat_commands.manual_save_start, function(pid, args)
    saveloader.StartRecordChat(pid)
  end)

  chatCommands.Add(constants.chat_commands.manual_save_end, function(pid, args)
    local is_valid, savecode

    is_valid, savecode = saveloader.EndRecordChat(pid)
    if(is_valid == false)then
      messages.SendLocal(pid, messages.levels.info, "error while ending chat record")
      return
    end

    saveloader.LoadCode(pid, savecode)
  end)

  chatCommands.AddTwo("-cmd", "-commands", function(pid, args)
    chatCommands.PrintAllCommands(pid)
  end)

  chatCommands.Add("-repick", function(pid, args)
    RepickPlayerHero(pid)
  end)

  chatCommands.Add("-load", function(pid, args)
    saveloader.LoadFile(pid, args)
  end)

  chatCommands.Add("-save", function(pid, args)
    saveloader.SavePlayer(pid, args)
  end)

--------------------------------------------------------------------

  chatCommands.AddTwo("-handle", "-h", function(pid, args)
    messages.Send(messages.levels.debug, "handle: %s", GetHandleId(GetFirstUnitInSelection(Player(pid))))
  end)

  chatCommands.Add("-what", function(pid, args)
    messages.Send(messages.levels.debug, "what: %s", tostring(GetFirstUnitInSelection(Player(pid))))
  end)

  chatCommands.Add("-gunit", function(pid, args)
    messages.Send(messages.levels.debug, "showing gunit: ")

    local data = privateDataRequest.gunitData(GetFirstUnitInSelection(Player(pid)))
    printTable(data)
  end)

  chatCommands.Add("-db print unit", function(pid, args)
    messages.Send(messages.levels.debug, "db print unit: ")
    local data = database.units.Read(args)
    printTable(data)
  end)

  chatCommands.AddTwo("-traceback enable", "-tb e", function(pid, args)
    messages.EnableTraceback()
  end)

  chatCommands.AddTwo("-traceback disable", "-tb d", function(pid, args)
    messages.DisableTraceback()
  end)

end

--------------------------------------------------------------------
-- public functions
--------------------------------------------------------------------

gplayer = {
  InitAllPlayers = InitAllPlayers,
  InitChatCommands = InitChatCommands,
  CreatePlayerHero = CreatePlayerHero,
  HasHero = HasHero,
}