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

private _uniform = "UK3CB_BAF_U_CombatUniform_DPMW";
private _vest = selectRandom [
    "UK3CB_BAF_V_Osprey_DPMW2",
    "UK3CB_BAF_V_Osprey_DPMW3",
    "UK3CB_BAF_V_Osprey_DPMW4",
    "UK3CB_BAF_V_Osprey_DPMW5",
    "UK3CB_BAF_V_Osprey_DPMW6",
    "UK3CB_BAF_V_Osprey_DPMW7",
    "UK3CB_BAF_V_Osprey_DPMW8",
    "UK3CB_BAF_V_Osprey_DPMW9"
];

private _backpack = selectRandom [
    "UK3CB_BAF_B_Bergen_DPMW_Rifleman_A",
    "UK3CB_BAF_B_Bergen_DPMW_Rifleman_B",
    "UK3CB_BAF_B_Kitbag_DPMW"
];
private _backpackBig = "UK3CB_BAF_B_Carryall_DPMW";
private _backpackLR = "UK3CB_BAF_B_Bergen_DPMW_JTAC_A";

private _headgear = selectRandom [
    "UK3CB_BAF_H_Mk6_DPMW_A",
    "UK3CB_BAF_H_Mk6_DPMW_B",
    "UK3CB_BAF_H_Mk6_DPMW_C",
    "UK3CB_BAF_H_Mk6_DPMW_D",
    "UK3CB_BAF_H_Mk6_DPMW_E",
    "UK3CB_BAF_H_Mk6_DPMW_F"
];
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = "";
if (_headgear in ["UK3CB_BAF_H_Mk6_DPMW_A", "UK3CB_BAF_H_Mk6_DPMW_B", "UK3CB_BAF_H_Mk6_DPMW_C"]) then {
    _goggles = selectRandom [
        "UK3CB_BAF_G_Tactical_Black",
        "UK3CB_BAF_G_Tactical_Clear",
        "UK3CB_BAF_G_Tactical_Grey",
        "UK3CB_BAF_G_Tactical_Orange",
        "UK3CB_BAF_G_Tactical_Yellow"
    ];
};

private _standardWeapon = "UK3CB_BAF_L85A2";
private _standardAmmo = "UK3CB_BAF_556_30Rnd";
private _standardAccessory = ["UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "UK3CB_BAF_L131A1";
private _secondaryAmmo = "UK3CB_BAF_9_17Rnd";
private _secondaryAccessory = [];

// Weapon with Underslung Grenade Launcher
private _grenadeLauncherWeapon = "UK3CB_BAF_L85A2_UGL";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

// Machine Gunner
private _mgWeapon = "UK3CB_BAF_L7A2";
private _mgAmmo = "UK3CB_BAF_762_100Rnd_T";
private _mgAccessory = ["rhsusf_acc_ELCAN"];
private _mgAccessoryExtra = _standardAccessoryExtra;

// Light Machine Gunner
private _lmgWeapon = "UK3CB_BAF_L110A2";
private _lmgAmmo = "UK3CB_BAF_556_200Rnd_T";
private _lmgAccessory = ["UK3CB_BAF_TA31F"];
private _lmgAccessoryExtra = _standardAccessoryExtra;

// Launcher
private _atSimple = "UK3CB_BAF_AT4_CS_AP_Launcher";
private _atWeapon = "UK3CB_BAF_Javelin_Slung_Tube";
private _atAmmo = ["UK3CB_BAF_Javelin_CLU"];
private _aaWeapon = "rhs_weap_fim92";
private _aaAmmo = ["rhs_fim92_mag", "rhs_fim92_mag"];

if(_parameterCorrect) then {
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    // Vest, Uniform, Backpack, Headgear , Googgles
    [_unit, _uniform] call Spec_fnc_addContainer;
    [_unit, _vest] call Spec_fnc_addContainer;
    if(_type in [CLASS_OPL, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_PILOT]) then {
        [_unit, _backpackLR] call Spec_fnc_addContainer;
        if(backpack _unit isEqualTo "") then {
            [_unit, _backpack] call Spec_fnc_addContainer;
        };
    } else {
        if(_type in [CLASS_MEDEVAC, CLASS_EOD, CLASS_MG_ASSI]) then {
            [_unit, _backpackBig] call Spec_fnc_addContainer;
        } else {
            [_unit, _backpack] call Spec_fnc_addContainer;
        };
    };
    if(_type isEqualTo CLASS_PILOT) then {
        _unit addHeadgear _headgearPilot;
    } else {
        _unit addHeadgear _headgear;
    };
    _unit addGoggles _goggles;

    // ===========================================
    // standard equipment (Map, Grenades, Medic Stuff, Explosives)";
    [_unit, _type] call Spec_fnc_loadoutStandardEquipment;
    // ===========================================

    if(_type isEqualTo CLASS_MG) then {
        [_unit,_mgAmmo,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE, 1] call Spec_fnc_addItemToContainer;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type isEqualTo CLASS_LMG) then {
            [_unit,_lmgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
            _unit addWeapon _lmgWeapon;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _lmgAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _lmgAccessoryExtra;
            [_unit,_lmgAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
        } else {
            // Grenade launcher
            if(_type in [CLASS_TF, CLASS_TF_MG, CLASS_GL, CLASS_FUNKER]) then {
                [_unit,_grenadeLauncherAmmo,ADD_TO_VEST, 6] call Spec_fnc_addItemToContainer;
                _unit addWeapon _grenadeLauncherWeapon;
                {
                    _unit addPrimaryWeaponItem _x;
                } forEach _grenadeLauncherAccessory;
                {
                    [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
                } forEach _grenadeLauncherAccessoryExtra;
            } else {
                // Standard Weapon
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
    // AT & AA launcher
    if(_type isEqualTo CLASS_AT_LIGHT) then {
        _unit addWeapon _atSimple;
    };
    if(_type isEqualTo CLASS_AT) then {
        _unit addWeapon _atWeapon;
    };
    if(_type isEqualTo CLASS_AT_ASSI) then {
        {
            [_unit,_x,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        } forEach _atAmmo;
    };
    if(_type isEqualTo CLASS_AA) then {
        _unit addWeapon _aaWeapon;
    };
    if(_type isEqualTo CLASS_AA_ASSI) then {
        {
            [_unit,_x,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        } forEach _aaAmmo;
    };
    // MG Ammunition for MG Assistant
    if(_type isEqualTo CLASS_MG_ASSI) then {
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE, 4] call Spec_fnc_addItemToContainer;
    };
    if(_type isEqualTo CLASS_TF_MG) then {
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE, 2] call Spec_fnc_addItemToContainer;
    };

    // Secondary Weapon
    [_unit,_secondaryAmmo,ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
    _unit addWeapon _secondaryWeapon;
    {
        _unit addSecondaryWeaponItem _x;
    } forEach _secondaryAccessory;
};
true
