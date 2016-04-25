private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardWeapon = "rhs_weap_akms";
private _standardWeaponGL = "rhs_weap_akms";
private _lmg = "rhs_weap_pkm";
private _mg = "rhs_weap_pkm";


if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    _crate addWeaponCargoGlobal [_standardWeapon,4];
    _crate addWeaponCargoGlobal [_standardWeaponGL,1];
    _crate addWeaponCargoGlobal [_lmg,2];
    _crate addWeaponCargoGlobal [_mg,1];
};
