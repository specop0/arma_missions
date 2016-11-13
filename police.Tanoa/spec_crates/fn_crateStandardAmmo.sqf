private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "30Rnd_9x21_Mag_SMG_02";
private _secondaryAmmo = "CUP_15Rnd_9x19_M9";
private _shieldAmmo = _secondaryAmmo;
private _shieldSecondaryAmmo = "BWA3_40Rnd_46x30_MP7";

private _stunGrenade = "ACE_M84";
private _demoCharge = "DemoCharge_Remote_Mag";

if(_parameterCorrect && isServer) then {
    clearMagazineCargoGlobal _crate;
    _crate addMagazineCargoGlobal [_standardAmmo, 54];
    _crate addMagazineCargoGlobal [_secondaryAmmo, 18];
    _crate addMagazineCargoGlobal [_shieldAmmo, 18];
    _crate addMagazineCargoGlobal [_shieldSecondaryAmmo, 6];
    _crate addMagazineCargoGlobal [_stunGrenade, 27];
    _crate addMagazineCargoGlobal [_demoCharge, 2];
};
