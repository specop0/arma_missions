local _parameterCorrect = params [["_x",objNull,[objNull]]];

local _standardAmmo = "30Rnd_65x39_caseless_green";
local _mgAmmo = "150Rnd_762x54_Box";

local _smokeShell = "1Rnd_Smoke_Grenade_shell";
local _smokeShellRed = "1Rnd_SmokeRed_Grenade_shell";
local _heShell = "1Rnd_HE_Grenade_shell";

if(_parameterCorrect) then {
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addMagazineCargoGlobal [_standardAmmo,34];
	_x addMagazineCargoGlobal [_mgAmmo,8];
	_x addMagazineCargoGlobal [_smokeShell,6];
	_x addMagazineCargoGlobal [_smokeShellRed,6];
	_x addMagazineCargoGlobal [_heShell,12];
};
