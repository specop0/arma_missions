/*
	Author: SpecOp0

	Description:
	Assigns a loadout to a given unit.
	
	Parameter(s):
	0: OBJECT - unit to assign loadout to

	Returns:
	true
*/
#include "addItemToContainer.hpp"

waitUntil {!isNull player || isServer};
private _parameterCorrect = params [["_unit",objNull,[objNull]]];
private _type = "";
if !(_unit isKindOf "Man") then {
	_parameterCorrect = params [ "", ["_caller", objNull,[objNull]] ];
	if(_parameterCorrect) then {
		_unit = _caller;
	};
	if ((_this select 3) isEqualTypeAny ["",[]]) then {
		private _addActionParameterCorrect = (_this select 3) params [ ["_typeAddActionArg","",["STRING"]] ];
		if(_addActionParameterCorrect) then {
			_type = _typeAddActionArg;
		};
	};
};

private _uniform = "LOP_U_TKA_Fatigue_01";
private _vest = "rhs_6sh92_digi";
private _backpack = "rhs_sidor";

private _headgear = "LOP_H_SSh68Helmet_TAN";

private _standardWeapon = "CUP_arifle_Sa58RIS1_des";//"rhs_weap_akms";
private _standardAmmo = "CUP_30Rnd_Sa58_M_TracerR";//"rhs_30Rnd_762x39mm_tracer";
private _standardAccessory = ["acc_flashlight"];//["rhs_acc_2dpZenit"];
private _standardAccessoryExtra = [];

private _grenadeLauncherWeapon = _standardWeapon;
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Team Leader";
private _tfClass = "O_Soldier_TL_F";

comment "Autorifleman";
private _mgClass = "O_Soldier_AR_F";
private _mgWeapon = "CUP_lmg_Mk48_des";
private _mgAmmo = "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
private _mgAccessory = _standardAccessory;
private _mgAccessoryExtra = [];

comment "Rifleman (AT)";
private _atClass = "O_Soldier_LAT_F";
private _atWeapon = "rhs_weap_rpg26";

comment "Rifleman";
private _riflemanClass = "O_Soldier_F";

if(_parameterCorrect) then {
	if(side _unit == east) then {
		if(_type == "") then {
			_type = typeOf _unit;
		};
		
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
		if(_type == _mgClass) then {
			_unit addBackpackGlobal _backpack;
		};
		_unit addHeadgear _headgear;
		
		comment "Loadout based on TTT-Mod (weapons near end of file)";
		if(_type == _tfClass) then {
			_unit addWeapon "ACE_Vector";
		} else {
			if(_type == _atClass || _type == _mgClass) then{
				_unit addWeapon "ACE_Yardage450";
			} else {
				_unit addWeapon "Binocular";
			};
		};
		
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "tf_fadak_1";
		
		comment "lead equipment (tablet, etc)";
		if(_type == _tfClass) then {
			[_unit,"ACE_CableTie",ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
		};
		
		comment "standard equipment (ear plugs, grenades)";
		[_unit,"ACE_EarPlugs",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_MapTools",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
		
		[_unit,"ACE_IR_Strobe_Item",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_HandFlare_Yellow",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;

		[_unit,"SmokeShell",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;
		[_unit,"SmokeShellGreen",ADD_TO_UNIFORM, 2] call Spec_fnc_addItemToContainer;
		[_unit,"SmokeShellPurple",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
		
		comment "night equipment";
		[_unit,"ACE_Flashlight_MX991",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
		
		[_unit,"ACE_M84",ADD_TO_VEST, 2] call Spec_fnc_addItemToContainer;

		comment "medic equipment";
		switch _type do {
			default {
				[_unit,"ACE_fieldDressing",ADD_TO_VEST, 7] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_tourniquet",ADD_TO_VEST, 2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",ADD_TO_VEST, 1] call Spec_fnc_addItemToContainer;
			};
		};
		
		comment "role specific special equipment";
		switch _type do {
			case _tfClass : {
				[_unit,"1Rnd_HE_Grenade_shell",ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
			};
			case _mgClass : {
				[_unit,"ACE_SpareBarrel",ADD_TO_VEST] call Spec_fnc_addItemToContainer;
			};
		};
		
		comment "===========================================";
		comment "==============  Weapons  ==================";
		comment "===========================================";
		
		if(_type == _mgClass) then {
			[_unit,_mgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
			_unit addWeapon _mgWeapon;
			[_unit,_mgAmmo,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _mgAccessory;
			{
				[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			} forEach _mgAccessoryExtra;	
		} else {
			comment "grenade launcher";
			if(_type == _tfClass) then {
				[_unit,_grenadeLauncherAmmo,ADD_TO_VEST, 5] call Spec_fnc_addItemToContainer;
				_unit addWeapon _grenadeLauncherWeapon;
				[_unit,_standardAmmo,ADD_TO_VEST,1] call Spec_fnc_addItemToContainer;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _grenadeLauncherAccessory;
				{
					[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
				} forEach _grenadeLauncherAccessoryExtra;
			} else {
				comment "AT launcher";
				if(_type == _atClass) then {
					_unit addWeapon _atWeapon;
				};
				comment "standard weapon";
				[_unit,_standardAmmo,ADD_TO_VEST,5] call Spec_fnc_addItemToContainer;
				_unit addWeapon _standardWeapon;
				[_unit,_standardAmmo,ADD_TO_VEST,1] call Spec_fnc_addItemToContainer;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _standardAccessory;
				{
					[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
				} forEach _standardAccessoryExtra;
			};
		};
	};
};
