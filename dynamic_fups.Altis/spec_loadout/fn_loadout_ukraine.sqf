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

private _uniform = "MNP_CombatUniform_Ukrainian";
private _vest = selectRandom ["MNP_Vest_UKR_A", "MNP_Vest_UKR_B"];

private _backpack = "BWA3_AssaultPack_Fleck";
private _backpackBig = "B_Carryall_ghex_F";
private _backpackLR = "TTT_Backpack_Operator_Radio_BW_Flecktarn";

private _headgear = "MNP_Helmet_PAGST_UKR";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = "G_Combat";

private _standardWeapon = "CUP_arifle_AK74";
private _standardAmmo = "CUP_30Rnd_545x39_AK_M";
private _standardAccessory = ["CUP_optic_PSO_1"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "rhs_weap_makarov_pm";
private _secondaryAmmo = "rhs_mag_9x18_8_57N181S";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "CUP_arifle_AK74_GL";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;
private _grenadeLauncher40mm = "CUP_1Rnd_HE_GP25_M";
private _grenadeLauncherWhiteSmoke = "CUP_1Rnd_SMOKE_GP25_M";
private _grenadeLauncherRedSmoke = "CUP_1Rnd_SmokeRed_GP25_M";

comment "Machine Gunner";
private _mgWeapon = "CUP_lmg_Pecheneg";
private _mgAmmo = "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
private _mgAccessory = ["CUP_optic_PechenegScope"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "CUP_arifle_RPK74";
private _lmgAmmo = "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "CUP_launch_RPG18";
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
            [_unit,_lmgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
            [_unit,_lmgAmmo,ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            _unit addWeapon _lmgWeapon;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _lmgAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _lmgAccessoryExtra;
            [_unit,_lmgAmmo,ADD_ANYWHERE, 2] call Spec_fnc_addItemToContainer;
        } else {
            comment "Grenade launcher";
            if(_type in [CLASS_TF, CLASS_GL, CLASS_FUNKER]) then {
                [_unit,_grenadeLauncherAmmo,ADD_TO_VEST, 6] call Spec_fnc_addItemToContainer;
                // change ugl launcher ammo
                _unit removeMagazines "1Rnd_HE_Grenade_shell";
                _unit removeMagazines "1Rnd_SmokeRed_Grenade_shell";
                _unit removeMagazines "1Rnd_Smoke_Grenade_shell";
                switch _type do {
                    case CLASS_TF : {
                        
                        [_unit,_grenadeLauncherWhiteSmoke,ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
                        [_unit,_grenadeLauncherRedSmoke,ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
                    };
                    case CLASS_GL : {
                        [_unit,_grenadeLauncher40mm,ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
                    };
                    case CLASS_FUNKER : {
                        [_unit,_grenadeLauncherRedSmoke,ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
                    };
                };

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
