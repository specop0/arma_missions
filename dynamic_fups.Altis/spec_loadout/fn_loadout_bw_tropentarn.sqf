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

private _uniform = "BWA3_Uniform_Tropen";
private _vest = "BWA3_Vest_Rifleman_Tropen";

private _backpack = "BWA3_TacticalPack_Tropen";
private _backpackBig = "BWA3_Carryall_Tropen";
private _backpackLR = "TFAR_rt1523g_big_bwmod_tropen";

private _headgear = "BWA3_M92_Tropen";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _goggles = selectRandom ["BWA3_G_Combat_Black","BWA3_G_Combat_Clear","BWA3_G_Combat_Orange"];

private _standardWeapon = "hlc_rifle_G36KE1";
private _standardAmmo = "hlc_30rnd_556x45_EPR_G36";
private _standardAccessory = ["HLC_Optic_G36dualoptic35x"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "BWA3_P8";
private _secondaryAmmo = "BWA3_15Rnd_9x19_P8";
private _secondaryAccessory = [];

comment "Weapon with Underslung Grenade Launcher";
private _grenadeLauncherWeapon = "hlc_rifle_G36E1AG36";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

comment "Machine Gunner";
private _mgWeapon = "BWA3_MG5";
private _mgAmmo = "BWA3_120Rnd_762x51_Tracer";
private _mgAccessory = ["BWA3_optic_EOTech_Mag_Off"];
private _mgAccessoryExtra = _standardAccessoryExtra;

comment "Light Machine Gunner";
private _lmgWeapon = "hlc_rifle_MG36";
private _lmgAmmo = "hlc_100rnd_556x45_EPR_G36";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atWeapon = "BWA3_PzF3_Tandem_Loaded";
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
        case CLASS_MG : {
            _vest = "BWA3_Vest_MachineGunner_Tropen";
        };
        case CLASS_LMG : {
            _vest = "BWA3_Vest_MachineGunner_Tropen";
        };
        case CLASS_GL : {
            _vest = "BWA3_Vest_Grenadier_Tropen";
        };
        case CLASS_MEDIC : {
            _vest = "BWA3_Vest_Medic_Tropen";
        };
        case CLASS_MEDEVAC : {
            _vest = "BWA3_Vest_Medic_Tropen";
        };
        case CLASS_TF : {
            _vest = "BWA3_Vest_Leader_Tropen";
        };
        case CLASS_FUNKER : {
            _vest = "BWA3_Vest_Leader_Tropen";
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
            if(_type == CLASS_MEDIC) then {
                _backpack = "BWA3_TacticalPack_Tropen_Medic";
            };
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
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        [_unit,_mgAmmo,ADD_ANYWHERE_REVERSE, 2] call Spec_fnc_addItemToContainer;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_type == CLASS_LMG) then {
            [_unit,_lmgAmmo,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
            _unit addWeapon _lmgWeapon;
            [_unit,_lmgAmmo,ADD_ANYWHERE_REVERSE, 4] call Spec_fnc_addItemToContainer;
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _lmgAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _lmgAccessoryExtra;
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
                    // remove backpack to avoid clipping with backpack
                    private _backpackItems = backpackItems _unit;
                    removeBackpack _unit;
                    {
                        [_unit,_x,ADD_ANYWHERE_REVERSE] call Spec_fnc_addItemToContainer;
                    } forEach _backpackItems;
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
