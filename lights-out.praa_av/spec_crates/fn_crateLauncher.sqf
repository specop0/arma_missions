private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _atLauncher = "rhs_weap_rpg26";
private _aaLauncher = "rhs_weap_fim92";
private _aaAmmo = "rhs_fim92_mag";

if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    _crate addWeaponCargoGlobal [_atLauncher,2];
    _crate addWeaponCargoGlobal [_aaLauncher,2];
    _crate addMagazineCargoGlobal [_aaAmmo,2];
};
