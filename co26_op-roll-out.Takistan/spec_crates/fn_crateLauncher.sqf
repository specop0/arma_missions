private _parameterCorrect = params [["_x",objNull,[objNull]]];

private _atAmmo = "RPG32_F";
private _atAmmoHE = "RPG32_HE_F";

if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearItemCargoGlobal _x;
    clearBackpackCargoGlobal _x;
    _x addMagazineCargoGlobal [_atAmmo,6];
    _x addMagazineCargoGlobal [_atAmmoHE,4];
};
