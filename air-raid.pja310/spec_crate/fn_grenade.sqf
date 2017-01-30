private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _smokeWhite = "SmokeShell";
private _smokeRed = "SmokeShellRed";
private _smokeGreen = "SmokeShellGreen";
private _smokePurple = "SmokeShellPurple";
private _stunGranade = "ACE_M84";
private _irStrobe = "ACE_IR_Strobe_Item";

if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    clearItemCargoGlobal _crate;
    _crate addItemCargoGlobal [_smokeWhite,36];
    _crate addItemCargoGlobal [_smokeRed,12];
    _crate addItemCargoGlobal [_smokeGreen,12];
    _crate addItemCargoGlobal [_smokePurple,12];
    _crate addItemCargoGlobal [_stunGranade,12];
    _crate addItemCargoGlobal [_irStrobe,12];
};
