local _parameterCorrect = params [["_x",objNull,[objNull]]];

local _mineDetector = "MineDetector";
local _binocular = "Binocular";
local _gps = "ACE_microDAGR";
local _rangefinder = "ACE_Yardage450";
local _toolkit = "ToolKit";

local _backpack = "B_FieldPack_ocamo";

local _weaponFlashlight = "acc_flashlight";
local _weaponLaser = "acc_pointer_IR";
local _weaponSilencerH = "muzzle_snds_H";
local _weaponSilencerL = "muzzle_snds_L";
local _weaponScope = "optic_Arco";

if(_parameterCorrect) then {
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addItemCargoGlobal [_mineDetector,3];
	_x addItemCargoGlobal [_binocular,12];
	_x addItemCargoGlobal [_gps,5];
	_x addItemCargoGlobal [_rangefinder,5];
	_x addItemCargoGlobal [_toolkit,3];
	
	_x addBackpackCargoGlobal [_backpack,4];
	
	_x addItemCargoGlobal [_weaponFlashlight,12];
	_x addItemCargoGlobal [_weaponLaser,12];
	_x addItemCargoGlobal [_weaponSilencerH,12];
	_x addItemCargoGlobal [_weaponSilencerL,12];
	_x addItemCargoGlobal [_weaponSilencerL,12];
};
