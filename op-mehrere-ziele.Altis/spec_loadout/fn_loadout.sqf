/*
	Author: SpecOp0

	Description:
	Assigns a loadout to a given unit.
	The type of loadout is determined with the classname.
	
	Can be used as an addAction entry as well.
	
	Parameter(s):
	0: OBJECT - unit to assign loadout to
	1 (Optional) : STRING - classname which represents loadout type (default: classname of unit)
	
	Alternativ Usage:
	0: -
	1: OBJECT - unit which choose addAction entry
	2: -
	3 (Optional): STRING - classname which represents loadout type (default: classname of unit)

	Returns:
	true
*/

waitUntil {!isNull player || isServer};
private _unit = objNull;
private _type = "";
private _parameterCorrect = false;
// test if addAction was used (caller _this select 3 is present)
if(_this isEqualType [] && {count _this > 3}) then {
	_parameterCorrect = params [ "", ["_caller", objNull,[objNull]] ];
	_unit = _caller;
	_type = typeOf _unit;
	// test if addAction arguments were used
	if (count _this > 3 && {(_this select 3) isEqualTypeAny ["",[]]}) then {
		private _addActionParameterCorrect = (_this select 3) params [ ["_typeAddActionArg","",["STRING"]] ];
		if(_addActionParameterCorrect) then {
			_type = _typeAddActionArg;
		};
	};
} else {
	_parameterCorrect = params [["_unitArg",objNull,[objNull]]];
	_unit = _unitArg;
	_type = typeOf _unit;
	// test if type argument present (_this select 1)
	if(_this isEqualType [] && {count _this > 1}) then {
		private _typeParameterCorrect = params ["", ["_typeArg","",[""]] ];
		if(_typeArg != "") then {
			_type = _typeArg;
		};
	};
};

private _uniform = "BWA3_Uniform2_Fleck";
private _vest = "BWA3_Vest_Fleck";

private _backpack = "BWA3_AssaultPack_Fleck";
private _backpackBig = "BWA3_Kitbag_Fleck_Medic"; //BWA3_Kitbag_Fleck
private _backpackLR = "tf_mr3000_bwmod";

private _headgear = "BWA3_M92_Fleck";
private _headgearPilot = "H_HelmetCrew_0";
private _googles = "BWA3_G_Combat_Black";

private _standardWeapon = "hlc_rifle_auga3";
private _standardAmmo = "hlc_30Rnd_556x45_SOST_AUG";
private _standardAccessory = ["acc_flashlight"];
private _standardAccessoryExtra = [];

private _grenadeLauncherWeapon = "hlc_rifle_auga3_GL";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = ["acc_flashlight"];
private _grenadeLauncherAccessoryExtra = [];

private _secondaryWeapon = "CUP_hgun_Glock17";
private _secondaryAmmo = "CUP_17Rnd_9x19_glock17";
private _secondaryAccessory = ["CUP_acc_Glock17_Flashlight"];

comment "Officer";
private _oplClass = "B_officer_F"; 
comment "Squad Leader";
private _funkerClass = "B_Soldier_SL_F";
comment "Combat Life Saver";
private _medicClass = "B_medic_F";

comment "Team Leader";
private _tfClass = "B_Soldier_TL_F";
comment "Grenadier";
private _glClass = "B_Soldier_GL_F";

comment "Autorifleman";
private _mgClass = "B_soldier_AR_F";
private _mgWeapon = "hlc_lmg_m60";
private _mgAmmo = "hlc_100Rnd_762x51_B_M60E4";
private _mgAccessory = [];
private _mgAccessoryExtra = [];
comment "Ammo Bearer";
private _mgAssiClass = "B_Soldier_A_F";

comment "Helicopter Crew";
private _lmgClass = "B_helicrew_F";
private _lmgWeapon = "BWA3_MG4";
private _lmgAmmo = "BWA3_200Rnd_556x45_Tracer";
private _lmgAccessory = ["acc_flashlight"];
private _lmgAccessoryExtra = [];

comment "Rifleman (AT)";
private _atClass = "B_soldier_LAT_F";
private _atWeapon = "UK3CB_BAF_AT4_AT_Launcher";

