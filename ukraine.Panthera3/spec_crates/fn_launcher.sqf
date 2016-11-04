private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _atLauncher = "launch_RPG7_F";
private _atAmmo = "RPG7_F";

if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    _crate addWeaponCargoGlobal [_atLauncher,1];
    _crate addMagazineCargoGlobal [_atAmmo,6];
};
