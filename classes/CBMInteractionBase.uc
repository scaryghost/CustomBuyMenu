class CBMInteractionBase extends Interaction
    abstract;

var GUI.GUITabItem weaponsTab;
var string buyMenuClass;

event NotifyLevelChange() {
    Master.RemoveInteraction(self);
}

function bool isTraderTime();

function bool KeyEvent(EInputKey Key, EInputAction Action, float Delta ) {
    local string alias;
    local ShopVolume shop;
    local bool touchingShopVolume;
    local MidGamePanel panel;

    alias= ViewportOwner.Actor.ConsoleCommand("KEYBINDING"@ViewportOwner.Actor.ConsoleCommand("KEYNAME"@Key));
    if (Action == IST_Press && alias ~= "use" && isTraderTime()) {
        foreach ViewportOwner.Actor.Pawn.TouchingActors(class'ShopVolume', shop) {
            touchingShopVolume= true;
            break;
        }
        if (touchingShopVolume && Len(buyMenuClass) > 0) {
            ViewportOwner.Actor.ClientOpenMenu(buyMenuClass,,"MyTrader", string(KFHumanPawn(ViewportOwner.Actor.Pawn).MaxCarryWeight));
            return true;
        }
    } else if (Action == IST_Press && alias ~= "showmenu") {
        if (KFGUIController(ViewportOwner.GUIController).ActivePage == None) {
            ViewportOwner.Actor.ShowMenu();
        }
        if (KFInvasionLoginMenu(KFGUIController(ViewportOwner.GUIController).ActivePage) != none && 
                KFInvasionLoginMenu(KFGUIController(ViewportOwner.GUIController).ActivePage).c_Main.TabIndex(weaponsTab.caption) == -1) {
            panel= MidGamePanel(KFInvasionLoginMenu(KFGUIController(ViewportOwner.GUIController).ActivePage).c_Main.AddTabItem(weaponsTab));
            if (panel != none) {
                panel.ModifiedChatRestriction= KFInvasionLoginMenu(KFGUIController(ViewportOwner.GUIController).ActivePage).UpdateChatRestriction;
            }
        }
    }
    return false;
}

defaultproperties {
    bActive= true
    weaponsTab=(ClassName="CustomBuyMenu.WeaponGroupingPanel",Caption="Weapons",Hint="Arrange how the weapons are grouped in the trader")
}
