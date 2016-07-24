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
#include "classVariables.hpp"
#include "addItemToContainer.hpp"

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

private _isGerman = (side _unit == BLUFOR);

private ["_uniform","_vest","_headgear","_backpack",
    "_standardWeapon","_standardAmmo",
    "_automaticWeapon","_automaticAmmo",
    "_mgWeapon","_mgAmmo"];
    
if(_isGerman) then {
    _uniform = "MNP_CombatUniform_OD_Rg";
    _vest = "V_BandollierB_rgr";
    _headgear = "CUP_H_RUS_6B27_olive";
    
    _standardWeapon = "rhs_weap_kar98k";
    _standardAmmo = "rhsgref_5Rnd_792x57_kar98k";
    _automaticWeapon = "CUP_arifle_Sa58RIS1";
    _automaticAmmo = "CUP_30Rnd_Sa58_M";
} else {
    _uniform = "rhs_uniform_m88_patchless";
    _vest = "V_BandollierB_cbr";
    _headgear = "CUP_H_RUS_6B27";
    
    _standardWeapon = "rhs_weap_m38";
    _standardAmmo = "rhsgref_5Rnd_762x54_m38";
    _automaticWeapon = "rhs_weap_aks74u";
    _automaticAmmo = "rhs_30Rnd_545x39_AK";
};

_backpack = "rhs_sidor";
_mgWeapon = "CUP_lmg_UK59";
_mgAmmo = "CUP_50Rnd_UK59_762x54R_Tracer";

if(_parameterCorrect) then {
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpackGlobal _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
    _unit forceAddUniform _uniform;
    _unit addVest _vest;
    if(_type in [CLASS_AMMO]) then {
        _unit addBackpackGlobal _backpack;
    };
    _unit addHeadgear _headgear;

    comment "===========================================";
    comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
    if(_type in [CLASS_TF_GER, CLASS_TF_RUS, CLASS_PILOT]) then {
        _unit linkItem "ItemMap";
        _unit linkItem "ItemCompass";
        [_unit,"ACE_MapTools",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
        _unit addWeapon "Binocular";
        _unit addWeapon "rhs_weap_rsp30_white";
    };
    _unit linkItem "ItemWatch";
    
    [_unit,"SmokeShell",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    
    if(_type in [CLASS_MEDIC_GER,CLASS_MEDIC_RUS]) then {
        [_unit,"ACE_fieldDressing",ADD_TO_UNIFORM,13]  call Spec_fnc_addItemToContainer;
        [_unit,"ACE_bloodIV_250",ADD_TO_UNIFORM, 7]  call Spec_fnc_addItemToContainer;
        [_unit,"ACE_morphine",ADD_TO_UNIFORM, 5] call Spec_fnc_addItemToContainer;
        _unit setVariable ["ace_medical_medicClass",2,true];
    } else {
        [_unit,"ACE_fieldDressing",ADD_TO_UNIFORM,3]  call Spec_fnc_addItemToContainer;
    };
    comment "===========================================";

    if(_type in [CLASS_LIGHT_GER,CLASS_LIGHT_RUS]) then {
        [_unit,_automaticAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        _unit addWeapon _automaticWeapon;
        [_unit,_automaticAmmo,ADD_ANYWHERE, 5] call Spec_fnc_addItemToContainer;
    } else {
        if(_type == CLASS_MG) then {
            [_unit,_mgAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
            _unit addWeapon _mgWeapon;
            [_unit,_mgAmmo,ADD_ANYWHERE, 2] call Spec_fnc_addItemToContainer;
        } else {
            if(_type == CLASS_AMMO) then {
                [_unit,_mgAmmo,ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            };
            [_unit,_standardAmmo,ADD_TO_VEST] call Spec_fnc_addItemToContainer;
            _unit addWeapon _standardWeapon;
            [_unit,_standardAmmo,ADD_ANYWHERE, 6] call Spec_fnc_addItemToContainer;
        };
    };
    
    if(_type in [CLASS_TF_GER, CLASS_TF_RUS, CLASS_PILOT]) then {
        _unit addWeapon "rhs_weap_rsp30_white";
    };
};
true
