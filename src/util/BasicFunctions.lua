---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Siren.
--- DateTime: 22.10.2022 17:00
---

--- formats string, then prints to console
---@param msg any
function printcf(msg, ...)
  msg = string.format(msg, ...)
  printc(msg)
end

--- prints both into game and console
---@param msg any
function printd(msg)
  printc(msg)
  print(msg)
end

--------------------------------------------------------------------
--table magic
--------------------------------------------------------------------

---@generic T
---@param orig T
---@return T
function table.shadowCopy(orig)
  local copy = {}

  for k, v in pairs(orig) do
    copy[k] = v
  end

  return copy
end

---@generic T
---@param orig T
---@param copies table
---@return T
function table.deepCopy(orig, copies)
  copies = copies or {}
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    if copies[orig] then
      copy = copies[orig]
    else
      copy = {}
      copies[orig] = copy
      for orig_key, orig_value in next, orig, nil do
        copy[table.deepCopy(orig_key, copies)] = table.deepCopy(orig_value, copies)
      end
      setmetatable(copy, table.deepCopy(getmetatable(orig), copies))
    end
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

---@generic T
---@param origin T
---@param t table
---@return T
function table.merge(origin, t)
  if t == nil then return origin end

  for k, v in pairs(t) do
    if type(v) == "table" then
      if(origin[k] ~= nil and type(origin[k]) == "table")then     --same table exists in origin
        origin[k] = table.merge(origin[k], v)                     --override data
      else
        origin[k] = table.merge({}, v)                            --create new table
      end
    else
      origin[k] = v
    end
  end
  return origin
end

---@param t table
---@param value any
---@return boolean
function table.contains(t, value)
  for k, v in pairs(t) do
    if(v == value)then
      return true
    end
  end
  return false
end

---@param t table
---@param value any
---@return boolean
function table.removeValue(t, value)
  for k, v in pairs(t) do
    if(v == value)then
      t[k] = nil
      return
    end
  end
end

function printTable(t, text)
  text = text or ""
  if(t == nil)then printd("de fuck, table is nil") return end

  for k, v in pairs(t) do
    if(type(v) == "table")then
      printd(text.."table[" .. tostring(k) .. "] = " .. tostring(v))
      printTable(v, "    ") --tabs not working properly in game
    else
      printd(text.."table[" .. tostring(k) .. "] = " .. tostring(v))
    end
  end
end
--------------------------------------------------------------------
--conversions
--------------------------------------------------------------------
local TYPE_STRING = type("string")
local TYPE_NUMBER = type(1)

---string -> id
---@param str string
---@return number
local function l_fourcc(str)
  return ('>I4'):unpack(str)
end

---id -> string
---@param id number
---return string
local function l_fourci(id)
  return ('>I4'):pack(id)
end

---ensures that return will be number
---@param value string | number
---@return number
function fourcc(value)
  return type(value) == TYPE_STRING and l_fourcc(value) or value
end

---ensures that result will be string
---@param value string | number
---@return string
function fourci(value)
  return type(value) == TYPE_NUMBER and l_fourci(value) or value
end

--------------------------------------------------------------------
--math
--------------------------------------------------------------------

---@param number number
---@param min number
---@param max number
---@return number
function math.clamp(number, min, max)
  return math.min(math.max(number, min), max)
end

--------------------------------------------------------------------
-- debug
--------------------------------------------------------------------

---@return integer
function GetPlayersAlive()
  local alive = 0
  for i = 0, 15 do
    local p = Player(i)
    local is_playing = GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING
    local is_human = GetPlayerController(p) == MAP_CONTROL_USER

    if(is_playing and is_human)then
      alive = alive + 1
    end
  end

  return alive
end

-- debug module?