private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "rhs_30Rnd_545x39_AK";
private _mgAmmo = "rhs_100Rnd_762x54mmR_green";
private _lmgAmmo = "rhs_30Rnd_545x39_AK";
private _secondaryAmmo = "rhs_mag_9x19_17";

private _smokeShell = "rhs_GRD40_White";//"1Rnd_Smoke_Grenade_shell";
private _smokeShellRed = "rhs_GRD40_Red";//"1Rnd_SmokeRed_Grenade_shell";
private _heShell = "rhs_VOG25";//"1Rnd_HE_Grenade_shell";

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
