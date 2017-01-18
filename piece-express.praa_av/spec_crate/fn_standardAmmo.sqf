private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "30Rnd_556x45_Stanag_Tracer_Red";
private _mgAmmo = "rhsusf_100Rnd_762x51_m62_tracer";
private _lmgAmmo = "rhs_200rnd_556x45_T_SAW";
private _secondaryAmmo = "rhsusf_mag_15Rnd_9x19_JHP";
private _sniperAmmo = "rhsusf_20Rnd_762x51_m118_special_Mag";

private _smokeShell = "1Rnd_Smoke_Grenade_shell";
private _smokeShellRed = "1Rnd_SmokeRed_Grenade_shell";
private _heShell = "1Rnd_HE_Grenade_shell";

if(_parameterCorrect && isServer) then {
    clearMagazineCargoGlobal _crate;
    _crate addMagazineCargoGlobal [_standardAmmo,34];
    _crate addMagazineCargoGlobal [_mgAmmo,4];
    _crate addMagazineCargoGlobal [_lmgAmmo,4];
    _crate addMagazineCargoGlobal [_sniperAmmo,8];
    _crate addMagazineCargoGlobal [_secondaryAmmo,8];
    _crate addMagazineCargoGlobal [_smokeShell,6];
    _crate addMagazineCargoGlobal [_smokeShellRed,6];
    _crate addMagazineCargoGlobal [_heShell,12];
};
