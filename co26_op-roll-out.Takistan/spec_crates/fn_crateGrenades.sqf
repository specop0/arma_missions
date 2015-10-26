local _parameterCorrect = params [["_x",objNull,[objNull]]];

local _smokeWhite = "SmokeShell";
local _smokeRed = "SmokeShellRed";
local _smokeGreen = "SmokeShellGreen";
local _smokePurple = "SmokeShellPurple";
local _stunGranade = "ACE_M84";
local _irStrobe = "ACE_IR_Strobe_Item";

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
