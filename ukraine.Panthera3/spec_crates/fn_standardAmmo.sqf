private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "30Rnd_762x39_Mag_F";
private _mgAmmo = "200Rnd_556x45_Box_F";
private _lmgAmmo = "30Rnd_545x39_Mag_F";
private _secondaryAmmo = "6Rnd_45ACP_Cylinder";

private _smokeShell = "1Rnd_Smoke_Grenade_shell";
private _smokeShellRed = "1Rnd_SmokeRed_Grenade_shell";
private _heShell = "1Rnd_HE_Grenade_shell";

if(_parameterCorrect && isServer) then {
    clearMagazineCargoGlobal _crate;
    _crate addMagazineCargoGlobal [_standardAmmo,34];
    _crate addMagazineCargoGlobal [_mgAmmo,4];
    _crate addMagazineCargoGlobal [_lmgAmmo,8];
    _crate addMagazineCargoGlobal [_secondaryAmmo,8];
    _crate addMagazineCargoGlobal [_smokeShell,6];
    _crate addMagazineCargoGlobal [_smokeShellRed,6];
    _crate addMagazineCargoGlobal [_heShell,12];
};
