--wrappers

function GetUnitMaxLife(unit)
    return GetUnitState(unit, UNIT_STATE_MAX_LIFE)
end

function GetUnitLife(unit)
    return GetUnitState(unit, UNIT_STATE_LIFE)
end

function SetUnitLife(unit, value)
    return SetUnitState(unit, UNIT_STATE_LIFE, value)
end

function GetUnitMaxMana(unit)
    return GetUnitState(unit, UNIT_STATE_MAX_MANA)
end
function GetUnitMana(unit)
    return GetUnitState(unit, UNIT_STATE_MANA)
end

function GetUnitMana(unit)
    GetUnitState(unit, UNIT_STATE_MAX_MANA)
end

local MultiboardSetItemValue_hook = MultiboardSetItemValue
function MultiboardSetItemValue(multiboard, column, row, value)
    mbitem = MultiboardGetItem(multiboard, row, column)
    MultiboardSetItemValue_hook(mbitem, value)
    MultiboardReleaseItem(mbitem)
end

local MULTIBOARD_WIDTH_DELTA = 0.765
local MultiboardSetItemsWidth_hook = MultiboardSetItemsWidth
function MultiboardSetItemsWidth(multiboard, width)
    MultiboardSetItemsWidth_hook(multiboard, width * MULTIBOARD_WIDTH_DELTA)
end

local MultiboardSetItemWidth_hook = MultiboardSetItemWidth
function MultiboardSetItemWidth(multiboard, column, row, width)
    mbitem = MultiboardGetItem(multiboard, row, column)
    MultiboardSetItemWidth_hook(mbitem, width * MULTIBOARD_WIDTH_DELTA)
    MultiboardReleaseItem(mbitem)
end

local MultiboardSetItemStyle_hook = MultiboardSetItemStyle

function MultiboardSetItemStyle(multiboard, column, row, showValue, showIcon)
    mbitem = MultiboardGetItem(multiboard, row, column)
    MultiboardSetItemStyle_hook(mbitem, showValue, showIcon)
    MultiboardReleaseItem(mbitem)
end

function MultiboardSetItemValueWidth(multiboard, column, row, value, width)
    MultiboardSetItemValue(multiboard, column, row, value)
    MultiboardSetItemWidth(multiboard, column, row, width)
end

--end

---@param orig table
---@param copies table
---@return table
function deepcopy(orig, copies)
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
                copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
            end
            setmetatable(copy, deepcopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- int -> string
function fourcc(str)
    return ('>I4'):unpack(str)
end

--string -> int
function fourci(id)
    return ('>I4'):pack(id)
end

function MergeTables(origin, t) --n1ghtsiren
    if t == nil then return origin end
    
    for k, v in pairs(t) do
        if type(v) == "table" then
            if(origin[k] ~= nil and type(origin[k]) == "table")then     --same table exists in origin
                origin[k] = MergeTables(origin[k], v)                 --override data
            else 
                origin[k] = MergeTables({}, v)                        --create new table
            end
        else
            origin[k] = v
        end
    end
    return origin
end

function printTable(t, text)
    local text = text or ""
    if(t == nil)then print("defuck, table is nil") end

    for k, v in pairs(t) do
        if(type(v) == "table")then
            _print(text.."table[" .. tostring(k) .. "] = " .. tostring(v))
            printTable(v, "\t")
        else
            _print(text.."table[" .. tostring(k) .. "] = " .. tostring(v))
        end
    end
end

function clamp(number, min, max)
    return math.min(math.max(number, min), max)
end

function GetDistanceBetweenPointsZ(x1, y1, z1, x2, y2, z2)
    local dx = x2 - x1
    local dy = y2 - y1
    local dz = z2 - z1
    return SquareRoot(dx * dx + dy * dy + dz * dz)
end

function BezierCurvePow2_xyz_xyz_xyz(x, y, z, x1, y1, z1, x2, y2, z2, time)
    local a1 = x
    local b1 = 2 * (x1 - x)
    local c1 = x - 2 * x1 + x2
    local a2 = y
    local b2 = 2 * (y1 - y)
    local c2 = y - 2 * y1 + y2
    local a3 = z
    local b3 = 2 * (z1 - z)
    local c3 = z - 2 * z1 + z2
    local x = a1 + (b1 + c1 * time) * time
    local y = a2 + (b2 + c2 * time) * time
    local z = a3 + (b3 + c3 * time) * time
    return x, y, z
end

function GetPointZ(x, y)
    local location = Location(x, y)
    local z = GetLocationZ(location)
    RemoveLocation(location)
    return z
end

function PolarProjectionXY(x, y, dist, angle)
    local PPx = x + dist * Cos(angle * bj_DEGTORAD)
    local PPy = y + dist * Sin(angle * bj_DEGTORAD)
    return PPx, PPy
end

function GetUnitXYZ(unit)
    return GetUnitX(unit), GetUnitY(unit), GetUnitFlyHeight(unit)
end