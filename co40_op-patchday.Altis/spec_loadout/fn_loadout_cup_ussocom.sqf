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

private _uniform = selectRandom ["CUP_U_B_USMC_MARPAT_WDL_RollUpKneepad", "CUP_U_B_USMC_MARPAT_WDL_RolledUp", "CUP_U_B_USMC_MARPAT_WDL_Kneepad", "CUP_U_B_USMC_MARPAT_WDL_TwoKneepads", "CUP_U_B_USMC_MARPAT_WDL_Sleeves"];
private _vest = "CUP_V_B_MTV_TL";

private _backpack = selectRandom ["CUP_B_AssaultPack_Coyote","CUP_B_USMC_MOLLE"];
private _backpackBig = "CUP_B_USPack_Coyote";
private _backpackLR = "TTT_Backpack_Funkerfac_Us_Woodland";

private _headgear = selectRandom ["CUP_H_USMC_HelmetWDL","CUP_H_USMC_Goggles_HelmetWDL","CUP_H_USMC_Headset_HelmetWDL","CUP_H_USMC_Headset_GoggleW_HelmetWDL"];
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = "G_Combat";

private _standardWeapon = "CUP_arifle_M16A4_Base";
private _standardAmmo = "CUP_30Rnd_556x45_Stanag";
private _standardAccessory = ["CUP_acc_ANPEQ_2","CUP_optic_ACOG"];
private _standardAccessoryExtra = ["CUP_optic_CompM2_Black"];

private _secondaryWeapon = "CUP_hgun_M9";
private _secondaryAmmo = "CUP_15Rnd_9x19_M9";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "CUP_arifle_M16A4_GL";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "CUP_lmg_M240";
private _mgAmmo = "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
private _mgAccessory = ["CUP_optic_ElcanM145"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "CUP_lmg_M249_E2";
private _lmgAmmo = "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
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
    if(_type isEqualTo CLASS_OPL) then {
        _uniform = "CUP_U_B_USMC_Officer";
    };
    [_unit, _uniform, 0] call Spec_fnc_addContainer;
    switch (_type) do {
        case CLASS_LMG : {
            _vest = "CUP_V_B_MTV_MG";
        };
        case CLASS_MG : {
            _vest = "CUP_V_B_MTV_MG";
        };
        case CLASS_MG_ASSI : {
            _vest = "CUP_V_B_MTV_Pouches";
        };
        case CLASS_GL : {
            _vest = "CUP_V_B_MTV_Marksman";
        };
        case CLASS_PIO : {
            _vest = "CUP_V_B_MTV_Mine";
        };
        case CLASS_MEDIC : {
            _vest = "CUP_V_B_MTV_LegPouch";
        };
        case CLASS_MEDEVAC : {
            _vest = "CUP_V_B_MTV_LegPouch";
        };
        case CLASS_TF : {
            _vest = "CUP_V_B_MTV_TL";
        };
        case CLASS_OPL : {
            _vest = "CUP_V_B_MTV_PistolBlack";
        };
        case CLASS_FUNKER : {
            _vest = "CUP_V_B_MTV_Patrol";
        };
        case CLASS_LOGISTIC : {
            _vest = "CUP_V_B_MTV_Patrol";
        };
        case CLASS_AT : {
            _vest = "CUP_V_B_MTV_noCB";
        };
    };
    [_unit, _vest, 1] call Spec_fnc_addContainer;
    if(_type in [CLASS_OPL, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_PILOT]) then {
        [_unit, _backpackLR] call Spec_fnc_addContainer;
        if(backpack _unit == "") then {
            [_unit, _backpack] call Spec_fnc_addContainer;
        } else {
            clearItemCargoGlobal (unitBackpack _unit);
            clearMagazineCargoGlobal (unitBackpack _unit);
        };
    } else {
        if(_type in [CLASS_MEDEVAC, CLASS_PIO, CLASS_LMG]) then {
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
        [_unit,_mgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        [_unit,_mgAmmo,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        [_unit,_mgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type == CLASS_LMG) then {
            [_unit,_lmgAmmo,ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            _unit addWeapon _lmgWeapon;
            [_unit,_lmgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _lmgAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _lmgAccessoryExtra;
        } else {
            comment "Grenade launcher";
            if(_type in [CLASS_TF, CLASS_GL, CLASS_FUNKER]) then {
                [_unit,_grenadeLauncherAmmo,ADD_ANYWHERE, 6] call Spec_fnc_addItemToContainer;

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
    [_unit,_secondaryAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
    _unit addWeapon _secondaryWeapon;
    {
        _unit addSecondaryWeaponItem _x;
    } forEach _secondaryAccessory;
};
true
