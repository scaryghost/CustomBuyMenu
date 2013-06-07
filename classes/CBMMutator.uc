class CBMMutator extends Mutator;

function PostBeginPlay() {
    if (KFGameType(Level.Game) == none) {
        Destroy();
        return;
    }
    if (Level.NetMode != NM_Standalone)
        AddToPackageMap("CustomBuyMenu");
}

simulated function Tick(float DeltaTime) {
    local PlayerController PC;

    PC= Level.GetLocalPlayerController();
    if (PC != none) {
        PC.Player.InteractionMaster.AddInteraction("CustomBuyMenu.CBMInteraction", PC.Player);
    }
    Disable('Tick');
}

defaultproperties {
    GroupName="KFCustomBuyMenu"
    FriendlyName="Custom Buy Menu v1.2.1"
    Description="Filters weapons by perk to reduce the clutter in the trader buy menu"
    
    RemoteRole= ROLE_SimulatedProxy
    bAlwaysRelevant= true
}
