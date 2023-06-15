---
--- Generated by Luanalysis
--- Created by Siren.
--- DateTime: 07.06.2023 4:46
---

---@type table<itemSlot, number>
local item_slot_limits = {}

item_slot_limits["undefined"] = 999
item_slot_limits["none"] = 999
item_slot_limits["weapon"] = 2
item_slot_limits["armour"] = 1
item_slot_limits["set"] = 1
item_slot_limits["accessory"] = 4


---@class unitInventory
---@field owner unit
---@field equippedItems item[]

--- returns true if passed
---@param inv unitInventory
---@param item item
---@return boolean
local function HeroRestrictionPass(inv, item)
  local u = inv.owner
  local hero_restriction = item.flags.hero_unique
  local passed = hero_restriction == "none" or hero_restriction == u.hero_class

  if(passed == false)then
    Logger.SendInfoLocal(GetOwningPlayer(u), heroClassDef.GetRestrictionError(hero_restriction))
  end

  return passed
end

--- returns true if passed
---@param inv unitInventory
---@param item item
---@return boolean
local function ItemSlotLimitPass(inv, item)
  ---@type table<itemSlot, number>
  local t = {}

  --gdeto tut

  for k, v in pairs(inv.equippedItems)do
    t[v.flags.item_slot] = (t[v.flags.item_slot] or 0) + 1
  end

  local slot = item.flags.item_slot

  if(((t[slot] or 0) < item_slot_limits[slot]) == false)then
    Logger.SendInfoLocal(GetOwningPlayer(inv.owner), itemSlotDef.BuildRestriction(slot, item_slot_limits[slot]))
    return false
  end

  return true
end

--- returns true if passed
---@param inv unitInventory
---@param item item
---@return boolean
local function SingleItemPass(inv, item)
  if(item.flags.is_single == false)then return true end

  local itemid = fourci(GetItemTypeId(item))

  for _, v in pairs(inv.equippedItems) do
    local it = --[[---@type item]]v

    if(itemid == fourci(GetItemTypeId(it)))then
      Logger.SendInfoLocal(GetOwningPlayer(inv.owner), "Вы можете носить только 1 такой предмет!")
      return false
    end
  end

  return true
end

---@param inv unitInventory
---@param item item
local function AddItemStats(inv, item)
  local changes, key_list = stats.Sum(inv.owner.stats, item.stats)
  if(changes == 0)then return end

  UnitStatUpdater.Update(inv.owner, key_list)
end

---@param inv unitInventory
---@param item item
local function RemoveItemStats(inv, item)
  local changes, key_list = stats.Sub(inv.owner.stats, item.stats)
  if(changes == 0)then return end

  UnitStatUpdater.Update(inv.owner, key_list)
end

---@param inv unitInventory
---@param item item
local function InventoryAddItem(inv, item)
  table.insert(inv.equippedItems, item)
end

---@param inv unitInventory
---@param item item
local function InventoryRemoveItem(inv, item)
  tableRemoveValue(inv.equippedItems, item)
end

---@param inv unitInventory
---@param item item
local function IsItemInInventory(inv, item)
  return tableContains(inv.equippedItems, item)
end



---@param u unit
function NewUnitInventory(u)
  ---@type unitInventory
  local inv = --[[---@type unitInventory]] {}
  inv.owner = u
  inv.equippedItems = {}


  ---@param item item
  function inv:dropItem(item)
    local is_equipped = IsItemInInventory(self, item)

    if(is_equipped == false) then return end

    RemoveItemStats(self, item)
    InventoryRemoveItem(self, item)
  end

  ---@param item item
  function inv:equipItemFinally(item)
    AddItemStats(self, item)
    InventoryAddItem(self, item)
  end

  ---@param item item
  ---@return boolean
  function inv:equipItem(item)
    local pass_hero_restriction = HeroRestrictionPass(self, item)
    local pass_single_item = SingleItemPass(self, item)
    local pass_slot_limit = ItemSlotLimitPass(self, item)
    --todo: pass_item_owner

    printdf("pass_hero_restriction: %s, pass_single_item: %s, pass_slot_limit: %s", pass_hero_restriction, pass_single_item, pass_slot_limit)

    if((pass_hero_restriction and pass_single_item and pass_slot_limit) == false)then
      SetItemPosition(item, GetItemX(item), GetItemY(item))
      --
      return false
    end

    self:equipItemFinally(item)
    return true
  end



  return inv
end