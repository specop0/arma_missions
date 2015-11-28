local _parameterCorrect = params [["_x",objNull,[objNull]]];

local _bandageBasic = "ACE_fieldDressing";
local _packingBandage = "ACE_packingBandage";
local _quikcloth = "ACE_quikclot";
local _elasticBandage = "ACE_elasticBandage";
local _tourniquet = "ACE_tourniquet";

local _morphine = "ACE_morphine";
local _epinephrine = "ACE_epinephrine";
local _atropine = "ACE_atropine";

local _personalAidKit = "ACE_personalAidKit";
local _surgicalKit = "ACE_surgicalKit";

local _saline = "ACE_salineIV";
local _saline500 = "ACE_salineIV_500";
local _saline250 = "ACE_salineIV_250";

local _bodyBag = "ACE_bodyBag";

if(_parameterCorrect) then {
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addItemCargoGlobal [_bandageBasic,100];
	_x addItemCargoGlobal [_packingBandage,65];
	_x addItemCargoGlobal [_quikcloth,25];
	_x addItemCargoGlobal [_elasticBandage,25];
	_x addItemCargoGlobal [_tourniquet,25];
	
	_x addItemCargoGlobal [_saline,25];
	_x addItemCargoGlobal [_saline500,25];
	_x addItemCargoGlobal [_saline250,25];
	_x addItemCargoGlobal [_morphine,25];
	_x addItemCargoGlobal [_epinephrine,25];
	_x addItemCargoGlobal [_atropine,25];
	
	_x addItemCargoGlobal [_personalAidKit,10];
	_x addItemCargoGlobal [_surgicalKit,10];
	
	_x addItemCargoGlobal [_bodyBag, 5];
};
