local _parameterCorrect = params [["_x",objNull,[objNull]]];

local _explosiveCharge = "DemoCharge_Remote_Mag";
local _apMine = "SLAMDirectionalMine_Wire_Mag";
local _clacker = "ACE_Clacker";

if(_parameterCorrect) then {
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addItemCargoGlobal [_explosiveCharge,8];
	_x addItemCargoGlobal [_apMine,8];
	_x addItemCargoGlobal [_clacker,2];
};
