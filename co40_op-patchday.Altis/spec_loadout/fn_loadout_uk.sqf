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

private _uniform = "UK3CB_BAF_U_CombatUniform_MTP";
private _vest = "UK3CB_BAF_V_Osprey_Holster";

private _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_A";

private _headgear = "UK3CB_BAF_H_Mk7_Camo_A";
_headgear = ["UK3CB_BAF_H_Mk7_Camo_A","UK3CB_BAF_H_Mk7_Camo_B","UK3CB_BAF_H_Mk7_Camo_C","UK3CB_BAF_H_Mk7_Camo_D","UK3CB_BAF_H_Mk7_Camo_E","UK3CB_BAF_H_Mk7_Camo_F","UK3CB_BAF_H_Mk7_Camo_ESS_A","UK3CB_BAF_H_Mk7_Camo_ESS_B","UK3CB_BAF_H_Mk7_Camo_ESS_C","UK3CB_BAF_H_Mk7_Camo_ESS_D","UK3CB_BAF_H_Mk7_Camo_CESS_A","UK3CB_BAF_H_Mk7_Camo_CESS_B","UK3CB_BAF_H_Mk7_Camo_CESS_C","UK3CB_BAF_H_Mk7_Camo_CESS_D"] call BIS_fnc_selectRandom;
private _headgearPilot = "H_PilotHelmetHeli_B";
private _googles = ["UK3CB_BAF_G_Tactical_Black","UK3CB_BAF_G_Tactical_Clear","UK3CB_BAF_G_Tactical_Grey","UK3CB_BAF_G_Tactical_Orange","UK3CB_BAF_G_Tactical_Yellow"] call BIS_fnc_selectRandom;

