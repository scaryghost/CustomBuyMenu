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
                if (ForSaleBuyables[min].ItemName > ForSaleBuyables[j].ItemName) {
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
