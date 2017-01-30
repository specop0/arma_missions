private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _atAmmo = "rhs_fgm148_magazine_AT";

if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    _crate addMagazineCargoGlobal [_atAmmo,2];
};
