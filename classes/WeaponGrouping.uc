class WeaponGrouping extends Object
    PerObjectConfig
    config(WeaponGrouping);

struct WeaponGroup {
    var config string groupName;
    var config array<class<Pickup> > weaponPickups;
};

var config array<WeaponGroup> weaponGroups;

function int addGroup(string newName) {
    local int i;
    local bool found;

    while(i < weaponGroups.Length && !found) {
        found= weaponGroups[i].groupName == newName;
        i++;
    }
    if (!found) {
        weaponGroups.Length= i + 1;
        weaponGroups[i].groupName= newName;
    }
    return i;
}

function addPickup(string groupName, class<Pickup> weaponPickup) {
    local int gIndex, length;

    gIndex= addGroup(groupName);
    length= weaponGroups[gIndex].weaponPickups.Length;
    weaponGroups[gIndex].weaponPickups.Length= length + 1;
    weaponGroups[gIndex].weaponPickups[length]= weaponPickup;
} 
