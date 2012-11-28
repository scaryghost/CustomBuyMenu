class CBMInteraction extends Interaction;

event NotifyLevelChange() {
    Master.RemoveInteraction(self);
}

function bool KeyEvent(EInputKey Key, EInputAction Action, float Delta ) {
    local string alias;

    alias= ViewportOwner.Actor.ConsoleCommand("KEYBINDING"@ViewportOwner.Actor.ConsoleCommand("KEYNAME"@Key));
    if (Action == IST_Press && alias == "use") {
        log("Open my menu!");
        ViewportOwner.Actor.ClientOpenMenu("CustomBuyMenu.BuyMenu",,"MyTrader", string(KFHumanPawn(ViewportOwner.Actor.Pawn).MaxCarryWeight));
        return true;
    }
}

defaultproperties {
    bActive= true
}
