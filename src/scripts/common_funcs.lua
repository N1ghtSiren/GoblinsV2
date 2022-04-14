function OrderId(orderIdString) end    
function OrderId2String(orderId) end    
function UnitId(unitIdString) end    
function UnitId2String(unitId) end    
function AbilityId(abilityIdString) end    
function AbilityId2String(abilityId) end    
function GetObjectName(objectId) end    
function GetBJMaxPlayers() end    
function GetBJPlayerNeutralVictim() end    
function GetBJPlayerNeutralExtra() end    
function GetBJMaxPlayerSlots() end    
function GetPlayerNeutralPassive() end    
function GetPlayerNeutralAggressive() end    
function Deg2Rad(degrees) end    
function Rad2Deg(radians) end    
function Sin(radians) end    
function Cos(radians) end    
function Tan(radians) end    
function Asin(y) end    
function Acos(x) end    
function Atan(x) end    
function Atan2(y, x) end    
function SquareRoot(x) end    
function Pow(x, power) end    
function MathRound(r) end    
function I2R(i) end    
function R2I(r) end    
function I2S(i) end    
function R2S(r) end    
function R2SW(r, width, precision) end    
function S2I(s) end    
function S2R(s) end    
function GetHandleId(h) end    
function SubString(source, start, end_) end    
function StringLength(s) end    
function StringCase(source, upper) end    
function StringHash(s) end    
function GetLocalizedString(source) end    
function GetLocalizedHotkey(source) end    
function SetMapName(name) end    
function SetMapDescription(description) end    
function SetTeams(teamcount) end    
function SetPlayers(playercount) end    
function DefineStartLocation(whichStartLoc, x, y) end    
function DefineStartLocationLoc(whichStartLoc, whichLocation) end    
function SetStartLocPrioCount(whichStartLoc, prioSlotCount) end    
function SetStartLocPrio(whichStartLoc, prioSlotIndex, otherStartLocIndex, priority) end    
function GetStartLocPrioSlot(whichStartLoc, prioSlotIndex) end    
function GetStartLocPrio(whichStartLoc, prioSlotIndex) end    
function SetEnemyStartLocPrioCount(whichStartLoc, prioSlotCount) end    
function SetEnemyStartLocPrio(whichStartLoc, prioSlotIndex, otherStartLocIndex, priority) end    
function SetGameTypeSupported(whichGameType, value) end    
function SetMapFlag(whichMapFlag, value) end    
function SetGamePlacement(whichPlacementType) end    
function SetGameSpeed(whichspeed) end    
function SetGameDifficulty(whichdifficulty) end    
function SetResourceDensity(whichdensity) end    
function SetCreatureDensity(whichdensity) end    
function GetTeams() end    
function GetPlayers() end    
function IsGameTypeSupported(whichGameType) end    
function GetGameTypeSelected() end    
function IsMapFlagSet(whichMapFlag) end    
function GetGamePlacement() end    
function GetGameSpeed() end    
function GetGameDifficulty() end    
function GetResourceDensity() end    
function GetCreatureDensity() end    
function GetStartLocationX(whichStartLocation) end    
function GetStartLocationY(whichStartLocation) end    
function GetStartLocationLoc(whichStartLocation) end    
function SetPlayerTeam(whichPlayer, whichTeam) end    
function SetPlayerStartLocation(whichPlayer, startLocIndex) end    
function ForcePlayerStartLocation(whichPlayer, startLocIndex) end    
function SetPlayerColor(whichPlayer, color) end    
function SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value) end    
function SetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource, rate) end    
function SetPlayerRacePreference(whichPlayer, whichRacePreference) end    
function SetPlayerRaceSelectable(whichPlayer, value) end    
function SetPlayerController(whichPlayer, controlType) end    
function SetPlayerName(whichPlayer, name) end    
function SetPlayerOnScoreScreen(whichPlayer, flag) end    
function GetPlayerTeam(whichPlayer) end    
function GetPlayerStartLocation(whichPlayer) end    
function GetPlayerColor(whichPlayer) end    
function GetPlayerSelectable(whichPlayer) end    
function GetPlayerController(whichPlayer) end    
function GetPlayerSlotState(whichPlayer) end    
function GetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource) end    
function IsPlayerRacePrefSet(whichPlayer, pref) end    
function GetPlayerName(whichPlayer) end    
function CreateTimer() end    
function DestroyTimer(whichTimer) end    
function TimerStart(whichTimer, timeout, periodic, handlerFunc) end    
function TimerGetElapsed(whichTimer) end    
function TimerGetRemaining(whichTimer) end    
function TimerGetTimeout(whichTimer) end    
function PauseTimer(whichTimer) end    
function ResumeTimer(whichTimer) end    
function GetExpiredTimer() end    
function CreateGroup() end    
function DestroyGroup(whichGroup) end    
function GroupAddUnit(whichGroup, whichUnit) end    
function GroupRemoveUnit(whichGroup, whichUnit) end    
function GroupClear(whichGroup) end    
function GroupEnumUnitsOfType(whichGroup, unitname, filter) end    
function GroupEnumUnitsOfPlayer(whichGroup, whichPlayer, filter) end    
function GroupEnumUnitsOfTypeCounted(whichGroup, unitname, filter, countLimit) end    
function GroupEnumUnitsInRect(whichGroup, r, filter) end    
function GroupEnumUnitsInRectCounted(whichGroup, r, filter, countLimit) end    
function GroupEnumUnitsInRange(whichGroup, x, y, radius, filter) end    
function GroupEnumUnitsInRangeOfLoc(whichGroup, whichLocation, radius, filter) end    
function GroupEnumUnitsInRangeCounted(whichGroup, x, y, radius, filter, countLimit) end    
function GroupEnumUnitsInRangeOfLocCounted(whichGroup, whichLocation, radius, filter, countLimit) end    
function GroupEnumUnitsSelected(whichGroup, whichPlayer, filter) end    
function GroupImmediateOrder(whichGroup, order) end    
function GroupImmediateOrderById(whichGroup, order) end    
function GroupPointOrder(whichGroup, order, x, y) end    
function GroupPointOrderLoc(whichGroup, order, whichLocation) end    
function GroupPointOrderById(whichGroup, order, x, y) end    
function GroupPointOrderByIdLoc(whichGroup, order, whichLocation) end    
function GroupTargetOrder(whichGroup, order, targetWidget) end    
function GroupTargetOrderById(whichGroup, order, targetWidget) end    
function ForGroup(whichGroup, callback) end    
function FirstOfGroup(whichGroup) end    
function CreateForce() end    
function DestroyForce(whichForce) end    
function ForceAddPlayer(whichForce, whichPlayer) end    
function ForceRemovePlayer(whichForce, whichPlayer) end    
function ForceClear(whichForce) end    
function ForceEnumPlayers(whichForce, filter) end    
function ForceEnumPlayersCounted(whichForce, filter, countLimit) end    
function ForceEnumAllies(whichForce, whichPlayer, filter) end    
function ForceEnumEnemies(whichForce, whichPlayer, filter) end    
function ForForce(whichForce, callback) end    
function Rect(minx, miny, maxx, maxy) end    
function RectFromLoc(min, max) end    
function RemoveRect(whichRect) end    
function SetRect(whichRect, minx, miny, maxx, maxy) end    
function SetRectFromLoc(whichRect, min, max) end    
function MoveRectTo(whichRect, newCenterX, newCenterY) end    
function MoveRectToLoc(whichRect, newCenterLoc) end    
function GetRectCenterX(whichRect) end    
function GetRectCenterY(whichRect) end    
function GetRectMinX(whichRect) end    
function GetRectMinY(whichRect) end    
function GetRectMaxX(whichRect) end    
function GetRectMaxY(whichRect) end    
function CreateRegion() end    
function RemoveRegion(whichRegion) end    
function RegionAddRect(whichRegion, r) end    
function RegionClearRect(whichRegion, r) end    
function RegionAddCell(whichRegion, x, y) end    
function RegionAddCellAtLoc(whichRegion, whichLocation) end    
function RegionClearCell(whichRegion, x, y) end    
function RegionClearCellAtLoc(whichRegion, whichLocation) end    
function Location(x, y) end    
function RemoveLocation(whichLocation) end    
function MoveLocation(whichLocation, newX, newY) end    
function GetLocationX(whichLocation) end    
function GetLocationY(whichLocation) end    
function GetLocationZ(whichLocation) end    
function IsUnitInRegion(whichRegion, whichUnit) end    
function IsPointInRegion(whichRegion, x, y) end    
function IsLocationInRegion(whichRegion, whichLocation) end    
function GetWorldBounds() end    
function CreateTrigger() end    
function DestroyTrigger(whichTrigger) end    
function ResetTrigger(whichTrigger) end    
function EnableTrigger(whichTrigger) end    
function DisableTrigger(whichTrigger) end    
function IsTriggerEnabled(whichTrigger) end    
function TriggerWaitOnSleeps(whichTrigger, flag) end    
function IsTriggerWaitOnSleeps(whichTrigger) end    
function GetFilterUnit() end    
function GetEnumUnit() end    
function GetFilterDestructable() end    
function GetEnumDestructable() end    
function GetFilterItem() end    
function GetEnumItem() end    
function ParseTags(taggedString) end    
function GetFilterPlayer() end    
function GetEnumPlayer() end    
function GetTriggeringTrigger() end    
function GetTriggerEventId() end    
function GetTriggerEvalCount(whichTrigger) end    
function GetTriggerExecCount(whichTrigger) end    
function ExecuteFunc(funcName) end    
function And(operandA, operandB) end    
function Or(operandA, operandB) end    
function Not(operand) end    
function Condition(func) end    
function DestroyCondition(c) end    
function Filter(func) end    
function DestroyFilter(f) end    
function DestroyBoolExpr(e) end    
function TriggerRegisterVariableEvent(whichTrigger, varName, opcode, limitval) end    
function TriggerRegisterTimerEvent(whichTrigger, timeout, periodic) end    
function TriggerRegisterTimerExpireEvent(whichTrigger, t) end    
function TriggerRegisterGameStateEvent(whichTrigger, whichState, opcode, limitval) end    
function TriggerRegisterDialogEvent(whichTrigger, whichDialog) end    
function TriggerRegisterDialogButtonEvent(whichTrigger, whichButton) end    
function GetEventGameState() end    
function TriggerRegisterGameEvent(whichTrigger, whichGameEvent) end    
function GetWinningPlayer() end    
function TriggerRegisterEnterRegion(whichTrigger, whichRegion, filter) end    
function GetTriggeringRegion() end    
function GetEnteringUnit() end    
function TriggerRegisterLeaveRegion(whichTrigger, whichRegion, filter) end    
function GetLeavingUnit() end    
function TriggerRegisterTrackableHitEvent(whichTrigger, t) end    
function TriggerRegisterTrackableTrackEvent(whichTrigger, t) end    
function TriggerRegisterCommandEvent(whichTrigger, whichAbility, order) end    
function TriggerRegisterUpgradeCommandEvent(whichTrigger, whichUpgrade) end    
function GetTriggeringTrackable() end    
function GetClickedButton() end    
function GetClickedDialog() end    
function GetTournamentFinishSoonTimeRemaining() end    
function GetTournamentFinishNowRule() end    
function GetTournamentFinishNowPlayer() end    
function GetTournamentScore(whichPlayer) end    
function GetSaveBasicFilename() end    
function TriggerRegisterPlayerEvent(whichTrigger, whichPlayer, whichPlayerEvent) end    
function GetTriggerPlayer() end    
function TriggerRegisterPlayerUnitEvent(whichTrigger, whichPlayer, whichPlayerUnitEvent, filter) end    
function GetLevelingUnit() end    
function GetLearningUnit() end    
function GetLearnedSkill() end    
function GetLearnedSkillLevel() end    
function GetRevivableUnit() end    
function GetRevivingUnit() end    
function GetAttacker() end    
function GetRescuer() end    
function GetDyingUnit() end    
function GetKillingUnit() end    
function GetDecayingUnit() end    
function GetConstructingStructure() end    
function GetCancelledStructure() end    
function GetConstructedStructure() end    
function GetResearchingUnit() end    
function GetResearched() end    
function GetTrainedUnitType() end    
function GetTrainedUnit() end    
function GetDetectedUnit() end    
function GetSummoningUnit() end    
function GetSummonedUnit() end    
function GetTransportUnit() end    
function GetLoadedUnit() end    
function GetSellingUnit() end    
function GetSoldUnit() end    
function GetBuyingUnit() end    
function GetSoldItem() end    
function GetChangingUnit() end    
function GetChangingUnitPrevOwner() end    
function GetManipulatingUnit() end    
function GetManipulatedItem() end    
function GetOrderedUnit() end    
function GetIssuedOrderId() end    
function GetOrderPointX() end    
function GetOrderPointY() end    
function GetOrderPointLoc() end    
function GetOrderTarget() end    
function GetOrderTargetDestructable() end    
function GetOrderTargetItem() end    
function GetOrderTargetUnit() end    
function GetSpellAbilityUnit() end    
function GetSpellAbilityId() end    
function GetSpellAbility() end    
function GetSpellTargetLoc() end    
function GetSpellTargetX() end    
function GetSpellTargetY() end    
function GetSpellTargetDestructable() end    
function GetSpellTargetItem() end    
function GetSpellTargetUnit() end    
function TriggerRegisterPlayerAllianceChange(whichTrigger, whichPlayer, whichAlliance) end    
function TriggerRegisterPlayerStateEvent(whichTrigger, whichPlayer, whichState, opcode, limitval) end    
function GetEventPlayerState() end    
function TriggerRegisterPlayerChatEvent(whichTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly) end    
function GetEventPlayerChatString() end    
function GetEventPlayerChatStringMatched() end    
function TriggerRegisterDeathEvent(whichTrigger, whichWidget) end    
function GetTriggerUnit() end    
function TriggerRegisterUnitStateEvent(whichTrigger, whichUnit, whichState, opcode, limitval) end    
function GetEventUnitState() end    
function TriggerRegisterUnitEvent(whichTrigger, whichUnit, whichEvent) end    
function GetEventDamage() end    
function GetEventDamageSource() end    
function GetEventDetectingPlayer() end    
function TriggerRegisterFilterUnitEvent(whichTrigger, whichUnit, whichEvent, filter) end    
function GetEventTargetUnit() end    
function TriggerRegisterUnitInRange(whichTrigger, whichUnit, range, filter) end    
function TriggerAddCondition(whichTrigger, condition) end    
function TriggerRemoveCondition(whichTrigger, whichCondition) end    
function TriggerClearConditions(whichTrigger) end    
function TriggerAddAction(whichTrigger, actionFunc) end    
function TriggerRemoveAction(whichTrigger, whichAction) end    
function TriggerClearActions(whichTrigger) end    
function TriggerSleepAction(timeout) end    
function TriggerWaitForSound(s, offset) end    
function TriggerEvaluate(whichTrigger) end    
function TriggerExecute(whichTrigger) end    
function TriggerExecuteWait(whichTrigger) end    
function TriggerSyncStart() end    
function TriggerSyncReady() end    
function GetWidgetLife(whichWidget) end    
function SetWidgetLife(whichWidget, newLife) end    
function GetWidgetX(whichWidget) end    
function GetWidgetY(whichWidget) end    
function GetTriggerWidget() end    
function CreateDestructable(objectid, x, y, face, scale, variation) end    
function CreateDestructableZ(objectid, x, y, z, face, scale, variation) end    
function CreateDeadDestructable(objectid, x, y, face, scale, variation) end    
function CreateDeadDestructableZ(objectid, x, y, z, face, scale, variation) end    
function RemoveDestructable(d) end    
function KillDestructable(d) end    
function SetDestructableInvulnerable(d, flag) end    
function IsDestructableInvulnerable(d) end    
function EnumDestructablesInRect(r, filter, actionFunc) end    
function GetDestructableTypeId(d) end    
function GetDestructableX(d) end    
function GetDestructableY(d) end    
function SetDestructableLife(d, life) end    
function GetDestructableLife(d) end    
function SetDestructableMaxLife(d, max) end    
function GetDestructableMaxLife(d) end    
function DestructableRestoreLife(d, life, birth) end    
function QueueDestructableAnimation(d, whichAnimation) end    
function SetDestructableAnimation(d, whichAnimation) end    
function SetDestructableAnimationSpeed(d, speedFactor) end    
function ShowDestructable(d, flag) end    
function GetDestructableOccluderHeight(d) end    
function SetDestructableOccluderHeight(d, height) end    
function GetDestructableName(d) end    
function GetTriggerDestructable() end    
function CreateItem(itemid, x, y) end    
function RemoveItem(whichItem) end    
function GetItemPlayer(whichItem) end    
function GetItemTypeId(i) end    
function GetItemX(i) end    
function GetItemY(i) end    
function SetItemPosition(i, x, y) end    
function SetItemDropOnDeath(whichItem, flag) end    
function SetItemDroppable(i, flag) end    
function SetItemPawnable(i, flag) end    
function SetItemPlayer(whichItem, whichPlayer, changeColor) end    
function SetItemInvulnerable(whichItem, flag) end    
function IsItemInvulnerable(whichItem) end    
function SetItemVisible(whichItem, show) end    
function IsItemVisible(whichItem) end    
function IsItemOwned(whichItem) end    
function IsItemPowerup(whichItem) end    
function IsItemSellable(whichItem) end    
function IsItemPawnable(whichItem) end    
function IsItemIdPowerup(itemId) end    
function IsItemIdSellable(itemId) end    
function IsItemIdPawnable(itemId) end    
function EnumItemsInRect(r, filter, actionFunc) end    
function GetItemLevel(whichItem) end    
function GetItemType(whichItem) end    
function SetItemDropID(whichItem, unitId) end    
function GetItemName(whichItem) end    
function GetItemCharges(whichItem) end    
function SetItemCharges(whichItem, charges) end    
function GetItemUserData(whichItem) end    
function SetItemUserData(whichItem, data) end    
function CreateUnit(id, unitid, x, y, face) end    
function CreateUnitByName(whichPlayer, unitname, x, y, face) end    
function CreateUnitAtLoc(id, unitid, whichLocation, face) end    
function CreateUnitAtLocByName(id, unitname, whichLocation, face) end    
function CreateCorpse(whichPlayer, unitid, x, y, face) end    
function KillUnit(whichUnit) end    
function RemoveUnit(whichUnit) end    
function ShowUnit(whichUnit, show) end    
function SetUnitState(whichUnit, whichUnitState, newVal) end    
function SetUnitX(whichUnit, newX) end    
function SetUnitY(whichUnit, newY) end    
function SetUnitPosition(whichUnit, newX, newY) end    
function SetUnitPositionLoc(whichUnit, whichLocation) end    
function SetUnitFacing(whichUnit, facingAngle) end    
function SetUnitFacingTimed(whichUnit, facingAngle, duration) end    
function SetUnitMoveSpeed(whichUnit, newSpeed) end    
function SetUnitFlyHeight(whichUnit, newHeight, rate) end    
function SetUnitTurnSpeed(whichUnit, newTurnSpeed) end    
function SetUnitPropWindow(whichUnit, newPropWindowAngle) end    
function SetUnitAcquireRange(whichUnit, newAcquireRange) end    
function SetUnitCreepGuard(whichUnit, creepGuard) end    
function GetUnitAcquireRange(whichUnit) end    
function GetUnitTurnSpeed(whichUnit) end    
function GetUnitPropWindow(whichUnit) end    
function GetUnitFlyHeight(whichUnit) end    
function GetUnitDefaultAcquireRange(whichUnit) end    
function GetUnitDefaultTurnSpeed(whichUnit) end    
function GetUnitDefaultPropWindow(whichUnit) end    
function GetUnitDefaultFlyHeight(whichUnit) end    
function SetUnitOwner(whichUnit, whichPlayer, changeColor) end    
function SetUnitColor(whichUnit, whichColor) end    
function SetUnitScale(whichUnit, scaleX, scaleY, scaleZ) end    
function SetUnitTimeScale(whichUnit, timeScale) end    
function SetUnitBlendTime(whichUnit, blendTime) end    
function SetUnitVertexColor(whichUnit, red, green, blue, alpha) end    
function QueueUnitAnimation(whichUnit, whichAnimation) end    
function SetUnitAnimation(whichUnit, whichAnimation) end    
function SetUnitAnimationByIndex(whichUnit, whichAnimation) end    
function SetUnitAnimationWithRarity(whichUnit, whichAnimation, rarity) end    
function AddUnitAnimationProperties(whichUnit, animProperties, add) end    
function SetUnitLookAt(whichUnit, whichBone, lookAtTarget, offsetX, offsetY, offsetZ) end    
function ResetUnitLookAt(whichUnit) end    
function SetUnitRescuable(whichUnit, byWhichPlayer, flag) end    
function SetUnitRescueRange(whichUnit, range) end    
function SetHeroStr(whichHero, newStr, permanent) end    
function SetHeroAgi(whichHero, newAgi, permanent) end    
function SetHeroInt(whichHero, newInt, permanent) end    
function GetHeroStr(whichHero, includeBonuses) end    
function GetHeroAgi(whichHero, includeBonuses) end    
function GetHeroInt(whichHero, includeBonuses) end    
function UnitStripHeroLevel(whichHero, howManyLevels) end    
function GetHeroXP(whichHero) end    
function SetHeroXP(whichHero, newXpVal, showEyeCandy) end    
function GetHeroSkillPoints(whichHero) end    
function UnitModifySkillPoints(whichHero, skillPointDelta) end    
function AddHeroXP(whichHero, xpToAdd, showEyeCandy) end    
function SetHeroLevel(whichHero, level, showEyeCandy) end    
function GetHeroLevel(whichHero) end    
function GetUnitLevel(whichUnit) end    
function GetHeroProperName(whichHero) end    
function SuspendHeroXP(whichHero, flag) end    
function IsSuspendedXP(whichHero) end    
function SelectHeroSkill(whichHero, abilcode) end    
function GetUnitAbilityLevel(whichUnit, abilcode) end    
function DecUnitAbilityLevel(whichUnit, abilcode) end    
function IncUnitAbilityLevel(whichUnit, abilcode) end    
function SetUnitAbilityLevel(whichUnit, abilcode, level) end    
function ReviveHero(whichHero, x, y, doEyecandy) end    
function ReviveHeroLoc(whichHero, loc, doEyecandy) end    
function SetUnitExploded(whichUnit, exploded) end    
function SetUnitInvulnerable(whichUnit, flag) end    
function PauseUnit(whichUnit, flag) end    
function IsUnitPaused(whichHero) end    
function SetUnitPathing(whichUnit, flag) end    
function ClearSelection() end    
function SelectUnit(whichUnit, flag) end    
function GetUnitPointValue(whichUnit) end    
function GetUnitPointValueByType(unitType) end    
function UnitAddItem(whichUnit, whichItem) end    
function UnitAddItemById(whichUnit, itemId) end    
function UnitAddItemToSlotById(whichUnit, itemId, itemSlot) end    
function UnitRemoveItem(whichUnit, whichItem) end    
function UnitRemoveItemFromSlot(whichUnit, itemSlot) end    
function UnitHasItem(whichUnit, whichItem) end    
function UnitItemInSlot(whichUnit, itemSlot) end    
function UnitInventorySize(whichUnit) end    
function UnitDropItemPoint(whichUnit, whichItem, x, y) end    
function UnitDropItemSlot(whichUnit, whichItem, slot) end    
function UnitDropItemTarget(whichUnit, whichItem, target) end    
function UnitUseItem(whichUnit, whichItem) end    
function UnitUseItemPoint(whichUnit, whichItem, x, y) end    
function UnitUseItemTarget(whichUnit, whichItem, target) end    
function GetUnitX(whichUnit) end    
function GetUnitY(whichUnit) end    
function GetUnitLoc(whichUnit) end    
function GetUnitFacing(whichUnit) end    
function GetUnitMoveSpeed(whichUnit) end    
function GetUnitDefaultMoveSpeed(whichUnit) end    
function GetUnitState(whichUnit, whichUnitState) end    
function GetOwningPlayer(whichUnit) end    
function GetUnitTypeId(whichUnit) end    
function GetUnitRace(whichUnit) end    
function GetUnitName(whichUnit) end    
function GetUnitFoodUsed(whichUnit) end    
function GetUnitFoodMade(whichUnit) end    
function GetFoodMade(unitId) end    
function GetFoodUsed(unitId) end    
function SetUnitUseFood(whichUnit, useFood) end    
function GetUnitRallyPoint(whichUnit) end    
function GetUnitRallyUnit(whichUnit) end    
function GetUnitRallyDestructable(whichUnit) end    
function IsUnitInGroup(whichUnit, whichGroup) end    
function IsUnitInForce(whichUnit, whichForce) end    
function IsUnitOwnedByPlayer(whichUnit, whichPlayer) end    
function IsUnitAlly(whichUnit, whichPlayer) end    
function IsUnitEnemy(whichUnit, whichPlayer) end    
function IsUnitVisible(whichUnit, whichPlayer) end    
function IsUnitDetected(whichUnit, whichPlayer) end    
function IsUnitInvisible(whichUnit, whichPlayer) end    
function IsUnitFogged(whichUnit, whichPlayer) end    
function IsUnitMasked(whichUnit, whichPlayer) end    
function IsUnitSelected(whichUnit, whichPlayer) end    
function IsUnitRace(whichUnit, whichRace) end    
function IsUnitType(whichUnit, whichUnitType) end    
function IsUnit(whichUnit, whichSpecifiedUnit) end    
function IsUnitInRange(whichUnit, otherUnit, distance) end    
function IsUnitInRangeXY(whichUnit, x, y, distance) end    
function IsUnitInRangeLoc(whichUnit, whichLocation, distance) end    
function IsUnitHidden(whichUnit) end    
function IsUnitIllusion(whichUnit) end    
function IsUnitInTransport(whichUnit, whichTransport) end    
function IsUnitLoaded(whichUnit) end    
function IsHeroUnitId(unitId) end    
function IsUnitIdType(unitId, whichUnitType) end    
function UnitShareVision(whichUnit, whichPlayer, share) end    
function UnitSuspendDecay(whichUnit, suspend) end    
function UnitAddType(whichUnit, whichUnitType) end    
function UnitRemoveType(whichUnit, whichUnitType) end    
function UnitAddAbility(whichUnit, abilityId) end    
function UnitRemoveAbility(whichUnit, abilityId) end    
function UnitMakeAbilityPermanent(whichUnit, permanent, abilityId) end    
function UnitRemoveBuffs(whichUnit, removePositive, removeNegative) end    
function UnitRemoveBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end    
function UnitHasBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end    
function UnitCountBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end    
function UnitAddSleep(whichUnit, add) end    
function UnitCanSleep(whichUnit) end    
function UnitAddSleepPerm(whichUnit, add) end    
function UnitCanSleepPerm(whichUnit) end    
function UnitIsSleeping(whichUnit) end    
function UnitWakeUp(whichUnit) end    
function UnitApplyTimedLife(whichUnit, buffId, duration) end    
function UnitIgnoreAlarm(whichUnit, flag) end    
function UnitIgnoreAlarmToggled(whichUnit) end    
function UnitResetCooldown(whichUnit) end    
function UnitSetConstructionProgress(whichUnit, constructionPercentage) end    
function UnitSetUpgradeProgress(whichUnit, upgradePercentage) end    
function UnitPauseTimedLife(whichUnit, flag) end    
function UnitSetUsesAltIcon(whichUnit, flag) end    
function UnitDamagePoint(whichUnit, delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType) end    
function UnitDamageTarget(whichUnit, target, amount, attack, ranged, attackType, damageType, weaponType) end    
function IssueImmediateOrder(whichUnit, order) end    
function IssueImmediateOrderById(whichUnit, order) end    
function IssuePointOrder(whichUnit, order, x, y) end    
function IssuePointOrderLoc(whichUnit, order, whichLocation) end    
function IssuePointOrderById(whichUnit, order, x, y) end    
function IssuePointOrderByIdLoc(whichUnit, order, whichLocation) end    
function IssueTargetOrder(whichUnit, order, targetWidget) end    
function IssueTargetOrderById(whichUnit, order, targetWidget) end    
function IssueInstantPointOrder(whichUnit, order, x, y, instantTargetWidget) end    
function IssueInstantPointOrderById(whichUnit, order, x, y, instantTargetWidget) end    
function IssueInstantTargetOrder(whichUnit, order, targetWidget, instantTargetWidget) end    
function IssueInstantTargetOrderById(whichUnit, order, targetWidget, instantTargetWidget) end    
function IssueBuildOrder(whichPeon, unitToBuild, x, y) end    
function IssueBuildOrderById(whichPeon, unitId, x, y) end    
function IssueNeutralImmediateOrder(forWhichPlayer, neutralStructure, unitToBuild) end    
function IssueNeutralImmediateOrderById(forWhichPlayer, neutralStructure, unitId) end    
function IssueNeutralPointOrder(forWhichPlayer, neutralStructure, unitToBuild, x, y) end    
function IssueNeutralPointOrderById(forWhichPlayer, neutralStructure, unitId, x, y) end    
function IssueNeutralTargetOrder(forWhichPlayer, neutralStructure, unitToBuild, target) end    
function IssueNeutralTargetOrderById(forWhichPlayer, neutralStructure, unitId, target) end    
function GetUnitCurrentOrder(whichUnit) end    
function SetResourceAmount(whichUnit, amount) end    
function AddResourceAmount(whichUnit, amount) end    
function GetResourceAmount(whichUnit) end    
function WaygateGetDestinationX(waygate) end    
function WaygateGetDestinationY(waygate) end    
function WaygateSetDestination(waygate, x, y) end    
function WaygateActivate(waygate, activate) end    
function WaygateIsActive(waygate) end    
function AddItemToAllStock(itemId, currentStock, stockMax) end    
function AddItemToStock(whichUnit, itemId, currentStock, stockMax) end    
function AddUnitToAllStock(unitId, currentStock, stockMax) end    
function AddUnitToStock(whichUnit, unitId, currentStock, stockMax) end    
function RemoveItemFromAllStock(itemId) end    
function RemoveItemFromStock(whichUnit, itemId) end    
function RemoveUnitFromAllStock(unitId) end    
function RemoveUnitFromStock(whichUnit, unitId) end    
function SetAllItemTypeSlots(slots) end    
function SetAllUnitTypeSlots(slots) end    
function SetItemTypeSlots(whichUnit, slots) end    
function SetUnitTypeSlots(whichUnit, slots) end    
function GetUnitUserData(whichUnit) end    
function SetUnitUserData(whichUnit, data) end    
function Player(number) end    
function GetLocalPlayer() end    
function IsPlayerAlly(whichPlayer, otherPlayer) end    
function IsPlayerEnemy(whichPlayer, otherPlayer) end    
function IsPlayerInForce(whichPlayer, whichForce) end    
function IsPlayerObserver(whichPlayer) end    
function IsVisibleToPlayer(x, y, whichPlayer) end    
function IsLocationVisibleToPlayer(whichLocation, whichPlayer) end    
function IsFoggedToPlayer(x, y, whichPlayer) end    
function IsLocationFoggedToPlayer(whichLocation, whichPlayer) end    
function IsMaskedToPlayer(x, y, whichPlayer) end    
function IsLocationMaskedToPlayer(whichLocation, whichPlayer) end    
function GetPlayerRace(whichPlayer) end    
function GetPlayerId(whichPlayer) end    
function GetPlayerUnitCount(whichPlayer, includeIncomplete) end    
function GetPlayerTypedUnitCount(whichPlayer, unitName, includeIncomplete, includeUpgrades) end    
function GetPlayerStructureCount(whichPlayer, includeIncomplete) end    
function GetPlayerState(whichPlayer, whichPlayerState) end    
function GetPlayerScore(whichPlayer, whichPlayerScore) end    
function GetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting) end    
function GetPlayerHandicap(whichPlayer) end    
function GetPlayerHandicapXP(whichPlayer) end    
function GetPlayerHandicapReviveTime(whichPlayer) end    
function GetPlayerHandicapDamage(whichPlayer) end    
function SetPlayerHandicap(whichPlayer, handicap) end    
function SetPlayerHandicapXP(whichPlayer, handicap) end    
function SetPlayerHandicapReviveTime(whichPlayer, handicap) end    
function SetPlayerHandicapDamage(whichPlayer, handicap) end    
function SetPlayerTechMaxAllowed(whichPlayer, techid, maximum) end    
function GetPlayerTechMaxAllowed(whichPlayer, techid) end    
function AddPlayerTechResearched(whichPlayer, techid, levels) end    
function SetPlayerTechResearched(whichPlayer, techid, setToLevel) end    
function GetPlayerTechResearched(whichPlayer, techid, specificonly) end    
function GetPlayerTechCount(whichPlayer, techid, specificonly) end    
function SetPlayerUnitsOwner(whichPlayer, newOwner) end    
function CripplePlayer(whichPlayer, toWhichPlayers, flag) end    
function SetPlayerAbilityAvailable(whichPlayer, abilid, avail) end    
function SetPlayerState(whichPlayer, whichPlayerState, value) end    
function RemovePlayer(whichPlayer, gameResult) end    
function CachePlayerHeroData(whichPlayer) end    
function SetFogStateRect(forWhichPlayer, whichState, where, useSharedVision) end    
function SetFogStateRadius(forWhichPlayer, whichState, centerx, centerY, radius, useSharedVision) end    
function SetFogStateRadiusLoc(forWhichPlayer, whichState, center, radius, useSharedVision) end    
function FogMaskEnable(enable) end    
function IsFogMaskEnabled() end    
function FogEnable(enable) end    
function IsFogEnabled() end    
function CreateFogModifierRect(forWhichPlayer, whichState, where, useSharedVision, afterUnits) end    
function CreateFogModifierRadius(forWhichPlayer, whichState, centerx, centerY, radius, useSharedVision, afterUnits) end    
function CreateFogModifierRadiusLoc(forWhichPlayer, whichState, center, radius, useSharedVision, afterUnits) end    
function DestroyFogModifier(whichFogModifier) end    
function FogModifierStart(whichFogModifier) end    
function FogModifierStop(whichFogModifier) end    
function VersionGet() end    
function VersionCompatible(whichVersion) end    
function VersionSupported(whichVersion) end    
function EndGame(doScoreScreen) end    
function ChangeLevel(newLevel, doScoreScreen) end    
function RestartGame(doScoreScreen) end    
function ReloadGame() end    
function SetCampaignMenuRace(r) end    
function SetCampaignMenuRaceEx(campaignIndex) end    
function ForceCampaignSelectScreen() end    
function LoadGame(saveFileName, doScoreScreen) end    
function SaveGame(saveFileName) end    
function RenameSaveDirectory(sourceDirName, destDirName) end    
function RemoveSaveDirectory(sourceDirName) end    
function CopySaveGame(sourceSaveName, destSaveName) end    
function SaveGameExists(saveName) end    
function SetMaxCheckpointSaves(maxCheckpointSaves) end    
function SaveGameCheckpoint(saveFileName, showWindow) end    
function SyncSelections() end    
function SetFloatGameState(whichFloatGameState, value) end    
function GetFloatGameState(whichFloatGameState) end    
function SetIntegerGameState(whichIntegerGameState, value) end    
function GetIntegerGameState(whichIntegerGameState) end    
function SetTutorialCleared(cleared) end    
function SetMissionAvailable(campaignNumber, missionNumber, available) end    
function SetCampaignAvailable(campaignNumber, available) end    
function SetOpCinematicAvailable(campaignNumber, available) end    
function SetEdCinematicAvailable(campaignNumber, available) end    
function GetDefaultDifficulty() end    
function SetDefaultDifficulty(g) end    
function SetCustomCampaignButtonVisible(whichButton, visible) end    
function GetCustomCampaignButtonVisible(whichButton) end    
function DoNotSaveReplay() end    
function DialogCreate() end    
function DialogDestroy(whichDialog) end    
function DialogClear(whichDialog) end    
function DialogSetMessage(whichDialog, messageText) end    
function DialogAddButton(whichDialog, buttonText, hotkey) end    
function DialogAddQuitButton(whichDialog, doScoreScreen, buttonText, hotkey) end    
function DialogDisplay(whichPlayer, whichDialog, flag) end    
function ReloadGameCachesFromDisk() end    
function InitGameCache(campaignFile) end    
function SaveGameCache(whichCache) end    
function StoreInteger(cache, missionKey, key, value) end    
function StoreReal(cache, missionKey, key, value) end    
function StoreBoolean(cache, missionKey, key, value) end    
function StoreUnit(cache, missionKey, key, whichUnit) end    
function StoreString(cache, missionKey, key, value) end    
function HaveStoredInteger(cache, missionKey, key) end    
function HaveStoredReal(cache, missionKey, key) end    
function HaveStoredBoolean(cache, missionKey, key) end    
function HaveStoredUnit(cache, missionKey, key) end    
function HaveStoredString(cache, missionKey, key) end    
function FlushGameCache(cache) end    
function FlushStoredMission(cache, missionKey) end    
function FlushStoredInteger(cache, missionKey, key) end    
function FlushStoredReal(cache, missionKey, key) end    
function FlushStoredBoolean(cache, missionKey, key) end    
function FlushStoredUnit(cache, missionKey, key) end    
function FlushStoredString(cache, missionKey, key) end    
function GetStoredInteger(cache, missionKey, key) end    
function GetStoredReal(cache, missionKey, key) end    
function GetStoredBoolean(cache, missionKey, key) end    
function GetStoredString(cache, missionKey, key) end    
function RestoreUnit(cache, missionKey, key, forWhichPlayer, x, y, facing) end    
function InitHashtable() end    
function SaveInteger(table, parentKey, childKey, value) end    
function SaveReal(table, parentKey, childKey, value) end    
function SaveBoolean(table, parentKey, childKey, value) end    
function SaveStr(table, parentKey, childKey, value) end    
function SavePlayerHandle(table, parentKey, childKey, whichPlayer) end    
function SaveWidgetHandle(table, parentKey, childKey, whichWidget) end    
function SaveDestructableHandle(table, parentKey, childKey, whichDestructable) end    
function SaveItemHandle(table, parentKey, childKey, whichItem) end    
function SaveUnitHandle(table, parentKey, childKey, whichUnit) end    
function SaveAbilityHandle(table, parentKey, childKey, whichAbility) end    
function SaveTimerHandle(table, parentKey, childKey, whichTimer) end    
function SaveTriggerHandle(table, parentKey, childKey, whichTrigger) end    
function SaveTriggerConditionHandle(table, parentKey, childKey, whichTriggercondition) end    
function SaveTriggerActionHandle(table, parentKey, childKey, whichTriggeraction) end    
function SaveTriggerEventHandle(table, parentKey, childKey, whichEvent) end    
function SaveForceHandle(table, parentKey, childKey, whichForce) end    
function SaveGroupHandle(table, parentKey, childKey, whichGroup) end    
function SaveLocationHandle(table, parentKey, childKey, whichLocation) end    
function SaveRectHandle(table, parentKey, childKey, whichRect) end    
function SaveBooleanExprHandle(table, parentKey, childKey, whichBoolexpr) end    
function SaveSoundHandle(table, parentKey, childKey, whichSound) end    
function SaveEffectHandle(table, parentKey, childKey, whichEffect) end    
function SaveUnitPoolHandle(table, parentKey, childKey, whichUnitpool) end    
function SaveItemPoolHandle(table, parentKey, childKey, whichItempool) end    
function SaveQuestHandle(table, parentKey, childKey, whichQuest) end    
function SaveQuestItemHandle(table, parentKey, childKey, whichQuestitem) end    
function SaveDefeatConditionHandle(table, parentKey, childKey, whichDefeatcondition) end    
function SaveTimerDialogHandle(table, parentKey, childKey, whichTimerdialog) end    
function SaveLeaderboardHandle(table, parentKey, childKey, whichLeaderboard) end    
function SaveMultiboardHandle(table, parentKey, childKey, whichMultiboard) end    
function SaveMultiboardItemHandle(table, parentKey, childKey, whichMultiboarditem) end    
function SaveTrackableHandle(table, parentKey, childKey, whichTrackable) end    
function SaveDialogHandle(table, parentKey, childKey, whichDialog) end    
function SaveButtonHandle(table, parentKey, childKey, whichButton) end    
function SaveTextTagHandle(table, parentKey, childKey, whichTexttag) end    
function SaveLightningHandle(table, parentKey, childKey, whichLightning) end    
function SaveImageHandle(table, parentKey, childKey, whichImage) end    
function SaveUbersplatHandle(table, parentKey, childKey, whichUbersplat) end    
function SaveRegionHandle(table, parentKey, childKey, whichRegion) end    
function SaveFogStateHandle(table, parentKey, childKey, whichFogState) end    
function SaveFogModifierHandle(table, parentKey, childKey, whichFogModifier) end    
function SaveAgentHandle(table, parentKey, childKey, whichAgent) end    
function SaveHashtableHandle(table, parentKey, childKey, whichHashtable) end    
function SaveFrameHandle(table, parentKey, childKey, whichFrameHandle) end    
function LoadInteger(table, parentKey, childKey) end    
function LoadReal(table, parentKey, childKey) end    
function LoadBoolean(table, parentKey, childKey) end    
function LoadStr(table, parentKey, childKey) end    
function LoadPlayerHandle(table, parentKey, childKey) end    
function LoadWidgetHandle(table, parentKey, childKey) end    
function LoadDestructableHandle(table, parentKey, childKey) end    
function LoadItemHandle(table, parentKey, childKey) end    
function LoadUnitHandle(table, parentKey, childKey) end    
function LoadAbilityHandle(table, parentKey, childKey) end    
function LoadTimerHandle(table, parentKey, childKey) end    
function LoadTriggerHandle(table, parentKey, childKey) end    
function LoadTriggerConditionHandle(table, parentKey, childKey) end    
function LoadTriggerActionHandle(table, parentKey, childKey) end    
function LoadTriggerEventHandle(table, parentKey, childKey) end    
function LoadForceHandle(table, parentKey, childKey) end    
function LoadGroupHandle(table, parentKey, childKey) end    
function LoadLocationHandle(table, parentKey, childKey) end    
function LoadRectHandle(table, parentKey, childKey) end    
function LoadBooleanExprHandle(table, parentKey, childKey) end    
function LoadSoundHandle(table, parentKey, childKey) end    
function LoadEffectHandle(table, parentKey, childKey) end    
function LoadUnitPoolHandle(table, parentKey, childKey) end    
function LoadItemPoolHandle(table, parentKey, childKey) end    
function LoadQuestHandle(table, parentKey, childKey) end    
function LoadQuestItemHandle(table, parentKey, childKey) end    
function LoadDefeatConditionHandle(table, parentKey, childKey) end    
function LoadTimerDialogHandle(table, parentKey, childKey) end    
function LoadLeaderboardHandle(table, parentKey, childKey) end    
function LoadMultiboardHandle(table, parentKey, childKey) end    
function LoadMultiboardItemHandle(table, parentKey, childKey) end    
function LoadTrackableHandle(table, parentKey, childKey) end    
function LoadDialogHandle(table, parentKey, childKey) end    
function LoadButtonHandle(table, parentKey, childKey) end    
function LoadTextTagHandle(table, parentKey, childKey) end    
function LoadLightningHandle(table, parentKey, childKey) end    
function LoadImageHandle(table, parentKey, childKey) end    
function LoadUbersplatHandle(table, parentKey, childKey) end    
function LoadRegionHandle(table, parentKey, childKey) end    
function LoadFogStateHandle(table, parentKey, childKey) end    
function LoadFogModifierHandle(table, parentKey, childKey) end    
function LoadHashtableHandle(table, parentKey, childKey) end    
function LoadFrameHandle(table, parentKey, childKey) end    
function HaveSavedInteger(table, parentKey, childKey) end    
function HaveSavedReal(table, parentKey, childKey) end    
function HaveSavedBoolean(table, parentKey, childKey) end    
function HaveSavedString(table, parentKey, childKey) end    
function HaveSavedHandle(table, parentKey, childKey) end    
function RemoveSavedInteger(table, parentKey, childKey) end    
function RemoveSavedReal(table, parentKey, childKey) end    
function RemoveSavedBoolean(table, parentKey, childKey) end    
function RemoveSavedString(table, parentKey, childKey) end    
function RemoveSavedHandle(table, parentKey, childKey) end    
function FlushParentHashtable(table) end    
function FlushChildHashtable(table, parentKey) end    
function GetRandomInt(lowBound, highBound) end    
function GetRandomReal(lowBound, highBound) end    
function CreateUnitPool() end    
function DestroyUnitPool(whichPool) end    
function UnitPoolAddUnitType(whichPool, unitId, weight) end    
function UnitPoolRemoveUnitType(whichPool, unitId) end    
function PlaceRandomUnit(whichPool, forWhichPlayer, x, y, facing) end    
function CreateItemPool() end    
function DestroyItemPool(whichItemPool) end    
function ItemPoolAddItemType(whichItemPool, itemId, weight) end    
function ItemPoolRemoveItemType(whichItemPool, itemId) end    
function PlaceRandomItem(whichItemPool, x, y) end    
function ChooseRandomCreep(level) end    
function ChooseRandomNPBuilding() end    
function ChooseRandomItem(level) end    
function ChooseRandomItemEx(whichType, level) end    
function SetRandomSeed(seed) end    
function SetTerrainFog(a, b, c, d, e) end    
function ResetTerrainFog() end    
function SetUnitFog(a, b, c, d, e) end    
function SetTerrainFogEx(style, zstart, zend, density, red, green, blue) end    
function DisplayTextToPlayer(toPlayer, x, y, message) end    
function DisplayTimedTextToPlayer(toPlayer, x, y, duration, message) end    
function DisplayTimedTextFromPlayer(toPlayer, x, y, duration, message) end    
function ClearTextMessages() end    
function SetDayNightModels(terrainDNCFile, unitDNCFile) end    
function SetPortraitLight(portraitDNCFile) end    
function SetSkyModel(skyModelFile) end    
function EnableUserControl(b) end    
function EnableUserUI(b) end    
function SuspendTimeOfDay(b) end    
function SetTimeOfDayScale(r) end    
function GetTimeOfDayScale() end    
function ShowInterface(flag, fadeDuration) end    
function PauseGame(flag) end    
function UnitAddIndicator(whichUnit, red, green, blue, alpha) end    
function AddIndicator(whichWidget, red, green, blue, alpha) end    
function PingMinimap(x, y, duration) end    
function PingMinimapEx(x, y, duration, red, green, blue, extraEffects) end    
function CreateMinimapIconOnUnit(whichUnit, red, green, blue, pingPath, fogVisibility) end    
function CreateMinimapIconAtLoc(where, red, green, blue, pingPath, fogVisibility) end    
function CreateMinimapIcon(x, y, red, green, blue, pingPath, fogVisibility) end    
function SkinManagerGetLocalPath(key) end    
function DestroyMinimapIcon(pingId) end    
function SetMinimapIconVisible(whichMinimapIcon, visible) end    
function SetMinimapIconOrphanDestroy(whichMinimapIcon, doDestroy) end    
function EnableOcclusion(flag) end    
function SetIntroShotText(introText) end    
function SetIntroShotModel(introModelPath) end    
function EnableWorldFogBoundary(b) end    
function PlayModelCinematic(modelName) end    
function PlayCinematic(movieName) end    
function ForceUIKey(key) end    
function ForceUICancel() end    
function DisplayLoadDialog() end    
function SetAltMinimapIcon(iconPath) end    
function DisableRestartMission(flag) end    
function CreateTextTag() end    
function DestroyTextTag(t) end    
function SetTextTagText(t, s, height) end    
function SetTextTagPos(t, x, y, heightOffset) end    
function SetTextTagPosUnit(t, whichUnit, heightOffset) end    
function SetTextTagColor(t, red, green, blue, alpha) end    
function SetTextTagVelocity(t, xvel, yvel) end    
function SetTextTagVisibility(t, flag) end    
function SetTextTagSuspended(t, flag) end    
function SetTextTagPermanent(t, flag) end    
function SetTextTagAge(t, age) end    
function SetTextTagLifespan(t, lifespan) end    
function SetTextTagFadepoint(t, fadepoint) end    
function SetReservedLocalHeroButtons(reserved) end    
function GetAllyColorFilterState() end    
function SetAllyColorFilterState(state) end    
function GetCreepCampFilterState() end    
function SetCreepCampFilterState(state) end    
function EnableMinimapFilterButtons(enableAlly, enableCreep) end    
function EnableDragSelect(state, ui) end    
function EnablePreSelect(state, ui) end    
function EnableSelect(state, ui) end    
function CreateTrackable(trackableModelPath, x, y, facing) end    
function CreateQuest() end    
function DestroyQuest(whichQuest) end    
function QuestSetTitle(whichQuest, title) end    
function QuestSetDescription(whichQuest, description) end    
function QuestSetIconPath(whichQuest, iconPath) end    
function QuestSetRequired(whichQuest, required) end    
function QuestSetCompleted(whichQuest, completed) end    
function QuestSetDiscovered(whichQuest, discovered) end    
function QuestSetFailed(whichQuest, failed) end    
function QuestSetEnabled(whichQuest, enabled) end    
function IsQuestRequired(whichQuest) end    
function IsQuestCompleted(whichQuest) end    
function IsQuestDiscovered(whichQuest) end    
function IsQuestFailed(whichQuest) end    
function IsQuestEnabled(whichQuest) end    
function QuestCreateItem(whichQuest) end    
function QuestItemSetDescription(whichQuestItem, description) end    
function QuestItemSetCompleted(whichQuestItem, completed) end    
function IsQuestItemCompleted(whichQuestItem) end    
function CreateDefeatCondition() end    
function DestroyDefeatCondition(whichCondition) end    
function DefeatConditionSetDescription(whichCondition, description) end    
function FlashQuestDialogButton() end    
function ForceQuestDialogUpdate() end    
function CreateTimerDialog(t) end    
function DestroyTimerDialog(whichDialog) end    
function TimerDialogSetTitle(whichDialog, title) end    
function TimerDialogSetTitleColor(whichDialog, red, green, blue, alpha) end    
function TimerDialogSetTimeColor(whichDialog, red, green, blue, alpha) end    
function TimerDialogSetSpeed(whichDialog, speedMultFactor) end    
function TimerDialogDisplay(whichDialog, display) end    
function IsTimerDialogDisplayed(whichDialog) end    
function TimerDialogSetRealTimeRemaining(whichDialog, timeRemaining) end    
function CreateLeaderboard() end    
function DestroyLeaderboard(lb) end    
function LeaderboardDisplay(lb, show) end    
function IsLeaderboardDisplayed(lb) end    
function LeaderboardGetItemCount(lb) end    
function LeaderboardSetSizeByItemCount(lb, count) end    
function LeaderboardAddItem(lb, label, value, p) end    
function LeaderboardRemoveItem(lb, index) end    
function LeaderboardRemovePlayerItem(lb, p) end    
function LeaderboardClear(lb) end    
function LeaderboardSortItemsByValue(lb, ascending) end    
function LeaderboardSortItemsByPlayer(lb, ascending) end    
function LeaderboardSortItemsByLabel(lb, ascending) end    
function LeaderboardHasPlayerItem(lb, p) end    
function LeaderboardGetPlayerIndex(lb, p) end    
function LeaderboardSetLabel(lb, label) end    
function LeaderboardGetLabelText(lb) end    
function PlayerSetLeaderboard(toPlayer, lb) end    
function PlayerGetLeaderboard(toPlayer) end    
function LeaderboardSetLabelColor(lb, red, green, blue, alpha) end    
function LeaderboardSetValueColor(lb, red, green, blue, alpha) end    
function LeaderboardSetStyle(lb, showLabel, showNames, showValues, showIcons) end    
function LeaderboardSetItemValue(lb, whichItem, val) end    
function LeaderboardSetItemLabel(lb, whichItem, val) end    
function LeaderboardSetItemStyle(lb, whichItem, showLabel, showValue, showIcon) end    
function LeaderboardSetItemLabelColor(lb, whichItem, red, green, blue, alpha) end    
function LeaderboardSetItemValueColor(lb, whichItem, red, green, blue, alpha) end    
function CreateMultiboard() end    
function DestroyMultiboard(lb) end    
function MultiboardDisplay(lb, show) end    
function IsMultiboardDisplayed(lb) end    
function MultiboardMinimize(lb, minimize) end    
function IsMultiboardMinimized(lb) end    
function MultiboardClear(lb) end    
function MultiboardSetTitleText(lb, label) end    
function MultiboardGetTitleText(lb) end    
function MultiboardSetTitleTextColor(lb, red, green, blue, alpha) end    
function MultiboardGetRowCount(lb) end    
function MultiboardGetColumnCount(lb) end    
function MultiboardSetColumnCount(lb, count) end    
function MultiboardSetRowCount(lb, count) end    
function MultiboardSetItemsStyle(lb, showValues, showIcons) end    
function MultiboardSetItemsValue(lb, value) end    
function MultiboardSetItemsValueColor(lb, red, green, blue, alpha) end    
function MultiboardSetItemsWidth(lb, width) end    
function MultiboardSetItemsIcon(lb, iconPath) end    
function MultiboardGetItem(lb, row, column) end    
function MultiboardReleaseItem(mbi) end    
function MultiboardSetItemStyle(mbi, showValue, showIcon) end    
function MultiboardSetItemValue(mbi, val) end    
function MultiboardSetItemValueColor(mbi, red, green, blue, alpha) end    
function MultiboardSetItemWidth(mbi, width) end    
function MultiboardSetItemIcon(mbi, iconFileName) end    
function MultiboardSuppressDisplay(flag) end    
function SetCameraPosition(x, y) end    
function SetCameraQuickPosition(x, y) end    
function SetCameraBounds(x1, y1, x2, y2, x3, y3, x4, y4) end    
function StopCamera() end    
function ResetToGameCamera(duration) end    
function PanCameraTo(x, y) end    
function PanCameraToTimed(x, y, duration) end    
function PanCameraToWithZ(x, y, zOffsetDest) end    
function PanCameraToTimedWithZ(x, y, zOffsetDest, duration) end    
function SetCinematicCamera(cameraModelFile) end    
function SetCameraRotateMode(x, y, radiansToSweep, duration) end    
function SetCameraField(whichField, value, duration) end    
function AdjustCameraField(whichField, offset, duration) end    
function SetCameraTargetController(whichUnit, xoffset, yoffset, inheritOrientation) end    
function SetCameraOrientController(whichUnit, xoffset, yoffset) end    
function CreateCameraSetup() end    
function CameraSetupSetField(whichSetup, whichField, value, duration) end    
function CameraSetupGetField(whichSetup, whichField) end    
function CameraSetupSetDestPosition(whichSetup, x, y, duration) end    
function CameraSetupGetDestPositionLoc(whichSetup) end    
function CameraSetupGetDestPositionX(whichSetup) end    
function CameraSetupGetDestPositionY(whichSetup) end    
function CameraSetupApply(whichSetup, doPan, panTimed) end    
function CameraSetupApplyWithZ(whichSetup, zDestOffset) end    
function CameraSetupApplyForceDuration(whichSetup, doPan, forceDuration) end    
function CameraSetupApplyForceDurationWithZ(whichSetup, zDestOffset, forceDuration) end    
function CameraSetTargetNoise(mag, velocity) end    
function CameraSetSourceNoise(mag, velocity) end    
function CameraSetTargetNoiseEx(mag, velocity, vertOnly) end    
function CameraSetSourceNoiseEx(mag, velocity, vertOnly) end    
function CameraSetSmoothingFactor(factor) end    
function CameraSetFocalDistance(distance) end    
function CameraSetDepthOfFieldScale(scale) end    
function SetCineFilterTexture(filename) end    
function SetCineFilterBlendMode(whichMode) end    
function SetCineFilterTexMapFlags(whichFlags) end    
function SetCineFilterStartUV(minu, minv, maxu, maxv) end    
function SetCineFilterEndUV(minu, minv, maxu, maxv) end    
function SetCineFilterStartColor(red, green, blue, alpha) end    
function SetCineFilterEndColor(red, green, blue, alpha) end    
function SetCineFilterDuration(duration) end    
function DisplayCineFilter(flag) end    
function IsCineFilterDisplayed() end    
function SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration) end    
function EndCinematicScene() end    
function ForceCinematicSubtitles(flag) end    
function SetCinematicAudio(cinematicAudio) end    
function GetCameraMargin(whichMargin) end    
function GetCameraBoundMinX() end    
function GetCameraBoundMinY() end    
function GetCameraBoundMaxX() end    
function GetCameraBoundMaxY() end    
function GetCameraField(whichField) end    
function GetCameraTargetPositionX() end    
function GetCameraTargetPositionY() end    
function GetCameraTargetPositionZ() end    
function GetCameraTargetPositionLoc() end    
function GetCameraEyePositionX() end    
function GetCameraEyePositionY() end    
function GetCameraEyePositionZ() end    
function GetCameraEyePositionLoc() end    
function NewSoundEnvironment(environmentName) end    
function CreateSound(fileName, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate, eaxSetting) end    
function CreateSoundFilenameWithLabel(fileName, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate, SLKEntryName) end    
function CreateSoundFromLabel(soundLabel, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate) end    
function CreateMIDISound(soundLabel, fadeInRate, fadeOutRate) end    
function SetSoundParamsFromLabel(soundHandle, soundLabel) end    
function SetSoundDistanceCutoff(soundHandle, cutoff) end    
function SetSoundChannel(soundHandle, channel) end    
function SetSoundVolume(soundHandle, volume) end    
function SetSoundPitch(soundHandle, pitch) end    
function SetSoundPlayPosition(soundHandle, millisecs) end    
function SetSoundDistances(soundHandle, minDist, maxDist) end    
function SetSoundConeAngles(soundHandle, inside, outside, outsideVolume) end    
function SetSoundConeOrientation(soundHandle, x, y, z) end    
function SetSoundPosition(soundHandle, x, y, z) end    
function SetSoundVelocity(soundHandle, x, y, z) end    
function AttachSoundToUnit(soundHandle, whichUnit) end    
function StartSound(soundHandle) end    
function StopSound(soundHandle, killWhenDone, fadeOut) end    
function KillSoundWhenDone(soundHandle) end    
function SetMapMusic(musicName, random, index) end    
function ClearMapMusic() end    
function PlayMusic(musicName) end    
function PlayMusicEx(musicName, frommsecs, fadeinmsecs) end    
function StopMusic(fadeOut) end    
function ResumeMusic() end    
function PlayThematicMusic(musicFileName) end    
function PlayThematicMusicEx(musicFileName, frommsecs) end    
function EndThematicMusic() end    
function SetMusicVolume(volume) end    
function SetMusicPlayPosition(millisecs) end    
function SetThematicMusicVolume(volume) end    
function SetThematicMusicPlayPosition(millisecs) end    
function SetSoundDuration(soundHandle, duration) end    
function GetSoundDuration(soundHandle) end    
function GetSoundFileDuration(musicFileName) end    
function VolumeGroupSetVolume(vgroup, scale) end    
function VolumeGroupReset() end    
function GetSoundIsPlaying(soundHandle) end    
function GetSoundIsLoading(soundHandle) end    
function RegisterStackedSound(soundHandle, byPosition, rectwidth, rectheight) end    
function UnregisterStackedSound(soundHandle, byPosition, rectwidth, rectheight) end    
function SetSoundFacialAnimationLabel(soundHandle, animationLabel) end    
function SetSoundFacialAnimationGroupLabel(soundHandle, groupLabel) end    
function SetSoundFacialAnimationSetFilepath(soundHandle, animationSetFilepath) end    
function SetDialogueSpeakerNameKey(soundHandle, speakerName) end    
function GetDialogueSpeakerNameKey(soundHandle) end    
function SetDialogueTextKey(soundHandle, dialogueText) end    
function GetDialogueTextKey(soundHandle) end    
function AddWeatherEffect(where, effectID) end    
function RemoveWeatherEffect(whichEffect) end    
function EnableWeatherEffect(whichEffect, enable) end    
function TerrainDeformCrater(x, y, radius, depth, duration, permanent) end    
function TerrainDeformRipple(x, y, radius, depth, duration, count, spaceWaves, timeWaves, radiusStartPct, limitNeg) end    
function TerrainDeformWave(x, y, dirX, dirY, distance, speed, radius, depth, trailTime, count) end    
function TerrainDeformRandom(x, y, radius, minDelta, maxDelta, duration, updateInterval) end    
function TerrainDeformStop(deformation, duration) end    
function TerrainDeformStopAll() end    
function AddSpecialEffect(modelName, x, y) end    
function AddSpecialEffectLoc(modelName, where) end    
function AddSpecialEffectTarget(modelName, targetWidget, attachPointName) end    
function DestroyEffect(whichEffect) end    
function AddSpellEffect(abilityString, t, x, y) end    
function AddSpellEffectLoc(abilityString, t, where) end    
function AddSpellEffectById(abilityId, t, x, y) end    
function AddSpellEffectByIdLoc(abilityId, t, where) end    
function AddSpellEffectTarget(modelName, t, targetWidget, attachPoint) end    
function AddSpellEffectTargetById(abilityId, t, targetWidget, attachPoint) end    
function AddLightning(codeName, checkVisibility, x1, y1, x2, y2) end    
function AddLightningEx(codeName, checkVisibility, x1, y1, z1, x2, y2, z2) end    
function DestroyLightning(whichBolt) end    
function MoveLightning(whichBolt, checkVisibility, x1, y1, x2, y2) end    
function MoveLightningEx(whichBolt, checkVisibility, x1, y1, z1, x2, y2, z2) end    
function GetLightningColorA(whichBolt) end    
function GetLightningColorR(whichBolt) end    
function GetLightningColorG(whichBolt) end    
function GetLightningColorB(whichBolt) end    
function SetLightningColor(whichBolt, r, g, b, a) end    
function GetAbilityEffect(abilityString, t, index) end    
function GetAbilityEffectById(abilityId, t, index) end    
function GetAbilitySound(abilityString, t) end    
function GetAbilitySoundById(abilityId, t) end    
function GetTerrainCliffLevel(x, y) end    
function SetWaterBaseColor(red, green, blue, alpha) end    
function SetWaterDeforms(val) end    
function GetTerrainType(x, y) end    
function GetTerrainVariance(x, y) end    
function SetTerrainType(x, y, terrainType, variation, area, shape) end    
function IsTerrainPathable(x, y, t) end    
function SetTerrainPathable(x, y, t, flag) end    
function CreateImage(file, sizeX, sizeY, sizeZ, posX, posY, posZ, originX, originY, originZ, imageType) end    
function DestroyImage(whichImage) end    
function ShowImage(whichImage, flag) end    
function SetImageConstantHeight(whichImage, flag, height) end    
function SetImagePosition(whichImage, x, y, z) end    
function SetImageColor(whichImage, red, green, blue, alpha) end    
function SetImageRender(whichImage, flag) end    
function SetImageRenderAlways(whichImage, flag) end    
function SetImageAboveWater(whichImage, flag, useWaterAlpha) end    
function SetImageType(whichImage, imageType) end    
function CreateUbersplat(x, y, name, red, green, blue, alpha, forcePaused, noBirthTime) end    
function DestroyUbersplat(whichSplat) end    
function ResetUbersplat(whichSplat) end    
function FinishUbersplat(whichSplat) end    
function ShowUbersplat(whichSplat, flag) end    
function SetUbersplatRender(whichSplat, flag) end    
function SetUbersplatRenderAlways(whichSplat, flag) end    
function SetBlight(whichPlayer, x, y, radius, addBlight) end    
function SetBlightRect(whichPlayer, r, addBlight) end    
function SetBlightPoint(whichPlayer, x, y, addBlight) end    
function SetBlightLoc(whichPlayer, whichLocation, radius, addBlight) end    
function CreateBlightedGoldmine(id, x, y, face) end    
function IsPointBlighted(x, y) end    
function SetDoodadAnimation(x, y, radius, doodadID, nearestOnly, animName, animRandom) end    
function SetDoodadAnimationRect(r, doodadID, animName, animRandom) end    
function StartMeleeAI(num, script) end    
function StartCampaignAI(num, script) end    
function CommandAI(num, command, data) end    
function PauseCompAI(p, pause) end    
function GetAIDifficulty(num) end    
function RemoveGuardPosition(hUnit) end    
function RecycleGuardPosition(hUnit) end    
function RemoveAllGuardPositions(num) end    
function Cheat(cheatStr) end    
function IsNoVictoryCheat() end    
function IsNoDefeatCheat() end    
function Preload(filename) end    
function PreloadEnd(timeout) end    
function PreloadStart() end    
function PreloadRefresh() end    
function PreloadEndEx() end    
function PreloadGenClear() end    
function PreloadGenStart() end    
function PreloadGenEnd(filename) end    
function Preloader(filename) end    
function AutomationSetTestType(testType) end    
function AutomationTestStart(testName) end    
function AutomationTestEnd() end    
function AutomationTestingFinished() end    
function RequestExtraIntegerData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end    
function RequestExtraBooleanData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end    
function RequestExtraStringData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end    
function RequestExtraRealData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end    
function CreateCommandButtonEffect(abilityId, order) end    
function CreateUpgradeCommandButtonEffect(whichUprgade) end    
function CreateLearnCommandButtonEffect(abilityId) end    
function DestroyCommandButtonEffect(whichEffect) end    
--natives
function ConvertRace(i) end
function ConvertAllianceType(i) end
function ConvertRacePref(i) end
function ConvertIGameState(i) end
function ConvertFGameState(i) end
function ConvertPlayerState(i) end
function ConvertPlayerGameResult(i) end
function ConvertUnitState(i) end
function ConvertAIDifficulty(i) end
function ConvertGameEvent(i) end
function ConvertPlayerEvent(i) end
function ConvertPlayerUnitEvent(i) end
function ConvertWidgetEvent(i) end
function ConvertDialogEvent (i) end
function ConvertUnitEvent(i) end
function ConvertLimitOp(i) end
function ConvertUnitType(i) end
function ConvertGameSpeed(i) end
function ConvertPlacement(i) end
function ConvertStartLocPrio(i) end
function ConvertGameDifficulty(i) end
function ConvertGameType(i) end
function ConvertMapFlag(i) end
function ConvertMapVisibility(i) end
function ConvertMapSetting(i) end
function ConvertMapDensity(i) end
function ConvertMapControl(i) end
function ConvertPlayerColor(i) end
function ConvertPlayerSlotState(i) end
function ConvertVolumeGroup(i) end
function ConvertCameraField(i) end
function ConvertBlendMode(i) end
function ConvertRarityControl(i) end
function ConvertTexMapFlags(i) end
function ConvertFogState(i) end
function ConvertEffectType(i) end
function ConvertVersion(i) end
function ConvertItemType(i) end
function ConvertAttackType(i) end
function ConvertDamageType(i) end
function ConvertPathingType(i) end
function ConvertWeaponType(i) end
function ConvertPlayerScore(i) end
function ConvertSoundType(i) end