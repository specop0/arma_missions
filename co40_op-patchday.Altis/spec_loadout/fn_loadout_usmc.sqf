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
#include "addItemToContainer.hpp"
#include "classVariables.hpp"

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
	// normal call
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

private _uniform = "rhs_uniform_FROG01_d";
private _vest = "rhsusf_spc_rifleman";

private _backpack = "rhsusf_assault_eagleaiii_coy";
private _backpackBig = "B_Carryall_cbr";
private _backpackLR = "tf_anprc155_coyote";

private _headgear = ["rhsusf_lwh_helmet_marpatd","rhsusf_lwh_helmet_marpatd_ess","rhsusf_lwh_helmet_marpatd_headset"] call selectRandom;
private _headgearPilot = "H_PilotHelmetHeli_B";
private _googles = "G_Combat";

private _standardWeapon = "rhs_m4a1_grip_acog";
private _standardAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
private _standardAccessory = ["rhsusf_acc_anpeq15side","rhsusf_acc_ACOG"];
private _standardAccessoryExtra = ["rhsusf_acc_eotech_552"];

private _secondaryWeapon = "rhsusf_weap_m1911a1";
private _secondaryAmmo = "rhsusf_mag_7x45acp_MHP";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "rhs_weap_m4a1_m320";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "rhs_weap_m240B_CAP";
private _mgAmmo = "rhsusf_100Rnd_762x51_m62_tracer";
private _mgAccessory = ["rhsusf_acc_ELCAN"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "rhs_weap_m249_pip_elcan";
private _lmgAmmo = "rhs_200rnd_556x45_T_SAW";
private _lmgAccessory = ["rhsusf_acc_ELCAN"];
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "rhs_weap_M136";
private _atAmmo = [];

if(_parameterCorrect) then {
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
	[_unit, _uniform] call Spec_fnc_addContainer;
	switch (_type) do {
		case CLASS_MG : {
			_vest = "rhsusf_spc_mg";
		};
		case CLASS_LMG : {
			_vest = "rhsusf_spc_mg";
		};
		case CLASS_TF : {
			_vest = "rhsusf_spc_Squadleader";
		};
		case CLASS_OPL : {
			_vest = "rhsusf_spc_Squadleader";
		};
		case CLASS_FUNKER : {
			_vest = "rhsusf_spc_Teamleader";
		};
	};
	[_unit, _vest] call Spec_fnc_addContainer;
	if(_type in [CLASS_OPL, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_PILOT]) then {
		[_unit, _backpackLR] call Spec_fnc_addContainer;
		if(backpack _unit == "") then {
			[_unit, _backpack] call Spec_fnc_addContainer;
		};
	} else {
		if(_type in [CLASS_MEDEVAC, CLASS_PIO]) then {
			[_unit, _backpackBig] call Spec_fnc_addContainer;
		} else {
			[_unit, _backpack] call Spec_fnc_addContainer;
		};
	};
	if(_type == CLASS_PILOT) then {
		_unit addHeadgear _headgearPilot;
	} else {
		_unit addHeadgear _headgear;
	};
	_unit addGoggles _googles;

	comment "===========================================";
	comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
	[_unit, _type] call Spec_fnc_loadoutStandardEquipment;
	comment "===========================================";

	if(_type == CLASS_MG) then {
		[_unit,_mgAmmo,ADD_ANYWHERE, 2] call Spec_fnc_addItemToContainer;
		_unit addWeapon _mgWeapon;
		{
			_unit addPrimaryWeaponItem _x;
		} forEach _mgAccessory;
		{
			[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
		} forEach _mgAccessoryExtra;
		[_unit,_mgAmmo,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
	} else {
		if(_type == CLASS_LMG) then {
			[_unit,_lmgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
			[_unit,_lmgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
			_unit addWeapon _lmgWeapon;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _lmgAccessory;
			{
				[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			} forEach _lmgAccessoryExtra;
			[_unit,_lmgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
		} else {
			comment "Grenade launcher";
			if(_type in [CLASS_TF, CLASS_GL, CLASS_FUNKER]) then {
				[_unit,_grenadeLauncherAmmo,ADD_TO_VEST, 6] call Spec_fnc_addItemToContainer;

				_unit addWeapon _grenadeLauncherWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _grenadeLauncherAccessory;
				{
					[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
				} forEach _grenadeLauncherAccessoryExtra;
			} else {
				comment "AT launcher";
				if(_type == CLASS_AT) then {
					{
						[_unit,_x,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
					} forEach _atAmmo;
					_unit addWeapon _atWeapon;
				};
				comment "MG Ammunition for MG Assistant";
				if(_type == CLASS_MG_ASSI) then {
					[_unit,_mgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
				};
				comment "Standard Weapon";
				[_unit,_standardAmmo,ADD_TO_VEST, 6] call Spec_fnc_addItemToContainer;

				_unit addWeapon _standardWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _standardAccessory;
				{
					[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
				} forEach _standardAccessoryExtra;
			};
		};
	};
	comment "Secondary Weapon";
	[_unit,_secondaryAmmo,ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
	_unit addWeapon _secondaryWeapon;
	{
		_unit addSecondaryWeaponItem _x;
	} forEach _secondaryAccessory;
};
true
