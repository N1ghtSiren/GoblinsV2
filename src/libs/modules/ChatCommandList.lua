---@shape ChatCommandTokens
---@field tokens string[]
---@field depth number


---@class ChatCommand
---@field token_list ChatCommandTokens[]
---@field description string
---@field action fun(player: player, args: string): void


ChatCommandList = {}

local branch = NewBranch()


---@param str string
---@return ChatCommandTokens
ChatCommandList.SplitToTokens = function(str)
  local t = {}

  string.gsub(str, "%S+", function(d)
    table.insert(t, d)
    return nil
  end)

  return { tokens = t, depth = #t }
end

---@param tokens_a ChatCommandTokens
---@param tokens_b ChatCommandTokens
---@param depth number
---@return boolean
ChatCommandList.CompareTokens = function(tokens_a, tokens_b, depth)
  for i = 1, depth do
    if(tokens_a.tokens[i] ~= tokens_b.tokens[i])then return false end
  end

  return true
end

---@param player player
ChatCommandList.PrintAll = function(player)
  branch:foreach(function(k, v)
    ---@type ChatCommand
    local cmd = v
    local str = "chat command\n"

    for i = 1, #cmd.token_list do
      local tokens = cmd.token_list[i]
      local depth = tokens.depth
      local separator = " "
      local t_str = ""

      for j = 1, #tokens.tokens do
        t_str = t_str .. separator .. tokens.tokens[j]
      end

      --remove first space
      t_str = string.sub(t_str, #separator+1)

      str = str .. string.format("[%s] '%s': %s \n", depth, t_str, cmd.description)
    end

    Logger.SendInfoLocal(player, str .. "\n")
    --[[
    [info]: chat command
      [1] '-ech': sends ech into chat
      [1] '-echge': sends ech into chat
      [1] '-echpog': sends ech into chat
      [3] '-player is ech': sends ech into chat
    ]]
    return false
  end)
end

---@param player player
---@param str string
ChatCommandList.Process = function(player, str)
  local msg_t = ChatCommandList.SplitToTokens(str)

  branch:foreach(function(k, v)
    ---@type ChatCommand
    local cmd = v

    for i = 1, #cmd.token_list do
      local tokens = cmd.token_list[i]

      if(ChatCommandList.CompareTokens(tokens, msg_t, tokens.depth))then
        local _, last = string.find(str, tokens.tokens[tokens.depth])
        local args = string.sub(str, last+2, string.len(str))

        cmd.action(player, args)
        return true
      end
    end

    return false
  end)
end

---@param action fun(player: player, args: string): void
---@param description string
---@vararg string
ChatCommandList.AddCommand = function(action, description, ...)
  ---@type ChatCommand
  local command

  command = --[[---@type ChatCommand]] {}
  command.description = description
  command.action = action
  command.token_list = {}

  local values = tableValuesToSortedTable({...})

  for _, str in ipairs(values) do
    table.insert(command.token_list, ChatCommandList.SplitToTokens(str))
  end

  branch:insert(command)
end

return ChatCommandList