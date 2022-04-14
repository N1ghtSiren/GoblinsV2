--null - unit fix
local G = CreateGroup()
NULL_UNIT = FirstOfGroup(G)
DestroyGroup(G)

-- make spellbook invisible
for i = 0, 15 do
    SetPlayerAbilityAvailable(Player(i), SPELLBOOK_ID, false)
end
--stuns
function IsUnitStunned(unit)
    return GetUnitAbilityLevel(unit, 'BPSE') >= 1
end

local dummy = CreateUnit(Player(15), 'n998', 0, 0, 0)
function UnitAddStunEx(unit)
    SetUnitX(dummy, GetUnitX(unit))
    SetUnitY(dummy, GetUnitY(unit))
    IssueTargetOrder(dummy, 'thunderbolt', unit)
end

function UnitRemoveStunEx(unit)
    UnitRemoveAbility(unit, STUN_BUFF_ID)
end

--wrappers
GetUnitArmour = GetUnitArmor
SetUnitArmour = SetUnitArmor
GetUnitZ = GetUnitFlyHeight
