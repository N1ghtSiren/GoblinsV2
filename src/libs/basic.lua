---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Siren.
--- DateTime: 30.05.2023 17:32
---

---@alias integer number
---@alias real number

function DoNothing()

end

---@param t table
function rpairs(t)
  return function(t, i)
    i = i - 1
    if i ~= 0 then
      return i, t[i]
    end
  end, t, #t + 1
end

---@param msg any
function printd(msg)
  print(msg)
  printc(msg)
end

---@param format string
---@vararg any
function printdf(format, ...)
  printd(string.format(format, ...))
end

--- adds values into proto, overrides all existing keys
--- TY FOR USERDATA SCOPED FUNCTION BUG (self.anything -> gets anything from _G)
---@generic K, V
---@param proto table<K, V>
---@param obj table<K, V>
---@return table<K, V>
function tableAddValues(proto, obj)
  if obj == nil then return proto end

  for k, v in pairs(obj) do
    proto[k] = v
  end

  return proto
end

---ебаные генерики, как их писать то нахуй здесь
---бля ебать оверлоад надо отдельно прописывать
---@overload fun(orig)
---@generic T
---@param orig T
---@param copies table
---@return T
function tableDeepCopy(orig, copies)
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
        copy[tableDeepCopy(orig_key, copies)] = tableDeepCopy(orig_value, copies)
      end
      setmetatable(copy, tableDeepCopy(getmetatable(orig), copies))
    end
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

--- updates all values into proto
---@generic K, V
---@param proto table<K, V>
---@param obj table<K, V>
---@return table<K, V>
function tableMerge(proto, obj)
  if obj == nil then return proto end

  for k, v in pairs(obj) do
    if type(v) == "table" then
      if(proto[k] ~= nil and type(proto[k]) == "table")then     --same table exists in origin
        proto[k] = tableMerge(proto[k], v)                     --override data
      else
        proto[k] = tableMerge({}, v)                     --create new table
      end
    else
      proto[k] = v
    end
  end
  return proto
end

--- updates values in proto, only allows existing keys
---@generic T, K, V
---@param proto T
---@param obj table<K, V>
---@return T
function tableMergeStrict(proto, obj)
  if obj == nil then return proto end

  local type_table = "table"

  --only allow keys which exist in proto
  for k, v in pairs(proto)do
    -- if this key not exist - skip key
    if(obj[k] == nil)then goto aboba end
    -- if different types - skip key
    if(type(v) ~= type(obj[k]))then goto aboba end

    --if value is a table
    if(type(v) == type_table)then
      proto[k] = tableMergeStrict(proto[k], obj[k])
    else -- all other types
      proto[k] = obj[k]
    end

    ::aboba::
  end

  return proto
end

---@param t table
---@param value any
---@return boolean
function tableContains(t, value)
  for _, v in pairs(t) do
    if(v == value)then
      return true
    end
  end
  return false
end

---@param t [K, V]
---@param value any
function tableRemoveValue(t, value)
  for k, v in ipairs(t) do
    if(v == value)then
      table.remove(t, k)
      return
    end
  end
end

---@param t table
---@return void
---@overload fun(t)
function printTable(t, text)
  if(t == nil)then printd("de fuck, table is nil") return end
  text = text or ""
  local type_table = "table"
  local format = "%stable[%s] = %s"
  for k, v in pairs(t) do
    if(type(v) == type_table)then
      printd(string.format(format, text, k, v))
      printTable(v, text.."  ") --tabs not working properly in game
    else
      printd(string.format(format, text, k, v))
    end
  end
end

---@param t table
---@param separator string
---@return string
function tableToStr(t, separator)
  local str = ""
  for _, v in pairs(t) do
    str = str .. separator .. v
  end
  return string.sub(str, #separator +1)
end

---@generic V, K
---@param t table<K, V>
---@return V[]
function tableValuesToSortedTable(t)
  local values = {}
  for _, v in pairs(t) do
    table.insert(values, v)
  end
  table.sort(values)
  return values
end

---@generic V, K
---@param t table<K, V>
---@return K[]
function tableKeysToSortedTable(t)
  local keys = {}
  for k, _ in pairs(t) do
    table.insert(keys, k)
  end
  table.sort(keys)
  return keys
end


---@generic V, K
---@param t table<K, V>
---@param value V
---@param exclude_key_list K[] | nil
function tableFindKeyByValue(t, value, exclude_key_list)

  for k, v in ipairs(t)do
    if((value == v) and (exclude_key_list and tableContains(exclude_key_list, k) == false))then
      return k
    end
  end

  return nil
end

local TYPE_STRING = type("string")
local TYPE_NUMBER = type(1)

---ensures that return will be number
---@param value string | number
---@return number
function fourcc(value)
  return type(value) == TYPE_STRING and ('>I4'):unpack(value) or value
end

---ensures that result will be string
---@param value string | number
---@return string
function fourci(value)
  return type(value) == TYPE_NUMBER and ('>I4'):pack(value) or value
end

---@param number number
---@param min number
---@param max number
---@return number
function math.clamp(number, min, max)
  return math.min(math.max(number, min), max)
end

-- test area

---@return unit
function CreateUnitPal()
  return CreateUnit(Player(0), FourCC("Hpal"), 0, 0, 0)
end

---@return item
function CreateItemClaws()
  return CreateItem(FourCC("rat6"), 0, 0)
end