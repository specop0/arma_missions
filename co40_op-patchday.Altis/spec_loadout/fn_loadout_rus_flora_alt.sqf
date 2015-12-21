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

private _uniform = "rhs_uniform_flora_patchless_alt"; //rhs_uniform_mflora_patchless
private _vest = "rhs_6b23_ML_6sh92";

private _backpack = "B_AssaultPack_khk";
private _backpackBig = "B_Carryall_oli";
private _backpackLR = "tf_mr3000_rhs";

private _headgear = "rhs_6b26";
_headgear = ["rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala"] call BIS_fnc_selectRandom;
private _headgearPilot = "H_PilotHelmetHeli_B";
private _googles = "G_Combat";

private _standardWeapon = "rhs_weap_ak74m_camo";
_standardWeapon = ["rhs_weap_ak74m_camo","rhs_weap_ak74m_2mag_camo"] call BIS_fnc_selectRandom;
private _standardAmmo = "rhs_30Rnd_545x39_AK";
private _standardAccessory = ["rhs_acc_1pn93_1"];
private _standardAccessoryExtra = ["rhs_acc_pkas"];

private _secondaryWeapon = "rhs_weap_pya";
private _secondaryAmmo = "rhs_mag_9x19_17";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "rhs_weap_ak74m_gp25";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "rhs_weap_pkp";
private _mgAmmo = "rhs_100Rnd_762x54mmR_green";
private _mgAccessory = _standardAccessory;
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = _standardWeapon; //RPK only in CUP
private _lmgAmmo = "rhs_45Rnd_545X39_AK";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "rhs_weap_rpg7";
private _atAmmo = ["rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VL_mag"];

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
			_vest = "rhs_6b23_ML_6sh92_vog";
		};
		case Spec_var_tfClass : {
			_vest = "rhs_6b23_ML_6sh92_headset";
		};
		case Spec_var_oplClass : {
			_vest = "rhs_6b23_ML_6sh92_headset";
		};
		case Spec_var_funkerClass : {
			_vest = "rhs_6b23_ML_6sh92_radio";
		};
		case Spec_var_medicClass : {
			_vest = "rhs_6b23_ML_medic";
		};
		case Spec_var_medevacClass : {
			_vest = "rhs_6b23_ML_medic";
		};
		case Spec_var_pioClass : {
			_vest = "rhs_6b23_ML_engineer";
		};
		case Spec_var_logisticClass : {
			_vest = "rhs_6b23_ML_engineer";
		};
	};
	[_unit, _vest] call Spec_fnc_addContainer;
	if(_type == Spec_var_oplClass || _type == Spec_var_funkerClass || _type == Spec_var_logisticClass || _type == Spec_var_pilotClass) then {
		[_unit, _backpackLR] call Spec_fnc_addContainer;
		if(backpack _unit == "") then {
			[_unit, _backpack] call Spec_fnc_addContainer;
		};
	} else {
		if(_type == Spec_var_medevacClass || _type == Spec_var_pioClass) then {
			[_unit, _backpackBig] call Spec_fnc_addContainer;
		} else {
			[_unit, _backpack] call Spec_fnc_addContainer;
		};
	};
	if(_type == Spec_var_pilotClass) then {
		_unit addHeadgear _headgearPilot;
	} else {
		_unit addHeadgear _headgear;
	};
	_unit addGoggles _googles;

	comment "===========================================";
	comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
	[_unit, _type] call Spec_fnc_loadoutStandardEquipment;
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
					_secondaryAccessory pushBack "rhs_acc_1pn93_2";
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
