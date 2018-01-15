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

private _uniform = "CUP_I_B_PMC_Unit_28";
private _vest = "CUP_V_PMC_CIRAS_Winter_Empty";

private _backpack = "MNP_B_WB_KB";
private _backpackBig = "MNP_B_RUW_CA";
private _backpackLR = "UK3CB_BAF_B_Bergen_Arctic_JTAC_A";

private _headgear = "UK3CB_BAF_H_Mk7_Win_ESS_A";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = selectRandom ["rhsusf_shemagh2_white", "rhsusf_shemagh_white", "rhsusf_shemagh_gogg_white", "rhsusf_shemagh2_gogg_white"];
// no double goggles
if(_goggles in ["rhsusf_shemagh_gogg_white", "rhsusf_shemagh2_gogg_white"]) then {
    _headgear = "UK3CB_BAF_H_Mk7_Win_A";
};

private _standardWeapon = "rhs_weap_ak74m";
private _standardAmmo = "rhs_30Rnd_545x39_AK";
private _standardAccessory = ["hlc_optic_kobra"];
private _standardAccessoryExtra = ["rhs_acc_1p78"];

private _secondaryWeapon = "rhs_weap_pya";
private _secondaryAmmo = "rhs_mag_9x19_17";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "rhs_weap_ak74m_gp25";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "rhs_weap_pkp";
private _mgAmmo = "rhs_100Rnd_762x54mmR";
private _mgAccessory = _standardAccessory;
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "CUP_arifle_RPK74M";
private _lmgAmmo = "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "rhs_weap_rpg7";
private _atAmmo = ["rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VL_mag"];

private _aaWeapon = "rhs_weap_igla";
private _aaAmmo = ["rhs_mag_9k38_rocket"];

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
    _unit forceAddUniform _uniform;
    switch (_type) do {
        case CLASS_GL : {
            _vest = "CUP_V_PMC_CIRAS_Winter_Grenadier";
        };
        case CLASS_TF : {
            _vest = "CUP_V_PMC_CIRAS_Winter_TL";
        };
        case CLASS_OPL : {
            _vest = "CUP_V_PMC_CIRAS_Winter_TL";
        };
        case CLASS_FUNKER : {
            _vest = "CUP_V_PMC_CIRAS_Winter_Patrol";
        };
        case CLASS_MEDIC : {
            _vest = "CUP_V_PMC_CIRAS_Winter_Patrol";
        };
        case CLASS_MEDEVAC : {
            _vest = "CUP_V_PMC_CIRAS_Winter_Patrol";
        };
        case CLASS_PIO : {
            _vest = "CUP_V_PMC_CIRAS_Winter_Veh";
        };
        case CLASS_LOGISTIC : {
            _vest = "CUP_V_PMC_CIRAS_Winter_Veh";
        };
    };
    _unit addVest _vest;
    if(_type in [CLASS_OPL, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_PILOT]) then {
        [_unit, _backpackLR] call Spec_fnc_addContainer;
        if(backpack _unit == "") then {
            [_unit, _backpack] call Spec_fnc_addContainer;
        };
    } else {
        if(_type in [CLASS_MEDEVAC, CLASS_PIO, CLASS_MG_ASSI]) then {
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
        [_unit,_mgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
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
            [_unit,_lmgAmmo,ADD_TO_BACKPACK, 4] call Spec_fnc_addItemToContainer;
        } else {
            comment "Grenade launcher";
            if(_type in [CLASS_TF, CLASS_GL, CLASS_FUNKER]) then {
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
                if(_type == CLASS_AA) then {
                    {
                        [_unit,_x,ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
                    } forEach _aaAmmo;
                    _unit addWeapon _aaWeapon;
                };
                comment "MG Ammunition for MG Assistant";
                if(_type == CLASS_MG_ASSI) then {
                    [_unit,_mgAmmo,ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
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
