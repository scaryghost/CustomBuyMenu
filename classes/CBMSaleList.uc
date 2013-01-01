class CBMSaleList extends KFGui.KFBuyMenuSaleList;

var class<KFVeterancyTypes> FilterVeterancy;

event Opened(GUIComponent Sender) {
    super(GUIVertList).Opened(Sender);
    if ( KFPlayerController(PlayerOwner()) != none && KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo).ClientVeteranSkill != none ) {
        FilterVeterancy= KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo).ClientVeteranSkill;
    }
    else {
        FilterVeterancy= class'KFVeterancyTypes';
    }
    UpdateForSaleBuyables();
}

function bool lessThan(GUIBuyable left, GUIBUyable right) {
    local bool leftReqUnlock, leftUnlocked, rightReqUnlock, rightUnlocked, namelessThan;

    leftReqUnlock= left.ItemWeaponClass.Default.UnlockedByAchievement != -1 || left.ItemWeaponClass.Default.AppID > 0;
    rightReqUnlock= right.ItemWeaponClass.Default.UnlockedByAchievement != -1 || right.ItemWeaponClass.Default.AppID > 0;
    nameLessThan= left.ItemName < right.ItemName;

    leftUnlocked= KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements)
            .Achievements[left.ItemWeaponClass.Default.UnlockedByAchievement].bCompleted == 1 || 
            PlayerOwner().SteamStatsAndAchievements.PlayerOwnsWeaponDLC(left.ItemWeaponClass.Default.AppID);
    rightUnlocked= KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements)
            .Achievements[right.ItemWeaponClass.Default.UnlockedByAchievement].bCompleted == 1 || 
            PlayerOwner().SteamStatsAndAchievements.PlayerOwnsWeaponDLC(right.ItemWeaponClass.Default.AppID);

    return (!leftReqUnlock && !rightReqUnlock && nameLessThan) || (!leftReqUnlock && rightReqUnlock && !rightUnlocked) || 
        (leftReqUnlock && leftUnlocked && rightReqUnlock && rightUnlocked && nameLessTHan) || 
        (!leftReqUnlock && rightReqUnlock && rightUnlocked && nameLessThan) || 
        (leftReqUnlock && leftUnlocked && !rightUnlocked && nameLessThan);
}

function UpdateForSaleBuyables() {
    local int i, j, min;
    local GUIBuyable temp;

    super.UpdateForSaleBuyables();
    if (FilterVeterancy != class'KFVeterancyTypes') {
        while(i < ForSaleBuyables.Length) {
            if (ForSaleBuyables[i].ItemPickupClass.default.CorrespondingPerkIndex != FilterVeterancy.default.PerkIndex) {
                ForSaleBuyables.remove(i, 1);
            } else {
                i++;
            }
        }

        for(i= 0; i < ForSaleBuyables.Length; i++) {
            min= i;
            for(j= i + 1; j < ForSaleBuyables.Length; j++) {
                if (lessThan(ForSaleBuyables[j], ForSaleBuyables[min])) {
                    min= j;
                }
            }
            temp= ForSaleBuyables[min];
            ForSaleBuyables[min]= ForSaleBuyables[i];
            ForSaleBuyables[i]= temp;
        }
    }
    UpdateList();
}
