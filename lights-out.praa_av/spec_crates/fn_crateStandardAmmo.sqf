private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "rhs_30Rnd_762x39mm_tracer";
private _mgAmmo = "rhs_100Rnd_762x54mmR_green";
private _lmgAmmo = "rhs_100Rnd_762x54mmR_green";
private _secondaryAmmo = "rhs_mag_9x18_12_57N181S";

private _smokeShell = "1Rnd_Smoke_Grenade_shell";
private _smokeShellRed = "1Rnd_SmokeRed_Grenade_shell";
private _heShell = "1Rnd_HE_Grenade_shell";

if(_parameterCorrect && isServer) then {
	clearMagazineCargoGlobal _crate;
	_crate addMagazineCargoGlobal [_standardAmmo,34];
	_crate addMagazineCargoGlobal [_mgAmmo,4];
	_crate addMagazineCargoGlobal [_lmgAmmo,4];
	_crate addMagazineCargoGlobal [_secondaryAmmo,8];
	_crate addMagazineCargoGlobal [_smokeShell,6];
	_crate addMagazineCargoGlobal [_smokeShellRed,6];
	_crate addMagazineCargoGlobal [_heShell,12];
};
