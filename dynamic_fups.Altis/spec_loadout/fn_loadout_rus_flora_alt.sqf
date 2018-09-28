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

private _uniform = "rhs_uniform_flora_patchless_alt"; //rhs_uniform_mflora_patchless
private _vest = "rhs_6b23_ML_6sh92";

private _backpack = "B_AssaultPack_khk";
private _backpackBig = "B_Carryall_oli";
private _backpackLR = "TFAR_mr3000_rhs";

private _headgear = "rhs_6b26";
_headgear = selectRandom ["rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala"];
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = "G_Combat";

private _standardWeapon = "rhs_weap_ak74m_camo";
_standardWeapon = selectRandom ["rhs_weap_ak74m_camo","rhs_weap_ak74m_2mag_camo"];
private _standardAmmo = "rhs_30Rnd_545x39_AK";
private _standardAccessory = ["rhs_acc_1p78"];
private _standardAccessoryExtra = ["rhs_acc_pkas"];

private _secondaryWeapon = "rhs_weap_pya";
private _secondaryAmmo = "rhs_mag_9x19_17";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "rhs_weap_ak74m_gp25";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;
private _grenadeLauncher40mm = "rhs_VOG25";
private _grenadeLauncherWhiteSmoke = "rhs_GRD40_White";
private _grenadeLauncherRedSmoke = "rhs_GRD40_Red";

comment "Machine Gunner";
private _mgWeapon = "rhs_weap_pkp";
private _mgAmmo = "rhs_100Rnd_762x54mmR_green";
private _mgAccessory = _standardAccessory;
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = _standardWeapon; //RPK only in CUP
private _lmgAmmo = "rhs_45Rnd_545X39_AK";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "rhs_weap_rpg7";
private _atAmmo = ["rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VL_mag"];

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
            _vest = "rhs_6b23_ML_6sh92_vog";
        };
        case CLASS_TF : {
            _vest = "rhs_6b23_ML_6sh92_headset";
        };
        case CLASS_OPL : {
            _vest = "rhs_6b23_ML_6sh92_headset";
        };
        case CLASS_FUNKER : {
            _vest = "rhs_6b23_ML_6sh92_radio";
        };
        case CLASS_MEDIC : {
            _vest = "rhs_6b23_ML_medic";
        };
        case CLASS_MEDEVAC : {
            _vest = "rhs_6b23_ML_medic";
        };
        case CLASS_PIO : {
            _vest = "rhs_6b23_ML_engineer";
        };
        case CLASS_LOGISTIC : {
            _vest = "rhs_6b23_ML_engineer";
        };
    };
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
        [_unit,_mgAmmo,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        [_unit,_mgAmmo,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
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
            [_unit,_lmgAmmo,ADD_TO_BACKPACK, 5] call Spec_fnc_addItemToContainer;
        } else {
            comment "Grenade launcher";
            if(_type in [CLASS_TF, CLASS_GL, CLASS_FUNKER]) then {
                _unit removeMagazines "1Rnd_HE_Grenade_shell";
                _unit removeMagazines "1Rnd_SmokeRed_Grenade_shell";
                _unit removeMagazines "1Rnd_Smoke_Grenade_shell";
                if(_type == CLASS_GL) then {
                    [_unit,_grenadeLauncher40mm,ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
                } else {
                    [_unit,_grenadeLauncherRedSmoke,ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
                    if(_type == CLASS_TF) then {
                        [_unit,_grenadeLauncherWhiteSmoke,ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
                    };
                };
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
                    _secondaryAccessory pushBack "rhs_acc_pgo7v";
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
