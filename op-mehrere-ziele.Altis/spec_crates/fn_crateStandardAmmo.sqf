local _parameterCorrect = params [["_x",objNull,[objNull]]];

local _standardAmmo = "hlc_30Rnd_556x45_SOST_AUG";
local _mgAmmo = "hlc_100Rnd_762x51_B_M60E4";
local _lmgAmmo = "BWA3_200Rnd_556x45_Tracer";
local _secondaryAmmo = "CUP_17Rnd_9x19_glock17";

local _smokeShell = "1Rnd_Smoke_Grenade_shell";
local _smokeShellRed = "1Rnd_SmokeRed_Grenade_shell";
local _heShell = "1Rnd_HE_Grenade_shell";

if(_parameterCorrect) then {
	clearMagazineCargoGlobal _x;
	_x addMagazineCargoGlobal [_standardAmmo,34];
	_x addMagazineCargoGlobal [_mgAmmo,4];
	_x addMagazineCargoGlobal [_lmgAmmo,4];
	_x addMagazineCargoGlobal [_secondaryAmmo,8];
	_x addMagazineCargoGlobal [_smokeShell,6];
	_x addMagazineCargoGlobal [_smokeShellRed,6];
	_x addMagazineCargoGlobal [_heShell,12];
};
