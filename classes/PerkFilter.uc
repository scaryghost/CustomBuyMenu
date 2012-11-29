class PerkFilter extends KFGui.KFQuickPerkSelect;

var CBMSaleList listRef;

function bool InternalOnClick(GUIComponent Sender)
{
    if ( Sender.IsA('KFIndexedGUIImage'))
    {
        listRef.PlayerVeterancy= class'KFGameType'.default.LoadedSkills[KFIndexedGUIImage(Sender).Index];
    }
    
    return false;   
}
