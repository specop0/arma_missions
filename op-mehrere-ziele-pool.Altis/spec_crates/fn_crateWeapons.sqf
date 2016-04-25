private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardWeapon = "CUP_arifle_CZ805_A1";
private _standardWeaponGL = "CUP_arifle_CZ805_GL";
private _lmg = "BWA3_MG4";
private _mg = "CUP_lmg_M60E4";


if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    _crate addWeaponCargoGlobal [_standardWeapon,4];
    _crate addWeaponCargoGlobal [_standardWeaponGL,1];
    _crate addWeaponCargoGlobal [_lmg,2];
    _crate addWeaponCargoGlobal [_mg,1];
};
