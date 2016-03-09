private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _atLauncher = "UK3CB_BAF_AT4_AT_Launcher";
private _aaLauncher = "BWA3_Fliegerfaust";
private _aaAmmo = "BWA3_Fliegerfaust_Mag";

if(_parameterCorrect && isServer) then {
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	_crate addWeaponCargoGlobal [_atLauncher,2];
	_crate addWeaponCargoGlobal [_aaLauncher,2];
	_crate addMagazineCargoGlobal [_aaAmmo,2];
};
