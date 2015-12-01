private _parameterCorrect = params [["_x",objNull,[objNull]]];

private _smokeWhite = "SmokeShell";
private _smokeRed = "SmokeShellRed";
private _smokeGreen = "SmokeShellGreen";
private _smokePurple = "SmokeShellPurple";
private _stunGranade = "ACE_M84";
private _irStrobe = "ACE_IR_Strobe_Item";

if(_parameterCorrect) then {
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addItemCargoGlobal [_smokeWhite,12];
	_x addItemCargoGlobal [_smokeRed,12];
	_x addItemCargoGlobal [_smokeGreen,12];
	_x addItemCargoGlobal [_smokePurple,12];
	_x addItemCargoGlobal [_stunGranade,12];
	_x addItemCargoGlobal [_irStrobe,12];
};
