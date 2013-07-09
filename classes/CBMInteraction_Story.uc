class CBMInteraction_Story extends CBMInteractionBase;

function bool isTraderTime() {
    local KF_StoryObjective currentObjective;

    currentObjective= KF_StoryGRI(ViewportOwner.Actor.GameReplicationInfo).GetCurrentObjective();
    return currentObjective == none || currentObjective.IsTraderObj();
}

defaultproperties {
    buyMenuClass="CustomBuyMenu.BuyMenu_Story"
}
