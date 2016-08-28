private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _standardAmmo = "30Rnd_9x21_Mag_SMG_02";
private _secondaryAmmo = "16Rnd_9x21_Mag";

private _stunGrenade = "ACE_M84";
private _demoCharge = "DemoCharge_Remote_Mag";

if(_parameterCorrect && isServer) then {
    clearMagazineCargoGlobal _crate;
    _crate addMagazineCargoGlobal [_standardAmmo, 54];
    _crate addMagazineCargoGlobal [_secondaryAmmo, 18];
    _crate addMagazineCargoGlobal [_stunGrenade, 27];
    _crate addMagazineCargoGlobal [_demoCharge, 2];
};