comment "Engineer";
private _pioClass = "B_engineer_F";

comment "Repair Specialist";
private _logisticClass = "B_soldier_repair_F";
comment "Rifleman (Light)";
private _medevacClass = "B_Soldier_lite_F";
comment "Pilot";
private _pilotClass = "B_Pilot_F";

comment "classes to use: B_Soldier_F (Rifleman), B_pilotClass_F (Pilot), B_helicrew_F (Helicopter Crew)";

if(_parameterCorrect) then {
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpackGlobal _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	
	comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
	_unit forceAddUniform _uniform;
	_unit addVest _vest;
	if(_type in [_oplClass, _funkerClass, _logisticClass, _pilotClass]) then {
		_unit addBackpack _backpackLR;
	} else {
		if(_type in [_medevacClass, _medicClass]) then {
			_unit addBackpack _backpackBig;
		} else {
			_unit addBackpack _backpack;
		};
	};
	if(_type == _pilotClass) then {
		_unit addHeadgear _headgearPilot;
	} else {
		_unit addHeadgear _headgear;
	};
	_unit addGoggles _googles;
	
	comment "Loadout based on TTT-Mod (weapons near end of file)";
	if(_type == _pioClass) then {
		comment "MineDetector has to be equipped BEFORE any ACE Item to be functional";
		[_unit, "MineDetector", 2] call Spec_fnc_addItemToContainer;
	};
	
	if(_type in [_oplClass, _tfClass]) then {
		_unit addWeapon "ACE_Vector";
		[_unit,"BWA3_Beret_Falli",2] call Spec_fnc_addItemToContainer;
	} else {
		if(_type in [_atClass, _mgAssiClass, _glClass]) then{
			_unit addWeapon "ACE_Yardage450";
		} else {
			_unit addWeapon "Binocular";
		};
	};
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
	
	comment "lead equipment (tablet, etc)";
	if(_type in [_oplClass, _tfClass, _funkerClass, _logisticClass, _medevacClass, _pilotClass]) then {
		_unit addItemToUniform "ACE_microDAGR";
		if(_type in [_medevacClass, _funkerClass]) then {
			[_unit,"ACE_GD300_b",2] call Spec_fnc_addItemToContainer;
		} else {
			[_unit,"ACE_DK10_b",2] call Spec_fnc_addItemToContainer;
		};
	};
	if(_type in [_oplClass, _tfClass, _logisticClass, _pilotClass]) then {
		//[_unit,"ACE_HelmetCam",0] call Spec_fnc_addItemToContainer;
	};
	if(_type in [_oplClass, _tfClass, _funkerClass]) then {
		[_unit,"ACE_CableTie",1, 3] call Spec_fnc_addItemToContainer;
	};
	
	comment "standard equipment (ear plugs, grenades)";
	[_unit,"ACE_EarPlugs",0] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_MapTools",0] call Spec_fnc_addItemToContainer;
	
	[_unit,"ACE_IR_Strobe_Item",0,2] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_HandFlare_Green",0,2] call Spec_fnc_addItemToContainer;

	[_unit,"SmokeShell",0,2] call Spec_fnc_addItemToContainer;
	[_unit,"SmokeShellGreen",0, 2] call Spec_fnc_addItemToContainer;
	[_unit,"SmokeShellPurple",0] call Spec_fnc_addItemToContainer;
	
	comment "night equipment";
	[_unit,"ACE_Flashlight_MX991",0] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_NVG_Wide",1] call Spec_fnc_addItemToContainer;
	
	[_unit,"ACE_M84",1, 2] call Spec_fnc_addItemToContainer;

	comment "medic equipment";
	switch _type do {
		case _medicClass : {
			[_unit,"ACE_fieldDressing",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_elasticBandage",2, 15] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_quikclot",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_packingBandage",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_tourniquet",2, 3] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_salineIV_500",2, 4] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_atropine",2, 5] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_epinephrine",2, 8] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_morphine",2, 8] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_surgicalKit",2, 3] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ace_medical_medicClass", 1];
		};
		case _medevacClass : {
			[_unit,"ACE_fieldDressing",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_elasticBandage",2, 15] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_quikclot",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_packingBandage",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_tourniquet",2, 2] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_salineIV",2, 6] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_atropine",2, 8] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_epinephrine",2, 12] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_morphine",2, 12] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_surgicalKit",2, 5] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_personalAidKit",2] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ace_medical_medicClass", 2];
		};
		default {
			[_unit,"ACE_fieldDressing",2, 7] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_tourniquet",2, 2] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_morphine",2, 1] call Spec_fnc_addItemToContainer;
		};
	};
	
	comment "role specific special equipment";
	switch _type do {
		case _tfClass : {
			[_unit,"1Rnd_Smoke_Grenade_shell",2, 6] call Spec_fnc_addItemToContainer;
			[_unit,"1Rnd_SmokeRed_Grenade_shell",2, 6] call Spec_fnc_addItemToContainer;
		};
		case _glClass : {
			[_unit,"1Rnd_HE_Grenade_shell",2, 12] call Spec_fnc_addItemToContainer;
		};
		case _pioClass : {
			[_unit,"ToolKit",2] call Spec_fnc_addItemToContainer;
			[_unit,"DemoCharge_Remote_Mag",2, 2] call Spec_fnc_addItemToContainer;
			[_unit,"SLAMDirectionalMine_Wire_Mag",3, 2] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_M26_Clacker",3] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_Clacker",3] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_DefusalKit",3] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ACE_IsEngineer", 2];
		};
		case _logisticClass : {
			[_unit,"ToolKit",2] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ACE_IsEngineer", 2];
		};
		case _mgClass : {
			[_unit,"ACE_SpareBarrel",2] call Spec_fnc_addItemToContainer;
		};
		case _mgAssiClass : {
			[_unit,_mgAmmo,2, 2] call Spec_fnc_addItemToContainer;
		};
	};
	
	comment "===========================================";
	comment "==============  Weapons  ==================";
	comment "===========================================";
	
	if(_type == _mgClass) then {
		[_unit,_mgAmmo,1, 2] call Spec_fnc_addItemToContainer;
		[_unit,_mgAmmo,2] call Spec_fnc_addItemToContainer;
		_unit addWeapon _mgWeapon;
		{
			_unit addPrimaryWeaponItem _x;
		} forEach _mgAccessory;
		{
			[_unit,_x,3] call Spec_fnc_addItemToContainer;
		} forEach _mgAccessoryExtra;	
	} else {
		if(_type == _lmgClass) then {
			[_unit,_lmgAmmo,1] call Spec_fnc_addItemToContainer;
			[_unit,_lmgAmmo,2, 3] call Spec_fnc_addItemToContainer;
			
			_unit addWeapon _lmgWeapon;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _lmgAccessory;
			{
				[_unit,_x,3] call Spec_fnc_addItemToContainer;
			} forEach _lmgAccessoryExtra;				
		} else {
			comment "grenade launcher";
			if(_type in [_tfClass, _glClass]) then {
				[_unit,_grenadeLauncherAmmo,1, 6] call Spec_fnc_addItemToContainer;
				
				_unit addWeapon _grenadeLauncherWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _grenadeLauncherAccessory;
				{
					[_unit,_x,3] call Spec_fnc_addItemToContainer;
				} forEach _grenadeLauncherAccessoryExtra;
			} else {
				comment "AT launcher";
				if(_type == _atClass) then {
					_unit addWeapon _atWeapon;
				};
				comment "standard weapon";
				[_unit,_standardAmmo,1, 6] call Spec_fnc_addItemToContainer;

				_unit addWeapon _standardWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _standardAccessory;
				{
					[_unit,_x,3] call Spec_fnc_addItemToContainer;
				} forEach _standardAccessoryExtra;
			};
		};
	};
	comment "secondary weapon";
	[_unit,_secondaryAmmo,1, 3] call Spec_fnc_addItemToContainer;
	_unit addWeapon _secondaryWeapon;
	{
		_unit addSecondaryWeaponItem _x;
	} forEach _secondaryAccessory;
};
true
