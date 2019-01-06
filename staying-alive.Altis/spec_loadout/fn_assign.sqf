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

private _parameterCorrect = (_this call Spec_loadout_fnc_parseUnitAndType) params [ ["_unit",objNull,[objNull]], ["_type","",[""]] ];

private _uniform = "CUP_U_B_BAF_DDPM_UBACSTSHIRTKNEE";
private _vest = "V_PlateCarrier2_rgr_noflag_F";

private _backpack = "B_Kitbag_tan";
private _backpackBig = "CUP_B_USPack_Coyote";
private _backpackLR = "TFAR_anprc155_coyote";

private _headgear = "CUP_H_BAF_DDPM_Mk6_EMPTY_PRR";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = "";

private _standardWeapon = "CUP_arifle_Mk16_CQC_FG_black";
private _standardAmmo = "30Rnd_556x45_Stanag";
private _standardAccessory = ["CUP_optic_HoloBlack"];
private _standardAccessoryExtra = ["optic_MRCO"];

private _secondaryWeapon = "CUP_hgun_M9";
private _secondaryAmmo = "CUP_15Rnd_9x19_M9";
private _secondaryAccessory = [];

// Weapon with Underslung Grenade Launcher
private _grenadeLauncherWeapon = "CUP_arifle_Mk16_CQC_EGLM_black";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

// Light Machine Gunner
private _lmgWeapon = "arifle_CTARS_blk_F";
private _lmgAmmo = "100Rnd_580x42_Mag_F";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

// Launcher
private _atSimple = "CUP_launch_M136";
private _atWeapon = "launch_B_Titan_short_F";
private _atAmmo = "Titan_AT";
private _aaWeapon = "launch_B_Titan_F";
private _aaAmmo = "Titan_AA";

if (_parameterCorrect) then {
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    // Vest, Uniform, Backpack, Headgear , Googgles
    _unit forceAddUniform _uniform;
    [_unit, _vest] call Spec_loadout_fnc_addContainer;
    if (_type in [CLASS_OPL, CLASS_DRIVER, CLASS_PILOT, CLASS_LOGISTIC]) then {
        [_unit, _backpackLR] call Spec_loadout_fnc_addContainer;
        if (backpack _unit isEqualTo "") then {
            [_unit, _backpack] call Spec_loadout_fnc_addContainer;
        };
    } else {
        if (_type in [CLASS_MEDEVAC, CLASS_EOD, CLASS_AA_ASSI, CLASS_AT_ASSI]) then {
            [_unit, _backpackBig] call Spec_loadout_fnc_addContainer;
        } else {
            [_unit, _backpack] call Spec_loadout_fnc_addContainer;
        };
    };
    if (_type isEqualTo CLASS_PILOT) then {
        _unit addHeadgear _headgearPilot;
    } else {
        _unit addHeadgear _headgear;
    };
    _unit addGoggles _goggles;

    // ===========================================
    // standard equipment (Map, Grenades, Medic Stuff, Explosives)";
    [_unit, _type] call Spec_loadout_fnc_standardEquipment;
    // ===========================================

    // AT & AA launcher
    if (_type isEqualTo CLASS_FTL) then {
        _unit addWeapon _atSimple;
    };
    if (_type isEqualTo CLASS_AT) then {
        [_unit,_atAmmo,ADD_TO_BACKPACK] call Spec_loadout_fnc_addItemToContainer;
        _unit addWeapon _atWeapon;
    };
    if (_type isEqualTo CLASS_AT_ASSI) then {
        [_unit,_atAmmo,ADD_TO_BACKPACK, 2] call Spec_loadout_fnc_addItemToContainer;
    };
    if (_type isEqualTo CLASS_AA) then {
        [_unit,_aaAmmo,ADD_TO_BACKPACK] call Spec_loadout_fnc_addItemToContainer;
        _unit addWeapon _aaWeapon;
    };
    if (_type isEqualTo CLASS_AA_ASSI) then {
        [_unit,_aaAmmo,ADD_TO_BACKPACK, 2] call Spec_loadout_fnc_addItemToContainer;
    };

    // Primary Weapon
    if (_type isEqualTo CLASS_LMG) then {
        [_unit,_lmgAmmo,ADD_TO_VEST] call Spec_loadout_fnc_addItemToContainer;
        _unit addWeapon _lmgWeapon;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _lmgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_loadout_fnc_addItemToContainer;
        } forEach _lmgAccessoryExtra;
        [_unit,_lmgAmmo,ADD_ANYWHERE_REVERSE, 5] call Spec_loadout_fnc_addItemToContainer;
    } else {
        // Grenade launcher
        if (_type in [CLASS_SQL, CLASS_GL]) then {
            [_unit,_grenadeLauncherAmmo,ADD_TO_VEST, 6] call Spec_loadout_fnc_addItemToContainer;
            _unit addWeapon _grenadeLauncherWeapon;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _grenadeLauncherAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_loadout_fnc_addItemToContainer;
            } forEach _grenadeLauncherAccessoryExtra;
        } else {
            // Standard Weapon
            [_unit,_standardAmmo,ADD_ANYWHERE_REVERSE, 6] call Spec_loadout_fnc_addItemToContainer;
            _unit addWeapon _standardWeapon;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _standardAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_loadout_fnc_addItemToContainer;
            } forEach _standardAccessoryExtra;
        };
    };

    // Secondary Weapon
    [_unit,_secondaryAmmo,ADD_TO_VEST, 3] call Spec_loadout_fnc_addItemToContainer;
    _unit addWeapon _secondaryWeapon;
    {
        _unit addSecondaryWeaponItem _x;
    } forEach _secondaryAccessory;

    // weapon safety on
    [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;
};
true
