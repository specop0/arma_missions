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

private _parameterCorrect = (_this call Spec_fnc_loadoutParseUnitAndType) params [ ["_unit",objNull,[objNull]], ["_type","",[""]] ];

private _uniform = "MNP_CombatUniform_ROKMC";
private _vest = selectRandom ["MNP_Vest_ROK_1","MNP_Vest_ROK_2"];

private _backpack = "MNP_B_FieldPack_PLA_Basic";
private _backpackBig = "MNP_B_Carryall_PLA_Basic";
private _backpackLR = "TFAR_rt1523g_black";

private _headgear = "MNP_Helmet_ROKMC";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = "G_Combat";

private _standardWeapon = selectRandom ["CUP_arifle_Mk17_STD","CUP_arifle_Mk17_STD_FG","CUP_arifle_Mk17_STD_SFG"];
private _standardAmmo = "CUP_20Rnd_762x51_B_SCAR";
private _standardAccessory = ["CUP_acc_ANPEQ_2_desert","optic_Arco"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "CUP_hgun_M9";
private _secondaryAmmo = "CUP_15Rnd_9x19_M9";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "CUP_arifle_Mk17_STD_EGLM";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "CUP_arifle_Mk20";
private _mgAmmo = _standardAmmo;
private _mgAccessory = ["CUP_acc_ANPEQ_2_desert","optic_DMS","CUP_bipod_VLTOR_Modpod"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = _mgWeapon;
private _lmgAmmo = _standardAmmo;
private _lmgAccessory = _mgAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "CUP_launch_M136";
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
    _unit addGoggles _goggles;

    comment "===========================================";
    comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
    [_unit, _type] call Spec_fnc_loadoutStandardEquipment;
    comment "===========================================";

    if(_type == CLASS_MG) then {
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE, 8] call Spec_fnc_addItemToContainer;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type == CLASS_LMG) then {
            [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
            _unit addWeapon _lmgWeapon;
            [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE, 8] call Spec_fnc_addItemToContainer;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _lmgAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _lmgAccessoryExtra;
        } else {
            comment "Grenade launcher";
            if(_type in [CLASS_TF, CLASS_GL, CLASS_FUNKER]) then {
                [_unit,_grenadeLauncherAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
                [_unit,_grenadeLauncherAmmo,ADD_ANYWHERE_REVERSE, 8] call Spec_fnc_addItemToContainer;
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
                [_unit,_standardAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
                _unit addWeapon _standardWeapon;
                [_unit,_standardAmmo,ADD_ANYWHERE_REVERSE, 8] call Spec_fnc_addItemToContainer;
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
    [_unit,_secondaryAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
    _unit addWeapon _secondaryWeapon;
    {
        _unit addSecondaryWeaponItem _x;
    } forEach _secondaryAccessory;
};
true
