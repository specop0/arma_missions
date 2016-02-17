private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardWeapon = "hlc_rifle_auga3";
private _standardWeaponGL = "hlc_rifle_auga3_GL";
private _lmg = "BWA3_MG4";
private _mg = "hlc_lmg_m60";


if(_parameterCorrect && isServer) then {
	clearWeaponCargoGlobal _crate;
	_crate addWeaponCargoGlobal [_standardWeapon,4];
	_crate addWeaponCargoGlobal [_standardWeaponGL,1];
	_crate addWeaponCargoGlobal [_lmg,2];
	_crate addWeaponCargoGlobal [_mg,1];
};
