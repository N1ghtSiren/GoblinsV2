---
--- Generated by Luanalysis
--- Created by Siren.
--- DateTime: 07.06.2023 9:16
---

---@alias UnitOnGetDamageDelegate fun(caster: unit, source: unit, damage: number)

---@class EventUnitOnGetDamage : EventUnitBase<UnitOnGetDamageDelegate>
---@field add fun(self: EventUnitOnGetDamage, action: UnitOnGetDamageDelegate)
---@field remove fun(self: EventUnitOnGetDamage, action: UnitOnGetDamageDelegate)

---@return EventUnitOnGetDamage
function NewEventUnitOnGetDamage()
  ---@type EventUnitOnGetDamage
  local eve = --[[---@type EventUnitOnGetDamage]] NewEventUnitBase()

  ---@param caster unit
  ---@param source unit
  function eve:invoke(caster, source)
    self.is_used = true
    for i, v in ipairs(self.data)do
      v(caster, source, GetEventDamage())
    end
    self.is_used = false
  end

  return eve
end