private _standardWeapon = "UK3CB_BAF_L85A2_RIS_LDSR2D_IR";
private _standardAmmo = "UK3CB_BAF_30Rnd";
private _standardAccessory = ["UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_SpecterLDS_Dot"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "UK3CB_BAF_L131A1";
private _secondaryAmmo = "UK3CB_BAF_17Rnd_9mm";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "UK3CB_BAF_L85A2_UGLLAD_LDSR2D_IR";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "UK3CB_BAF_L7A2";
private _mgAmmo = "UK3CB_BAF_75Rnd_T";
private _mgAccessory = ["rhsusf_acc_ELCAN"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "UK3CB_BAF_L110A2_TA31F";
private _lmgAmmo = "UK3CB_BAF_200Rnd_T";
private _lmgAccessory = ["UK3CB_BAF_TA31F"];
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "UK3CB_BAF_AT4_CS_AP_Launcher";
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
		case Spec_var_glClass : {
			_vest = ["UK3CB_BAF_V_Osprey_Grenadier_A","UK3CB_BAF_V_Osprey_Grenadier_B"] call BIS_fnc_selectRandom;
		};
		case Spec_var_tfClass : {
			_vest = ["UK3CB_BAF_V_Osprey_SL_A","UK3CB_BAF_V_Osprey_SL_B","UK3CB_BAF_V_Osprey_SL_C","UK3CB_BAF_V_Osprey_SL_D"] call BIS_fnc_selectRandom;
		};
		case Spec_var_oplClass : {
			_vest = ["UK3CB_BAF_V_Osprey_SL_A","UK3CB_BAF_V_Osprey_SL_B","UK3CB_BAF_V_Osprey_SL_C","UK3CB_BAF_V_Osprey_SL_D"] call BIS_fnc_selectRandom;
		};
		case Spec_var_funkerClass : {
			_vest = ["UK3CB_BAF_V_Osprey_SL_A","UK3CB_BAF_V_Osprey_SL_B","UK3CB_BAF_V_Osprey_SL_C","UK3CB_BAF_V_Osprey_SL_D"] call BIS_fnc_selectRandom;
		};
		case Spec_var_medicClass : {
			_vest = ["UK3CB_BAF_V_Osprey_Medic_B","UK3CB_BAF_V_Osprey_Medic_C","UK3CB_BAF_V_Osprey_Medic_D"] call BIS_fnc_selectRandom;
		};
		case Spec_var_medevacClass : {
			_vest = ["UK3CB_BAF_V_Osprey_Medic_B","UK3CB_BAF_V_Osprey_Medic_C","UK3CB_BAF_V_Osprey_Medic_D"] call BIS_fnc_selectRandom;
		};
		case Spec_var_mgClass : {
			_vest = "UK3CB_BAF_V_Osprey_MG_B";
		};
		case Spec_var_lmgClass : {
			_vest = "UK3CB_BAF_V_Osprey_MG_B";
		};
		default {
			_vest = ["UK3CB_BAF_V_Osprey_Holster","UK3CB_BAF_V_Osprey_Rifleman_B","UK3CB_BAF_V_Osprey_Rifleman_C","UK3CB_BAF_V_Osprey_Rifleman_D","UK3CB_BAF_V_Osprey_Rifleman_E","UK3CB_BAF_V_Osprey_Rifleman_F"] call BIS_fnc_selectRandom;
		};
	};
	[_unit, _vest] call Spec_fnc_addContainer;
	
	switch (_type) do {
		// long ranges
		case Spec_var_funkerClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_JTAC_H_A";
		};
		case Spec_var_logisticClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Radio_H_B";
		};
		case Spec_var_pilotClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Radio_L_A";
		};
		case Spec_var_oplClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Radio_L_B";
		};
		// big backpacks
		case Spec_var_medevacClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Medic_H_B";
		};
		case Spec_var_pioClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Sapper_L_A";
		};
		// normal backpacks
		case Spec_var_medicClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Medic_L_A";
		};
		case Spec_var_mgClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";
		};
		case Spec_var_lmgClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";
		};
		case Spec_var_mgAssiClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A";
		};
		case Spec_var_tfClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C";
		};
		case Spec_var_glClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";
		};
		case Spec_var_atClass : {
			_backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C";
		};
	};
	[_unit, _backpack] call Spec_fnc_addContainer;

	if(_type == Spec_var_pilotClass) then {
		_unit addHeadgear _headgearPilot;
	} else {
		_unit addHeadgear _headgear;
	};
	_unit addGoggles _googles;

	comment "===========================================";
	comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
	[_unit, _type] call Spec_fnc_loadoutStandardEquipment;
	_unit removeItem "ACE_NVG_Wide";
	[_unit,"UK3CB_BAF_HMNVS",1] call Spec_fnc_addItemToContainer;
	[_unit,"UK3CB_BAF_H_Beret_PR",2] call Spec_fnc_addItemToContainer;
	comment "===========================================";

	if(_type == Spec_var_mgClass) then {
		[_unit,_mgAmmo,1] call Spec_fnc_addItemToContainer;
		[_unit,_mgAmmo,2, 2] call Spec_fnc_addItemToContainer;
		_unit addWeapon _mgWeapon;
		{
			_unit addPrimaryWeaponItem _x;
		} forEach _mgAccessory;
		{
			[_unit,_x,3] call Spec_fnc_addItemToContainer;
		} forEach _mgAccessoryExtra;
	} else {
		if(_type == Spec_var_lmgClass) then {
			[_unit,_lmgAmmo,1] call Spec_fnc_addItemToContainer;
			[_unit,_lmgAmmo,2, 2] call Spec_fnc_addItemToContainer;

			_unit addWeapon _lmgWeapon;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _lmgAccessory;
			{
				[_unit,_x,3] call Spec_fnc_addItemToContainer;
			} forEach _lmgAccessoryExtra;
		} else {
			comment "Grenade launcher";
			if(_type == Spec_var_tfClass || _type == Spec_var_glClass) then {
				[_unit,_grenadeLauncherAmmo,2, 6] call Spec_fnc_addItemToContainer;

				_unit addWeapon _grenadeLauncherWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _grenadeLauncherAccessory;
				{
					[_unit,_x,3] call Spec_fnc_addItemToContainer;
				} forEach _grenadeLauncherAccessoryExtra;
			} else {
				comment "AT launcher";
				if(_type == Spec_var_atClass) then {
					{
						[_unit,_x,2] call Spec_fnc_addItemToContainer;
					} forEach _atAmmo;
					_unit addWeapon _atWeapon;
				};
				comment "MG Ammunition for MG Assistant";
				if(_type == Spec_var_mgAssiClass) then {
					[_unit,_mgAmmo,2, 2] call Spec_fnc_addItemToContainer;
				};
				comment "Standard Weapon";
				[_unit,_standardAmmo,3, 6] call Spec_fnc_addItemToContainer;

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
	comment "Secondary Weapon";
	[_unit,_secondaryAmmo,3, 3] call Spec_fnc_addItemToContainer;
	_unit addWeapon _secondaryWeapon;
	{
		_unit addSecondaryWeaponItem _x;
	} forEach _secondaryAccessory;
};
true
