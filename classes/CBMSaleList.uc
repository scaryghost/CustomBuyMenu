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

function UpdateForSaleBuyables() {
    local int i;

    super.UpdateForSaleBuyables();
    while(i < ForSaleBuyables.Length) {
        if (FilterVeterancy != class'KFVeterancyTypes' && ForSaleBuyables[i].ItemPickupClass.default.CorrespondingPerkIndex != FilterVeterancy.default.PerkIndex) {
            ForSaleBuyables.remove(i, 1);
        } else {
            i++;
        }
    }
    UpdateList();
}
