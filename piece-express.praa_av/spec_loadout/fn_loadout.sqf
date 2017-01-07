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

private _uniform = selectRandom ["MNP_CombatUniform_US6co_A", "MNP_CombatUniform_US6co_B"];
private _vest = "MNP_Vest_6co_B";

private _backpack = "B_Kitbag_cbr";
private _backpackBig = "B_Carryall_cbr";
private _backpackLR = "tf_mr3000_bwmod_tropen";

private _headgear = "MNP_Helmet_6Co";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = selectRandom ["rhs_googles_black", "rhs_googles_yellow", "rhs_googles_orange", "rhs_googles_clear", "CUP_TK_NeckScarf", "CUP_FR_NeckScarf2"];

private _standardWeapon = "rhs_weap_m16a4_carryhandle_grip";
private _standardAmmo = "30Rnd_556x45_Stanag_Tracer_Red";
private _standardAccessory = ["rhsusf_acc_ACOG_USMC","UK3CB_BAF_LLM_IR_Black"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "rhsusf_weap_m9";
private _secondaryAmmo = "rhsusf_mag_15Rnd_9x19_JHP";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "rhs_weap_m16a4_carryhandle_M203";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "rhs_weap_m240B_CAP";
private _mgAmmo = "rhsusf_100Rnd_762x51_m62_tracer";
private _mgAccessory = ["rhsusf_acc_ELCAN","UK3CB_BAF_LLM_IR_Black"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "rhs_weap_m249_pip_S";
private _lmgAmmo = "rhs_200rnd_556x45_T_SAW";
private _lmgAccessory = ["rhsusf_acc_ELCAN", "UK3CB_BAF_LLM_IR_Black"];
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Group Marksman";
private _sniperWeapon = "rhs_weap_m14ebrri";
private _sniperAmmo = "rhsusf_20Rnd_762x51_m118_special_Mag";
private _sniperAccessory = ["rhsusf_acc_LEUPOLDMK4","UK3CB_BAF_LLM_IR_Black", "rhsusf_acc_harris_bipod"];
private _sniperAccessoryExtra = _standardAccessoryExtra;

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
    if(_type in [CLASS_OPL]) then {
        [_unit, "MNP_CombatUniform_6CO_B"] call Spec_fnc_addContainer;
    } else {
        [_unit, _uniform] call Spec_fnc_addContainer;
    };
    [_unit, _vest] call Spec_fnc_addContainer;
    if(_type in [CLASS_OPL, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_PILOT]) then {
        [_unit, _backpackLR] call Spec_fnc_addContainer;
        if(backpack _unit == "") then {
            [_unit, _backpack] call Spec_fnc_addContainer;
        };
    } else {
        if(_type in [CLASS_MEDEVAC, CLASS_LOGISTIC]) then {
            [_unit, _backpackBig] call Spec_fnc_addContainer;
        } else {
            if(_type in [CLASS_MEDIC]) then {
                [_unit, "BWA3_Kitbag_Tropen_Medic"] call Spec_fnc_addContainer;
            } else {
                if(_type in [CLASS_TF, CLASS_TF_B, CLASS_EXPLOSIVE, CLASS_MG, CLASS_LMG, CLASS_MG_ASSI]) then {
                    [_unit, _backpack] call Spec_fnc_addContainer;
                };
            };
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
        [_unit,_mgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type == CLASS_SNIPER) then {
            [_unit,_sniperAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
            _unit addWeapon _sniperWeapon;
            [_unit,_sniperAmmo,ADD_ANYWHERE, 7] call Spec_fnc_addItemToContainer;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _sniperAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _sniperAccessoryExtra;
        } else {
            if(_type == CLASS_LMG) then {
                [_unit,_lmgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
                _unit addWeapon _lmgWeapon;
                [_unit,_lmgAmmo,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
                {
                    _unit addPrimaryWeaponItem _x;
                } forEach _lmgAccessory;
                {
                    [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
                } forEach _lmgAccessoryExtra;
            } else {
                comment "Grenade launcher";
                if(_type in [CLASS_TF, CLASS_TF_B, CLASS_GL, CLASS_FUNKER]) then {
                    [_unit,_grenadeLauncherAmmo,ADD_TO_VEST, 5] call Spec_fnc_addItemToContainer;

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
                        _unit addWeapon _atWeapon;
                    };
                    comment "Standard Weapon";
                    [_unit,_standardAmmo,ADD_TO_VEST, 5] call Spec_fnc_addItemToContainer;

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
    };
    comment "MG Ammunition for MG Assistant";
    if(_type == CLASS_MG_ASSI) then {
        [_unit,_mgAmmo,ADD_TO_BACKPACK, 4] call Spec_fnc_addItemToContainer;
    };
    comment "LMG Ammunition";
    if(_type in [CLASS_TF_B]) then {
        [_unit, _lmgAmmo, ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
    };
    comment "Secondary Weapon";
    [_unit,_secondaryAmmo,ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
    _unit addWeapon _secondaryWeapon;
    {
        _unit addSecondaryWeaponItem _x;
    } forEach _secondaryAccessory;
};
true
