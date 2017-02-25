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

private _uniform = "U_B_GEN_Commander_F";
private _vest = "V_TacVest_gen_F";

private _backpack = "B_FieldPack_blk";
private _backpackBig = "B_Carryall_cbr";
private _backpackLR = "tf_rt1523g_black";

private _headgear = "H_MilCap_gen_F";
private _goggles = "G_Tactical_Clear";

private _standardWeapon = "SMG_05_F";
private _standardAmmo = "30Rnd_9x21_Mag_SMG_02";
private _standardAccessory = [];
private _standardAccessoryExtra = ["optic_Holosight_smg_blk_F", "muzzle_snds_L"];

private _shieldWeapon = "CUP_hgun_BallisticShield_Armed";
private _shieldAmmo = "CUP_15Rnd_9x19_M9";
private _shieldSecondary = "BWA3_MP7";
private _shieldSecondaryAmmo = "BWA3_40Rnd_46x30_MP7";

private _secondaryWeapon = "CUP_hgun_M9";
private _secondaryAmmo = "CUP_15Rnd_9x19_M9";
private _secondaryAccessory = [];

if(_parameterCorrect) then {
    private _isMedic = _type in [CLASS_MEDIC,CLASS_MEDEVAC];
    if(side group _unit == CIVILIAN && !_isMedic) exitWith { true };
    
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    if(_isMedic) then {
        _unit forceAddUniform "CUP_U_C_Rescuer_01";
        _unit addBackpack _backpackLR;
        
        _unit linkItem "ItemRadio";
        _unit linkItem "ItemGPS";
        
        [_unit,"ACE_elasticBandage",ADD_TO_UNIFORM, 10] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_quikclot",ADD_ANYWHERE, 10] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_packingBandage",ADD_ANYWHERE, 10] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_tourniquet",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_salineIV_500",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_salineIV",ADD_TO_BACKPACK, 1] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_epinephrine",ADD_TO_BACKPACK, 1] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_morphine",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_surgicalKit",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_personalAidKit",ADD_TO_BACKPACK, 1] call Spec_fnc_addItemToContainer;
        _unit setVariable ["ace_medical_medicClass", 2, true];
    } else {
        [_unit, _uniform] call Spec_fnc_addContainer;
        [_unit, _vest] call Spec_fnc_addContainer;
        
        if(_type in [CLASS_OPL, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_PILOT]) then {
            [_unit, _backpackLR] call Spec_fnc_addContainer;
        };
        if(_type in [CLASS_GL, CLASS_PIO]) then {
            [_unit, _backpack] call Spec_fnc_addContainer;
        };
        
        switch _type do {
            case CLASS_OPL : {
                _headgear = "H_Beret_gen_F";
            };
            case CLASS_MG : {
                _headgear = "TTT_Berets_Logo";
            };
        };
        _unit addHeadgear _headgear;
        _unit addGoggles _goggles;
        
        if(_type in [CLASS_TF, CLASS_OPL, CLASS_FUNKER, CLASS_PILOT]) then {
            _unit linkItem "ItemRadio";
        };

        comment "===========================================";
        comment "standard equipment (Map, Grenades, Medic Stuff, Explosives)";
        
        [_unit,"ACE_M84",ADD_ANYWHERE, 6] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_fieldDressing",ADD_TO_VEST, 9] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_packingBandage",ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_tourniquet",ADD_TO_VEST, 2] call Spec_fnc_addItemToContainer;
        
        [_unit,"ACE_CableTie",ADD_TO_UNIFORM, 2] call Spec_fnc_addItemToContainer;
        
        switch _type do {
            case CLASS_GL : {
                [_unit,"DemoCharge_Remote_Mag",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
                [_unit,"ACE_Clacker",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
                _unit setVariable ["ACE_IsEngineer", true, true];
            };
            case CLASS_PIO : {
                [_unit,"ACE_DefusalKit",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
                [_unit,"ACE_wirecutter",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
                _unit setVariable ["ACE_isEOD", true, true];
            };
            case CLASS_FUNKER : {
                _unit linkItem "ItemGPS";
            };
            case CLASS_TF : {
                _unit linkItem "ItemGPS";
            };
            case CLASS_OPL : {
                _unit linkItem "ItemGPS";
            };
        };
        
        comment "===========================================";

        if(_type == CLASS_PIO) then {
            [_unit,_shieldAmmo, ADD_ANYWHERE, 8] call Spec_fnc_addItemToContainer;
            _unit addWeapon _shieldWeapon;
            
            [_unit,_shieldSecondaryAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
            _unit addWeapon _shieldSecondary;
        } else {
            [_unit,_standardAmmo,ADD_ANYWHERE, 6] call Spec_fnc_addItemToContainer;
            _unit addWeapon _standardWeapon;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _standardAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _standardAccessoryExtra;

            comment "Secondary Weapon";
            [_unit,_secondaryAmmo,ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
            _unit addWeapon _secondaryWeapon;
            {
                _unit addSecondaryWeaponItem _x;
            } forEach _secondaryAccessory;
        };
    };
};
true
