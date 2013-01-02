class CBMSaleList extends KFGui.KFBuyMenuSaleList;

var class<KFVeterancyTypes> filterVeterancy;

event Opened(GUIComponent Sender) {
    super(GUIVertList).Opened(Sender);
    if ( KFPlayerController(PlayerOwner()) != none && KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo).ClientVeteranSkill != none ) {
        filterVeterancy= KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo).ClientVeteranSkill;
    }
    else {
        filterVeterancy= class'KFVeterancyTypes';
    }
    UpdateForSaleBuyables();
}

function bool greaterThan(GUIBuyable left, GUIBUyable right) {
    local bool leftReqUnlock, leftUnlocked, rightReqUnlock, rightUnlocked;

    leftReqUnlock= left.ItemWeaponClass.Default.UnlockedByAchievement != -1 || left.ItemWeaponClass.Default.AppID > 0;
    rightReqUnlock= right.ItemWeaponClass.Default.UnlockedByAchievement != -1 || right.ItemWeaponClass.Default.AppID > 0;

    leftUnlocked= KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements)
            .Achievements[left.ItemWeaponClass.Default.UnlockedByAchievement].bCompleted == 1 || 
            PlayerOwner().SteamStatsAndAchievements.PlayerOwnsWeaponDLC(left.ItemWeaponClass.Default.AppID);
    rightUnlocked= KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements)
            .Achievements[right.ItemWeaponClass.Default.UnlockedByAchievement].bCompleted == 1 || 
            PlayerOwner().SteamStatsAndAchievements.PlayerOwnsWeaponDLC(right.ItemWeaponClass.Default.AppID);
    return leftReqUnlock && !leftUnlocked && (!rightReqUnlock || rightReqUnlock && rightUnlocked);
}

function UpdateForSaleBuyables() {
    local int i, j;
    local int ForSaleArrayIndex;
    local array<GUIBuyable> tempArray;

    if (filterVeterancy == class'KFVeterancyTypes') {
        super.UpdateForSaleBuyables();
    } else {
        ForSaleArrayIndex= PopulateBuyablesByPerk(filterVeterancy.default.PerkIndex, true, 0);
        if (ForSaleArrayIndex < ForSaleBuyables.Length) {
            ForSaleBuyables.Remove(ForSaleArrayIndex, ForSaleBuyables.Length);
        }
        for(i= ForSaleBuyables.Length - 1; i >= 0; i--) {
            for(j= tempArray.Length; j > 0 && !greaterThan(ForSaleBuyables[i], tempArray[j - 1]); j--) {
            }
            tempArray.insert(j, 1);
            tempArray[j]= ForSaleBuyables[i];
        }
        ForSaleBuyables= tempArray;
        UpdateList();
    }
}
