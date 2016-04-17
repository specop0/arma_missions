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
#include "classVariables.hpp"
#include "addItemToContainer.hpp"

private _parameterCorrect = params [ ["_unit",objNull,[objNull]] ];
private _type = typeOf _unit;


private _uniform = "U_B_CombatUniform_mcam";
private _vest = "V_TacVest_oli";

private _backpack = "B_AssaultPack_sgg";
private _backpackBig = "B_Kitbag_sgg";

private _headgear = "H_HelmetB";

private _standardWeapon = "arifle_Mk20_plain_F";
private _standardAmmo = "30Rnd_556x45_Stanag";
private _standardAccessory = ["optic_Arco"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "hgun_Rook40_F";
private _secondaryAmmo = "16Rnd_9x21_Mag";
private _secondaryAccessory = [];

comment "Machine Gunner";
private _mgWeapon = "LMG_Zafir_F";
private _mgAmmo = "150Rnd_762x54_Box_Tracer";
private _mgAccessory = _standardAccessory;
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "rhs_weap_rpg26";
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
	_unit forceAddUniform _uniform;
	_unit setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];
	_unit addVest _vest;
	/*if(_type in [CLASS_MG]) then {
		_unit addBackpackGlobal _backpackBig;
	} else {
		_unit addBackpackGlobal _backpack;
	};*/
	_unit addHeadgear _headgear;

	if(_type in ["B_sniper_F","B_spotter_F"]) then {
		//_unit addBackpackGlobal _backpackBig;
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit addWeapon "ACE_Vector";
		
		[_unit,"ACE_MapTools",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_microDAGR",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
		if(_type == "B_sniper_F") then {
			[_unit,"7Rnd_408_Mag",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			_unit addWeapon "srifle_LRR_F";//"srifle_DMR_06_olive_F";
			_unit addPrimaryWeaponItem "optic_DMS"; // "optic_SOS"
			//_unit addPrimaryWeaponItem "CUP_bipod_Harris_1A2_L";
			[_unit,"ACE_packingBandage",ADD_ANYWHERE, 15] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_elasticBandage",ADD_ANYWHERE, 15] call Spec_fnc_addItemToContainer;
			[_unit,"7Rnd_408_Mag",ADD_ANYWHERE, 6] call Spec_fnc_addItemToContainer; // 20Rnd_762x51_Mag
		} else {
			[_unit,"ACE_Kestrel4500",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_ATragMX",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_Tripod",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_SpottingScope",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			
			[_unit,_standardAmmo,ADD_ANYWHERE, 2] call Spec_fnc_addItemToContainer;
			_unit addWeapon _standardWeapon;
			[_unit,_standardAmmo,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _standardAccessory;
			{
				[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			} forEach _standardAccessoryExtra;
		};
	} else {
		if(_type == CLASS_MG) then {
			[_unit,_mgAmmo,1] call Spec_fnc_addItemToContainer;
			_unit addWeapon _mgWeapon;
			[_unit,_mgAmmo,1, ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _mgAccessory;
			{
				[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			} forEach _mgAccessoryExtra;
		} else {
			comment "AT launcher";
			if(_type == CLASS_AT) then {
				{
					[_unit,_x,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
				} forEach _atAmmo;
				_unit addWeapon _atWeapon;
			};
			comment "Standard Weapon";
			[_unit,_standardAmmo,ADD_ANYWHERE, 6] call Spec_fnc_addItemToContainer;

			_unit addWeapon _standardWeapon;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _standardAccessory;
			{
				[_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			} forEach _standardAccessoryExtra;
		};
	};
	comment "Secondary Weapon";
	[_unit,_secondaryAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
	_unit addWeapon _secondaryWeapon;
	{
		_unit addSecondaryWeaponItem _x;
	} forEach _secondaryAccessory;
};
true
