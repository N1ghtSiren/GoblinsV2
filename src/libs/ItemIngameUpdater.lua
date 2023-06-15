---
--- Generated by Luanalysis
--- Created by Siren.
--- DateTime: 06.06.2023 21:15
---


---@param itemdata itemData
---@return string
local function BuildItemDescription(itemdata)
  -- description not exists in db, as we are dynamically build it and put directly to game data
  -- because right now game data is immutable between same ids
  -- if we will need to change that behaviour, desc should be built on item creation, same as any other things which can be done
  -- that also means that "component" system cannot be done, but we can make pool of items to use in runtime,
  -- so immutable game data wont be problem; cuz every item will have unique id, which is kinda bad

  local flags = itemdata.flags

  local item_type_desc= itemTypeDef.GetDescription(flags.item_type)
  local item_slot_desc = itemSlotDef.GetDescription(flags.item_slot)
  local hero_unique_desc = heroClassDef.GetRestriction(flags.hero_unique)

  local stat_descriptions = {}

  stats.ForAllKeys(function(k)
    local v = itemdata.stats[k]
    if(v ~= 0)then
      table.insert(stat_descriptions, statDef.BuildDescription(k, v))
    end
  end)


  local str_stat_list = tableToStr(stat_descriptions, "\n")

  local desc = string.format("Тип: %s", item_type_desc)

  --if item type is equipment, add restrictions
  if(flags.item_type == "equipment")then
    desc = desc .. string.format("\n%s, %s", item_slot_desc, hero_unique_desc)
  end

  if(flags.is_single)then
    desc = desc .. "\nМожет быть только один"
  end

  desc = desc .. "\n\n" .. itemdata.sign

  if(str_stat_list ~= nil and str_stat_list ~= "")then
    desc = desc .. "\n\n" .. str_stat_list
  end

  return desc
end


function UpdateItemGameData()
  local item_branch = Database.GetItemsBranchCopy()
  local bench = NewBenchmark()

  local i = 0
  bench:start()

  item_branch:foreach(function(k, v)
    ---@type itemData
    local item_data = v

    local desc = BuildItemDescription(item_data)
    local id = fourcc(item_data.id)

    SetBaseItemStringFieldById(id, ITEM_SF_ICON, item_data.icon)
    SetBaseItemStringFieldById(id, ITEM_SF_NAME, item_data.name)
    SetBaseItemStringFieldById(id, ITEM_SF_TOOLTIP_NORMAL, item_data.name)

    SetBaseItemStringFieldById(id, ITEM_SF_DESCRIPTION, desc)
    SetBaseItemStringFieldById(id, ITEM_SF_TOOLTIP_EXTENDED, desc)

    i = i + 1
    return false
  end)

  local timestamp = bench:finish()
  Logger.SendInfo("initialized %s items in %.3f seconds", i, timestamp)

end
