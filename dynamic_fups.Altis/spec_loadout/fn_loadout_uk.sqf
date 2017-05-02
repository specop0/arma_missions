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

private _uniform = "UK3CB_BAF_U_CombatUniform_MTP";
private _vest = "UK3CB_BAF_V_Osprey_Holster";

private _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_A";

private _headgear = "UK3CB_BAF_H_Mk7_Camo_A";
_headgear = selectRandom ["UK3CB_BAF_H_Mk7_Camo_A","UK3CB_BAF_H_Mk7_Camo_B","UK3CB_BAF_H_Mk7_Camo_C","UK3CB_BAF_H_Mk7_Camo_D","UK3CB_BAF_H_Mk7_Camo_E","UK3CB_BAF_H_Mk7_Camo_F","UK3CB_BAF_H_Mk7_Camo_ESS_A","UK3CB_BAF_H_Mk7_Camo_ESS_B","UK3CB_BAF_H_Mk7_Camo_ESS_C","UK3CB_BAF_H_Mk7_Camo_ESS_D","UK3CB_BAF_H_Mk7_Camo_CESS_A","UK3CB_BAF_H_Mk7_Camo_CESS_B","UK3CB_BAF_H_Mk7_Camo_CESS_C","UK3CB_BAF_H_Mk7_Camo_CESS_D"];
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
    
    switch (_type) do {
        case CLASS_GL : {
            _vest = selectRandom ["UK3CB_BAF_V_Osprey_Grenadier_A","UK3CB_BAF_V_Osprey_Grenadier_B"];
        };
        case CLASS_TF : {
            _vest = selectRandom ["UK3CB_BAF_V_Osprey_SL_A","UK3CB_BAF_V_Osprey_SL_B","UK3CB_BAF_V_Osprey_SL_C","UK3CB_BAF_V_Osprey_SL_D"];
        };
        case CLASS_OPL : {
            _vest = selectRandom ["UK3CB_BAF_V_Osprey_SL_A","UK3CB_BAF_V_Osprey_SL_B","UK3CB_BAF_V_Osprey_SL_C","UK3CB_BAF_V_Osprey_SL_D"];
        };
        case CLASS_FUNKER : {
            _vest = selectRandom ["UK3CB_BAF_V_Osprey_SL_A","UK3CB_BAF_V_Osprey_SL_B","UK3CB_BAF_V_Osprey_SL_C","UK3CB_BAF_V_Osprey_SL_D"];
        };
        case CLASS_MEDIC : {
            _vest = selectRandom ["UK3CB_BAF_V_Osprey_Medic_B","UK3CB_BAF_V_Osprey_Medic_C","UK3CB_BAF_V_Osprey_Medic_D"];
        };
        case CLASS_MEDEVAC : {
            _vest = selectRandom ["UK3CB_BAF_V_Osprey_Medic_B","UK3CB_BAF_V_Osprey_Medic_C","UK3CB_BAF_V_Osprey_Medic_D"];
        };
        case CLASS_MG : {
            _vest = "UK3CB_BAF_V_Osprey_MG_B";
        };
        case CLASS_LMG : {
            _vest = "UK3CB_BAF_V_Osprey_MG_B";
        };
        default {
            _vest = selectRandom ["UK3CB_BAF_V_Osprey_Holster","UK3CB_BAF_V_Osprey_Rifleman_B","UK3CB_BAF_V_Osprey_Rifleman_C","UK3CB_BAF_V_Osprey_Rifleman_D","UK3CB_BAF_V_Osprey_Rifleman_E","UK3CB_BAF_V_Osprey_Rifleman_F"];
        };
    };
    [_unit, _vest] call Spec_fnc_addContainer;
    
    switch (_type) do {
        // long ranges
        case CLASS_FUNKER : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_JTAC_H_A";
        };
        case CLASS_LOGISTIC : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Radio_H_B";
        };
        case CLASS_PILOT : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Radio_L_A";
        };
        case CLASS_OPL : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Radio_L_B";
        };
        // big backpacks
        case CLASS_MEDEVAC : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Medic_H_B";
        };
        case CLASS_PIO : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Sapper_L_A";
        };
        // normal backpacks
        case CLASS_MEDIC : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Medic_L_A";
        };
        case CLASS_MG : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";
        };
        case CLASS_LMG : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";
        };
        case CLASS_MG_ASSI : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A";
        };
        case CLASS_TF : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C";
        };
        case CLASS_GL : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";
        };
        case CLASS_AT : {
            _backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C";
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
        [_unit,_mgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        [_unit,_mgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type == CLASS_LMG) then {
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
