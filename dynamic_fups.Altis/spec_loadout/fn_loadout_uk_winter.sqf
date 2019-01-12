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

private _uniform = "UK3CB_BAF_U_Smock_Arctic";
private _vest = "UK3CB_BAF_V_Osprey_Winter";

private _backpack = "UK3CB_BAF_B_Kitbag_Arctic";

private _headgear = "UK3CB_BAF_H_Mk7_Camo_A";
_headgear = selectRandom ["UK3CB_BAF_H_Mk7_Win_A","UK3CB_BAF_H_Mk7_Win_ESS_A"];
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = selectRandom ["UK3CB_BAF_G_Tactical_Black","UK3CB_BAF_G_Tactical_Clear","UK3CB_BAF_G_Tactical_Grey","UK3CB_BAF_G_Tactical_Orange","UK3CB_BAF_G_Tactical_Yellow"];

private _standardWeapon = "UK3CB_BAF_L85A2";
private _standardAmmo = "UK3CB_BAF_556_30Rnd";
private _standardAccessory = ["UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "UK3CB_BAF_L131A1";
private _secondaryAmmo = "UK3CB_BAF_9_17Rnd";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "UK3CB_BAF_L85A2_UGL";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "UK3CB_BAF_L7A2";
private _mgAmmo = "UK3CB_BAF_762_100Rnd_T";
private _mgAccessory = ["rhsusf_acc_ELCAN"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "UK3CB_BAF_L110A2";
private _lmgAmmo = "UK3CB_BAF_556_200Rnd_T";
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
    [_unit, _vest] call Spec_fnc_addContainer;
    
    switch (_type) do {
        // long ranges
        case CLASS_FUNKER : {
            _backpack = "UK3CB_BAF_B_Bergen_Arctic_JTAC_A";
        };
        case CLASS_LOGISTIC : {
            _backpack = "UK3CB_BAF_B_Bergen_Arctic_SL_A";
        };
        case CLASS_PILOT : {
            _backpack = "UK3CB_BAF_B_Bergen_Arctic_SL_A";
        };
        case CLASS_OPL : {
            _backpack = "UK3CB_BAF_B_Bergen_Arctic_JTAC_H_A";
        };
        // big backpacks
        case CLASS_MEDEVAC : {
            _backpack = "UK3CB_BAF_B_Bergen_Arctic_Rifleman_B";
        };
        case CLASS_MEDIC : {
            _backpack = "UK3CB_BAF_B_Bergen_Arctic_Rifleman_A";
        };
        case CLASS_PIO : {
            _backpack = "UK3CB_BAF_B_Carryall_Arctic";
        };
    };
    [_unit, _backpack] call Spec_fnc_addContainer;

    if(_type == CLASS_PILOT) then {
        _unit addHeadgear _headgearPilot;
    } else {
        _unit addHeadgear _headgear;
    };
    _unit addGoggles _goggles;

    comment "===========================================";
    comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
    [_unit, _type] call Spec_fnc_loadoutStandardEquipment;
    _unit removeItem "ACE_NVG_Wide";
    [_unit,"UK3CB_BAF_HMNVS",ADD_TO_VEST] call Spec_fnc_addItemToContainer;
    [_unit,"UK3CB_BAF_H_Beret_PR",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
    comment "===========================================";

    if(_type == CLASS_MG) then {
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE, 2] call Spec_fnc_addItemToContainer;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type == CLASS_LMG) then {
            [_unit,_lmgAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
            _unit addWeapon _lmgWeapon;
            [_unit,_lmgAmmo,ADD_ANYWHERE_REVERSE, 3] call Spec_fnc_addItemToContainer;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _lmgAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _lmgAccessoryExtra;
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
    };
    comment "Secondary Weapon";
    [_unit,_secondaryAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
    _unit addWeapon _secondaryWeapon;
    {
        _unit addSecondaryWeaponItem _x;
    } forEach _secondaryAccessory;
};
true
