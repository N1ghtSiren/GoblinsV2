---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Siren.
--- DateTime: 31.05.2023 1:16
---

---@class branch
---@field data any[]

--- linter automatically grabs functions from their definitions
--- if i explicitly add @type N into constructor?
--[[
---@field get fun(self: branch, key: any): any
---@field set fun(self: branch, key: any, value: any): any
---@field exists fun(self: branch, key: any): boolean
---@field free fun(self: branch, key: any): boolean
---@field insert fun(self: branch, v: any): void
---@field foreach fun(self: branch, action: fun(key: any, value: any) : false|true): void
]]

---@return branch
function NewBranch()
  ---@type branch
  local branch= --[[---@type branch]]{}
  branch.data = {}

  ---@param k any
  ---@return any
  function branch:get(k)
    local v = self.data[k]

    if (v == nil) then
      Logger.SendError("branch: attempt to read empty key: %s", k)
    end

    return v
  end

  ---@param k any
  ---@param v any
  function branch:set(k, v)
    if (self.data[k] ~= nil) then
      Logger.SendError("branch: data on key already exists: %s", k)
    end

    self.data[k] = v
    return branch
  end

  ---@param k any
  ---@return boolean
  function branch:exists(k)
    return self.data[k] ~= nil
  end

  ---@param k any
  function branch:free(k)
    local v = self.data[k]

    if (v == nil) then
      Logger.SendError("branch: cannot free missing key: %s", k)
    end

    self.data[k] = nil
    return v
  end

  ---@param v any
  function branch:insert(v)
    table.insert(self.data, v)
  end

  ---breaks loop if `true` returned from action
  ---otherwise loops thru all values
  ---@param action fun(key:any, value:any) : false|true
  function branch:foreach(action)
    for k, v in pairs(self.data) do
      if(action(k, v) == true)then return end
    end
  end

  return branch
end

