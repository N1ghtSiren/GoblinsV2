---
--- Generated by Luanalysis
--- Created by Siren.
--- DateTime: 07.06.2023 4:24
---


ChatCommandList.AddCommand(
        function(player, args)
          local name = GetPlayerName(player)
          Logger.SendInfo("%s is ech", name)
        end,"sends ech into chat", "-ech", "-echge", "-echpog", "-player is ech")

ChatCommandList.AddCommand(
        function(player, args)
          ChatCommandList.PrintAll(player)
        end, "shows all commands", "-gladge", "-g", "-get chat commands", "-chat commands list")

ChatCommandList.AddCommand(
        function(player, args)

          local data = Database.ReadUnit(args)
          printd(data)
          printTable(data)

        end, "reads unit from db", "-db read unit")