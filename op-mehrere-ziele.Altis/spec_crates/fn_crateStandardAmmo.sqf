private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "30Rnd_556x45_Stanag";
private _mgAmmo = "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
private _lmgAmmo = "BWA3_200Rnd_556x45_Tracer";
private _secondaryAmmo = "CUP_17Rnd_9x19_glock17";

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
