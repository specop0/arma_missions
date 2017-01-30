private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
private _mgAmmo = "rhsusf_100Rnd_762x51_m80a1epr";
private _lmgAmmo = "rhsusf_200Rnd_556x45_soft_pouch";
private _secondaryAmmo = "rhsusf_mag_7x45acp_MHP";

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
