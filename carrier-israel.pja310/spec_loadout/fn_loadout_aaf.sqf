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

private _uniform = "MNP_CombatUniform_ISR";
private _vest = selectRandom ["MNP_Vest_ISRKahki_1","MNP_Vest_ISRKahki_2"];

private _backpack = "B_AssaultPack_rgr";
private _backpackBig = "B_Carryall_oli";
private _backpackLR = "TTT_Backpack_Funkerfac_Bw_Flecktarn";

private _headgear = "rhs_6b28_green";
private _goggles = "PBW_RevisionF_klar";

private _standardWeapon = "arifle_TRG21_F";
private _standardAmmo = "30Rnd_556x45_Stanag";
private _standardAccessory = ["CUP_acc_Flashlight_wdl","optic_ERCO_blk_F"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "rhsusf_weap_glock17g4";
private _secondaryAmmo = "rhsusf_mag_17Rnd_9x19_JHP";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "arifle_TRG21_GL_F";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "LMG_Zafir_F";
private _mgAmmo = "150Rnd_762x54_Box_Tracer";
private _mgAccessory = _standardAccessory;
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _crewWeapon = "rhs_weap_m4a1_carryhandle";
private _crewAmmo = "30Rnd_556x45_Stanag";
private _crewAccessory = [];
private _crewAccessoryExtra = [];

comment "Rifleman (AT)";
private _atWeapon = "CUP_launch_NLAW";
private _atAmmo = ["ACE_PreloadedMissileDummy_NLAW_CUP"];

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
    switch (_type) do {
        case CLASS_JET : {
            _uniform = "U_B_PilotCoveralls";
        };
    };
    [_unit, _uniform] call Spec_fnc_addContainer;
    [_unit, _vest] call Spec_fnc_addContainer;
    if(_type in [CLASS_OPL, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_PILOT, CLASS_COMMANDER, CLASS_JET]) then {
        [_unit, _backpackLR] call Spec_fnc_addContainer;
        if(backpack _unit == "") then {
            [_unit, _backpack] call Spec_fnc_addContainer;
        };
        clearItemCargoGlobal (unitBackpack _unit);
        clearMagazineCargoGlobal (unitBackpack _unit);
    } else {
        if(_type in [CLASS_MEDEVAC]) then {
            [_unit, _backpackBig] call Spec_fnc_addContainer;
        } else {
            [_unit, _backpack] call Spec_fnc_addContainer;
        };
    };
    // headgear
    switch (_type) do {
        case CLASS_PILOT : {
            _headgear = "BWA3_Knighthelm";
        };
        case CLASS_COMMANDER : {
            _headgear = "H_HelmetCrew_I";
        };
        case CLASS_CREW : {
            _headgear = "H_HelmetCrew_I";
        };
        case CLASS_JET : {
            _headgear = "H_PilotHelmetFighter_O";
        };
    };
    _unit addHeadgear _headgear;
    _unit addGoggles _goggles;

    comment "===========================================";
    comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
    [_unit, _type] call Spec_fnc_loadoutStandardEquipment;
    comment "===========================================";

    if(_type == CLASS_MG) then {
        [_unit,_mgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        [_unit,_mgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        [_unit,_mgAmmo,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type in [CLASS_COMMANDER, CLASS_CREW, CLASS_PILOT, CLASS_JET]) then {
            [_unit,_crewAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
            _unit addWeapon _crewWeapon;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _crewAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _crewAccessoryExtra;
            [_unit,_crewAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
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
    [_unit,_secondaryAmmo,ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
    _unit addWeapon _secondaryWeapon;
    {
        _unit addSecondaryWeaponItem _x;
    } forEach _secondaryAccessory;
};
true
