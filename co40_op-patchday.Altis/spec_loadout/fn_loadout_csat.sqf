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

private _uniform = "U_O_CombatUniform_ocamo";
private _vest = "V_TacVest_khk";

private _backpack = "B_AssaultPack_ocamo";
private _backpackBig = "B_Carryall_ocamo";
private _backpackLR = "tf_mr3000";

private _headgear = "H_HelmetLeaderO_ocamo";
private _headgearPilot = "H_PilotHelmetHeli_O";
private _googles = "G_Combat";

private _standardWeapon = "arifle_Katiba_ARCO_pointer_F";
private _standardAmmo = "30Rnd_65x39_caseless_green";
private _standardAccessory = [""];
private _standardAccessoryExtra = ["optic_Aco"];

private _secondaryWeapon = "hgun_Rook40_F";
private _secondaryAmmo = "16Rnd_9x21_Mag";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "arifle_Katiba_GL_ARCO_pointer_F";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "LMG_Zafir_ARCO_F";
private _mgAmmo = "150Rnd_762x54_Box_Tracer";
private _mgAccessory = ["acc_pointer_IR"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "LMG_Mk200_LP_BI_F";
private _lmgAmmo = "200Rnd_65x39_cased_Box";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "launch_RPG32_F";
private _atAmmo = ["RPG32_F","RPG32_F"];

if(_parameterCorrect) then {
	if(side _unit == west) then {

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
				[_unit,_lmgAmmo,2, 3] call Spec_fnc_addItemToContainer;

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
						_unit addWeapon _atWeapon;
					};
					comment "MG Ammunition for MG Assistant";
					if(_type == Spec_var_mgAssiClass) then {
						[_unit,_mgAmmo,2, 2] call Spec_fnc_addItemToContainer;
					};
					comment "Standard Weapon";
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
		comment "Secondary Weapon";
		[_unit,_secondaryAmmo,3, 3] call Spec_fnc_addItemToContainer;
		_unit addWeapon _secondaryWeapon;
		{
			_unit addSecondaryWeaponItem _x;
		} forEach _secondaryAccessory;
	};
};
true
