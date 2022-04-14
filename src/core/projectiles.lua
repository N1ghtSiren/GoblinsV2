projectiles = {}

projectiles.simplehoming = function (model, caster, target, velocity, onhitfunction)
    local cx, cy, cz = GetUnitX(caster), GetUnitY(caster), GetUnitZ(caster)+40  --caster point
    local ex, ey, ez = GetUnitX(caster), GetUnitY(caster), GetUnitZ(caster)+40  --effect point
    local tx, ty, tz = GetUnitX(target), GetUnitY(target), GetUnitZ(target)+40  --target point
    local mx, my, mz = (tx+cx)/2, (ty+cy)/2, (tz+cz)/2
    local eff = AddSpecialEffect(model, ex, ey)
    local timer = CreateTimer()
    local lifetimeIncreasement = 1/(GetDistanceBetweenPointsZ(cx,cy,cz,tx,ty,tz)/(velocity/32))
    local lifetime = 0
    local dist = nil

    local function on_move()
        tx,ty,tz = GetUnitX(target),GetUnitY(target),GetUnitZ(target)
        dist = GetDistanceBetweenPointsZ(ex,ey,ez,tx,ty,tz)

        if(dist<=30)or(lifetime>1)then
            DestroyEffect(eff)
            onhitfunction()
            DestroyTimer(timer)
        end

        ex,ey,ez = BezierCurvePow2_xyz_xyz_xyz(cx, cy, cz, mx, my, mz, tx, ty, tz, lifetime)
        SetEffectPos(eff, ex, ey, ez)
        lifetime = lifetime + lifetimeIncreasement
    end

    TimerStart(timer, TIMER_PERIOD_32, true, on_move)
end

projectiles.simpleground = function (model, caster, target_x, target_y, target_z, velocity, onhitfunction)
    local cx, cy, cz = GetUnitX(caster), GetUnitY(caster), GetUnitZ(caster)+40  --caster point
    local ex, ey, ez = GetUnitX(caster), GetUnitY(caster), GetUnitZ(caster)+40  --effect point
    local tx, ty, tz = target_x, target_y, target_z
    local mx, my, mz = (tx+cx)/2, (ty+cy)/2, (tz+cz)/2
    local eff = AddSpecialEffect(model, ex, ey)
    local timer = CreateTimer()
    local lifetimeIncreasement = 1/(GetDistanceBetweenPointsZ(cx,cy,cz,tx,ty,tz)/(velocity/32))
    local lifetime = 0
    local dist = nil

    local function on_move()
        dist = GetDistanceBetweenPointsZ(ex,ey,ez,tx,ty,tz)

        if(dist<=30)or(lifetime>1)then
            DestroyEffect(eff)
            DestroyTimer(timer)
            onhitfunction(ex, ey, ez)
        end

        ex,ey,ez = BezierCurvePow2_xyz_xyz_xyz(cx, cy, cz, mx, my, mz, tx, ty, tz, lifetime)
        SetEffectPos(eff, ex, ey, ez)
        lifetime = lifetime + lifetimeIncreasement
    end

    TimerStart(timer, TIMER_PERIOD_32, true, on_move)
end