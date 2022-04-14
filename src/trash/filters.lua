filters = {}

filters.alive = function(target)
    return not IsUnitType(target, UNIT_TYPE_DEAD)
end

filters.enemy = function(caster, target)
    return IsUnitEnemy(caster, GetOwningPlayer(target))
end

filters.ally = function(caster, target)
    return IsUnitAlly(caster, GetOwningPlayer(target))
end

filters.aliveAndEnemy = function(caster, target)
    return filters.alive(target) and filters.enemy(caster, target)
end

filters.aliveAndAlly = function(caster, target)
    return filters.alive(target) and filters.ally(caster, target)
end
--------------------------------------------------------------------
--GroupEnumUnits
--------------------------------------------------------------------
filters.enum = {}

filters.enum.alive = function()
    return filters.alive(GetFilterUnit())
end