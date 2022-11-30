--------------------------------------------------------------------
-- init start
--------------------------------------------------------------------

-- try init constants
SDoFile("unexpectedBehaviourFix\\unexpectedBehaviourFix.lua")

SDoFile("util\\GameConstants.lua")
SDoFile("util\\BasicFunctions.lua")
SDoFile("util\\base64.lua")
SDoFile("util\\json.lua")

SDoFile("content\\constants.lua")

SDoFile("containers\\messages\\messages.lua")

SDoFile("containers\\storage\\storage.lua")
SDoFile("containers\\stats\\stats.lua")
SDoFile("containers\\events\\events.lua")

SDoFile("containers\\database\\database.lua")

SDoFile("content\\objectdata\\abilities.lua")
SDoFile("content\\objectdata\\units.lua")
SDoFile("content\\objectdata\\items.lua")

SDoFile("containers\\privateDataRequest\\privateDataRequest.lua")

SDoFile("containers\\chatCommands\\chatCommands.lua")

SDoFile("containers\\gability\\gability.lua")
SDoFile("containers\\gitem\\gitem.lua")
SDoFile("containers\\gunit\\gunit.lua")

SDoFile("containers\\gplayer\\gplayer.lua")

SDoFile("containers\\gshop\\gshop.lua")
SDoFile("containers\\gshop\\gshoppreset.lua")

SDoFile("containers\\sync\\sync.lua")

SDoFile("containers\\saveloader\\saveloader.lua")

SDoFile("containers\\multiboard\\multiboard.lua")

-- item death trig

local function MainInit()
  messages.Send(messages.levels.info, "game started")

  gitem.InitTriggers()
  gitem.InitAllItems()
  gplayer.InitAllPlayers()
  gplayer.InitChatCommands()
  gshoppreset.InitPresets()
  multiboard.Init()
  sync.Init()

  ------------------------------------------------------------------

  for _ = 0, 10 do
    gunit.Create(10, constants.waves.w1, -1500, 0)
  end

  ------------------------------------------------------------------

  gshop.CreateShopFromPreset(constants.heroes.sniper, -200, 200, gshoppreset.preset_id.goblin_weapon_shop)
  gshop.CreateShopFromPreset(constants.heroes.demolitionist, -200, -200, gshoppreset.preset_id.goblin_armour_shop)

  ------------------------------------------------------------------

end

TimerStart(CreateTimer(), 1, false, MainInit)

--------------------------------------------------------------------
-- private logic
--------------------------------------------------------------------

--------------------------------------------------------------------
-- public functions
--------------------------------------------------------------------

--[[
deterministic table, with table.insert / table.remove
if i wanna loop thru values in pairs(t) with deterministic order - to avoid desyncs
]]