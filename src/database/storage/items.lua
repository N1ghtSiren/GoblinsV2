--to throw data between events
local itemdata = {}
--------------------------------------------------------------------
database.NewItem({
    id = "I000",
    icon = "ReplaceableTextures\\CommandButtons\\BTNOrbOfDarkness.blp",
    name = "��� �� �������",
    ubertip = [[���� ������� ���� ���� ���.
.����, �����, ���� -2000,
.���� ����]],
    stats = {
        [STATS_STR] = -2000,
        [STATS_AGI] = -2000,
        [STATS_INT] = -2000,
    },
})
--------------------------------------------------------------------
database.NewItem({
    id = "I001",
    icon = "ReplaceableTextures\\CommandButtons\\BTNCrystalBall.blp",
    name = "��� �� �����",
    ubertip = [[���� ������� ���� ��������
.����, �����, ���� -110%

.���� ����]],
    stats = {
        [STATS_STR_PERCENT] = -110,
        [STATS_AGI_PERCENT] = -110,
        [STATS_INT_PERCENT] = -110,
    },
})
--------------------------------------------------------------------
database.NewItem({
    id = "I002",
    icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
    name = "������������ � ������������ ������",
    ubertip = [[������ ������ 3 ������� �� 1 �������.
.���� ����]],
    events = {
        [EX_EVENT_ITEM_EQUIP] = function(caster, item)
            itemdata[item] = itemdata[item] or {}
            itemdata[item].timer = CreateTimer()
            TimerStart(itemdata[item].timer, 3, true, 
                function()
                    UnitAddStun(caster, 1)
                end
            )
        end,
        [EX_EVENT_ITEM_DROP] = function(caster, item)
            DestroyTimer(itemdata[item].timer)
        end,
        [EX_EVENT_ITEM_DEATH] = function(item)
            itemdata[item] = nil
            _print("item destroyed")
        end
    }
})