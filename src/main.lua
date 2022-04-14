print("external main.lua goten!")

require (EXTERNAL_PATH .. "trash\\mylib")
--
require (EXTERNAL_PATH .. "globals")
--
require (EXTERNAL_PATH .. "core\\core")
--
require (EXTERNAL_PATH .. "database\\database")
--
require (EXTERNAL_PATH .. "database\\storage\\storage")
--
require (EXTERNAL_PATH .. "API\\API")
--
require (EXTERNAL_PATH .. "API\\triggers")
--
require (EXTERNAL_PATH .. "trash\\trash")
require (EXTERNAL_PATH .. "trash\\filters")
--

_print("Мапка загрузилась? поооооооооооооооооооооооооог")

CreateUnitEx(Player(0), heroes.medic.id, SPAWN_POINTS[0].x, SPAWN_POINTS[0].y, 0)
CreateUnitEx(Player(1), heroes.medic.id, SPAWN_POINTS[0].x, SPAWN_POINTS[0].y, 0)
--CreateUnitEx(Player(1), heroes.medic.id, SPAWN_POINTS[0].x, SPAWN_POINTS[0].y, 0)

TimerStart(CreateTimer(), 10, false,
    function()
        waves.init(database.getWave(1))
    end
)
--n999
--9998 'stormbolt'