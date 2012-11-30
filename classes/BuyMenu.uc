class BuyMenu extends KFGui.GUIBuyMenu;

function InitTabs()
{
	local int i;
    local GUITabPanel panel;

	for ( i = 0; i < PanelCaption.Length && i < PanelClass.Length && i < PanelHint.Length; i++ )
	{
		panel= c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
        if (i == 0) {
            PerkFilter(QuickPerkSelect).listRef= CBMSaleList(BuyMenuTab(panel).SaleSelect.List);
        }
	}
}

defaultproperties {
    PanelClass(0)="CustomBuyMenu.BuyMenuTab"

    HeaderBG_Left_Label= None

    Begin Object class=PerkFilter Name=QS
		WinTop=0.011906
		WinLeft=0.008008
		WinWidth=0.316601
		WinHeight=0.082460
	End Object
    QuickPerkSelect=QS

	Begin Object Class=GUILabel Name=Perk
        WinTop=0.005
        WinLeft=0.025
        WinWidth=0.329761
        WinHeight=0.0500
		Caption=""
		TextAlign=TXTA_Center
		TextFont="UT2MenuFont"
		TextColor=(R=175,G=176,B=158,A=255)
	End Object
	CurrentPerkLabel=Perk
}
