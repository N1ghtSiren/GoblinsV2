waves = {}

waves.start = function(wavedata)
    local timer = CreateTimer()
    local u

    local attack_x, attack_y = SPAWN_POINTS[0].x, SPAWN_POINTS[0].y

    TimerStart(timer, wavedata.spawn_interval, true,
        function()
            for k, point in pairs(SPAWN_POINTS)do
                wavedata.mob_amount = wavedata.mob_amount - 1

                u = CreateUnitEx(Player(11), wavedata.mob, point.x, point.y, 0)
                IssuePointOrder(u, "attack", attack_x, attack_y)
            end

            if(wavedata.mob_amount <= 0)then
                DestroyTimer(timer)
            end
        end
    )
end

waves.init = function(wavedata)
    _print("wave " .. wavedata.number .. " started")
    _print("wave content: " .. GetObjectName(wavedata.mob) .. " x " .. wavedata.mob_amount)
    waves.start(wavedata)
end