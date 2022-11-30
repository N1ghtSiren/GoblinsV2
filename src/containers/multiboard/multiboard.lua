---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Siren.
--- DateTime: 27.11.2022 16:23
---

--------------------------------------------------------------------
-- private logic
--------------------------------------------------------------------

--wrappers

local function SetItemValue(mb, row, column, value)
  local item = MultiboardGetItem(mb, row, column)
  MultiboardSetItemValue(item, value)
  MultiboardReleaseItem(item)
end

--------------------------------------------------------------------
---@type multiboard
local mb = nil

local function InitMultiboard()
  mb = CreateMultiboard()
  MultiboardSetTitleText(mb, string.format("multiboard: %s", constants.map_version))

  --dynamic
  MultiboardSetRowCount(mb, 1)
  MultiboardSetColumnCount(mb, 1)
  MultiboardSetItemsStyle(mb, true, false)
  MultiboardDisplay(mb, true)

  --game time
  local mbi_local_time = MultiboardGetItem(mb, 0, 0)
  TimerStart(CreateTimer(), 1, true, function()
    MultiboardSetItemValue(mbi_local_time, "время: " .. tostring(os.date("%H:%M:%S")))
  end)

end

--[[
игрок       | класс           | lvl
=====================================
N1ghtSiren  | снайпер         | 1
Кот         | кот             | 2
=====================================
Волна: #         | Еда: #
Время Игры: #    | Локальное время: #
]]

--------------------------------------------------------------------
-- public functions
--------------------------------------------------------------------

multiboard = {
  Init = InitMultiboard
}