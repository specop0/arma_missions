private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _atLauncher = "rhs_weap_rpg7";
private _aaLauncher = "rhs_weap_igla";

private _atAmmo = "rhs_rpg7_PG7VL_mag";
private _atAmmo2 = "rhs_rpg7_PG7VL_mag";
private _aaAmmo = "rhs_mag_9k38_rocket";

if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    _crate addWeaponCargoGlobal [_atLauncher,2];
    _crate addMagazineCargoGlobal [_atAmmo, 2];
    _crate addMagazineCargoGlobal [_atAmmo2, 4];
    _crate addWeaponCargoGlobal [_aaLauncher,2];
    _crate addMagazineCargoGlobal [_aaAmmo,2];
};
