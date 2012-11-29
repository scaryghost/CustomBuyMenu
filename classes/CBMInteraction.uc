class CBMInteraction extends Interaction;

event NotifyLevelChange() {
    Master.RemoveInteraction(self);
}

function bool KeyEvent(EInputKey Key, EInputAction Action, float Delta ) {
    local string alias;
    local ShopVolume shop;
    local bool canBuy;

    alias= ViewportOwner.Actor.ConsoleCommand("KEYBINDING"@ViewportOwner.Actor.ConsoleCommand("KEYNAME"@Key));
    if (Action == IST_Press && alias == "use" && !KFGameReplicationInfo(ViewportOwner.Actor.GameReplicationInfo).bWaveInProgress) {
        foreach ViewportOwner.Actor.Pawn.TouchingActors(class'ShopVolume', shop) {
            canBuy= true;
        }
        if (canBuy) {
            ViewportOwner.Actor.ClientOpenMenu("CustomBuyMenu.BuyMenu",,"MyTrader", string(KFHumanPawn(ViewportOwner.Actor.Pawn).MaxCarryWeight));
            return true;
        }
    }
    return false;
}

defaultproperties {
    bActive= true
}
