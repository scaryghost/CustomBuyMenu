class WeaponGroupingPanel extends KFGui.KFTab_MidGameVoiceChat;

var automated GUISectionBackground ungroupedSection, groupedSection;
var automated GUIButton addWeapon, addAllWeapons, removeWeapon, removeAllWeapons;

defaultproperties {
    sb_Players= None
    sb_Specs= None
    sb_Options= None

    ch_NoVoiceChat= None
    ch_NoSpeech= None
    ch_NoText= None
    ch_Ban= None

    lb_Players= None

    Begin Object Class=GUISectionBackground Name=ungroupedObj
        bFillClient=True
        Caption="Ungrouped Weapons"
        LeftPadding=0.002500
        RightPadding=0.002500
        TopPadding=0.002500
        BottomPadding=0.002500
        WinTop=0.036614
        WinLeft=0.025156
        WinWidth=0.380859
        WinHeight=0.547697
    End Object
    ungroupedSection= ungroupedObj

    Begin Object Class=GUISectionBackground Name=groupedObj
        bFillClient=True
        Caption="Weapons in Group"
        LeftPadding=0.002500
        RightPadding=0.002500
        TopPadding=0.002500
        BottomPadding=0.002500
        WinTop=0.036614
        WinLeft=0.586876
        WinWidth=0.380859
        WinHeight=0.547697
    End Object
    groupedSection= groupedObj

    Begin Object Class=GUIButton Name=IAMutatorAdd
        Caption="Add"
        Hint="Adds the selection to the list of mutators to play with."
        WinTop=0.194114
        WinLeft=0.425000
        WinWidth=0.145000
        WinHeight=0.050000
        TabOrder=1
        OnClickSound=CS_Up
        OnClick=UT2K4Tab_MutatorBase.AddMutator
        OnKeyEvent=IAMutatorAdd.InternalOnKeyEvent
    End Object
    addWeapon=GUIButton'GUI2K4.UT2K4Tab_MutatorBase.IAMutatorAdd'

    Begin Object Class=GUIButton Name=IAMutatorAll
        Caption="Add All"
        Hint="Adds all mutators to the list of mutators to play with."
        WinTop=0.259218
        WinLeft=0.425000
        WinWidth=0.145000
        WinHeight=0.050000
        TabOrder=2
        OnClickSound=CS_Up
        OnClick=UT2K4Tab_MutatorBase.AddAllMutators
        OnKeyEvent=IAMutatorAll.InternalOnKeyEvent
    End Object
    b_AddAll=GUIButton'GUI2K4.UT2K4Tab_MutatorBase.IAMutatorAll'

    Begin Object Class=GUIButton Name=IAMutatorRemove
        Caption="Remove"
        Hint="Removes the selection from the list of mutators to play with."
        WinTop=0.424322
        WinLeft=0.425000
        WinWidth=0.145000
        WinHeight=0.050000
        TabOrder=4
        OnClickSound=CS_Down
        OnClick=UT2K4Tab_MutatorBase.RemoveMutator
        OnKeyEvent=IAMutatorRemove.InternalOnKeyEvent
    End Object
    b_Remove=GUIButton'GUI2K4.UT2K4Tab_MutatorBase.IAMutatorRemove'

    Begin Object Class=GUIButton Name=IAMutatorClear
        Caption="Remove All"
        Hint="Removes all mutators from the list of mutators to play with."
        WinTop=0.360259
        WinLeft=0.425000
        WinWidth=0.145000
        WinHeight=0.050000
        TabOrder=3
        OnClickSound=CS_Down
        OnClick=UT2K4Tab_MutatorBase.RemoveAllMutators
        OnKeyEvent=IAMutatorClear.InternalOnKeyEvent
    End Object
    b_RemoveAll=GUIButton'GUI2K4.UT2K4Tab_MutatorBase.IAMutatorClear'

}
