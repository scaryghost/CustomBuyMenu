class WeaponFilter extends KFGui.KFQuickPerkSelect;

var CBMSaleList listRef;
var automated   KFIndexedGUIImage               PerkSelectIcon6;
var automated   GUIImage                        PerkBack6;
var automated   GUILabel                        WeaponFilterLabel;

function bool InternalOnClick(GUIComponent Sender) {
    if ( Sender.IsA('KFIndexedGUIImage')) {
        listRef.FilterVeterancy= class'KFGameType'.default.LoadedSkills[KFIndexedGUIImage(Sender).Index];
    }
    
    return false;   
}

function bool MyOnDraw(Canvas C) {
    local int i;

    super.MyOnDraw(C);

    for (i = 0; i < class'KFGameType'.default.LoadedSkills.Length - 1; i++) {
        PerkSelectIcons[i].Image = class'KFGameType'.default.LoadedSkills[i].default.OnHUDIcon;
        PerkSelectIcons[i].Index = i;
        PerkSelectIcons[i].ImageColor.A = 255;  
    }

    PerkSelectIcon6.Image= class'KFGameType'.default.LoadedSkills[i].default.OnHUDIcon;
    PerkSelectIcon6.Index= i;

    return false;
}

function ResizeIcons(Canvas C) {
    super.ResizeIcons(C);

    PerkBack6.WinWidth = (C.ClipY / C.ClipX) * BoxSizeX;
    PerkSelectIcon6.WinWidth= (C.ClipY / C.ClipX) * BoxSizeY;
}

defaultproperties {
    Begin Object Class=GUILabel Name=Filter
        WinTop=0.005
        WinLeft=0.665000
        WinWidth=0.329761
        WinHeight=0.05
        Caption="Weapon Filters"
        TextAlign=TXTA_Center
        TextFont="UT2MenuFont"
        TextColor=(R=175,G=176,B=158,A=255)
    End Object
    WeaponFilterLabel=Filter

    Begin Object class=GUIImage Name=PB0
        WinWidth=0.04
        WinHeight=0.04
        WinLeft=0.715
        WinTop=0.0504
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.5
    End Object
    PerkBack0=PB0   
    
    Begin Object class=GUIImage Name=PB1
        WinWidth=0.04
        WinHeight=0.04
        WinLeft=0.750
        WinTop=0.0504
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.5
    End Object
    PerkBack1=PB1   

    Begin Object class=GUIImage Name=PB2
        WinWidth=0.04
        WinHeight=0.04
        WinLeft=0.785
        WinTop=0.0504
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.5
    End Object
    PerkBack2=PB2   

    Begin Object class=GUIImage Name=PB3
        WinWidth=0.04
        WinHeight=0.04
        WinLeft=0.820
        WinTop=0.0504
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.5
    End Object
    PerkBack3=PB3   

    Begin Object class=GUIImage Name=PB4
        WinWidth=0.04
        WinHeight=0.04
        WinLeft=0.855
        WinTop=0.0504
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.5
    End Object
    PerkBack4=PB4   

    Begin Object class=GUIImage Name=PB5
        WinWidth=0.04
        WinHeight=0.04
        WinLeft=0.890
        WinTop=0.0504
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.5
    End Object
    PerkBack5=PB5

    Begin Object class=GUIImage Name=PB6
        WinWidth=0.04
        WinHeight=0.04
        WinLeft=0.925
        WinTop=0.0504
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.5
    End Object
    PerkBack6=PB6

    Begin Object class=KFIndexedGUIImage Name=PSI0
        WinWidth=0.040
        WinHeight=0.040
        WinLeft=0.715
        WinTop=0.0524
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.6
        OnClick=InternalOnClick
    End Object
    PerkSelectIcon0=PSI0            
    
    Begin Object class=KFIndexedGUIImage Name=PSI1
        WinWidth=0.040
        WinHeight=0.040
        WinLeft=0.750
        WinTop=0.0524
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.6
        OnClick=InternalOnClick
    End Object
    PerkSelectIcon1=PSI1            
    
    Begin Object class=KFIndexedGUIImage Name=PSI2
        WinWidth=0.040
        WinHeight=0.040
        WinLeft=0.785
        WinTop=0.0524
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.6
        OnClick=InternalOnClick
    End Object
    PerkSelectIcon2=PSI2            
    
    Begin Object class=KFIndexedGUIImage Name=PSI3
        WinWidth=0.040
        WinHeight=0.040
        WinLeft=0.820
        WinTop=0.0524
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.6
        OnClick=InternalOnClick
    End Object
    PerkSelectIcon3=PSI3            
    
    Begin Object class=KFIndexedGUIImage Name=PSI4
        WinWidth=0.040
        WinHeight=0.040
        WinLeft=0.855
        WinTop=0.0524
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.6
        OnClick=InternalOnClick
    End Object
    PerkSelectIcon4=PSI4            
    
    Begin Object class=KFIndexedGUIImage Name=PSI5
        WinWidth=0.040
        WinHeight=0.040
        WinLeft=0.890
        WinTop=0.0524
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.6
        OnClick=InternalOnClick
    End Object
    PerkSelectIcon5=PSI5

    Begin Object class=KFIndexedGUIImage Name=PSI6
        WinWidth=0.040
        WinHeight=0.040
        WinLeft=0.925
        WinTop=0.0524
        Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
        ImageStyle=ISTY_Scaled
        Renderweight=0.6
        OnClick=InternalOnClick
    End Object
    PerkSelectIcon6=PSI6
}
