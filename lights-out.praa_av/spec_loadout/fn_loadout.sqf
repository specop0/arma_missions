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

private _uniform = "CUP_U_O_TK_Green";
private _vest = "CUP_V_O_TK_Vest_1";

private _backpack = "B_AssaultPack_rgr";
private _backpackBig = "B_Carryall_oli";
private _backpackLR = "tf_rt1523g_rhs";//"tf_bussole";

private _headgear = "CUP_H_TK_Helmet";
private _headgearPilot = "CUP_H_TK_PilotHelmet";
private _googles = "";

private _standardWeapon = "rhs_weap_akms";
private _standardAmmo = "rhs_30Rnd_762x39mm_tracer";
private _standardAccessory = ["rhs_acc_2dpZenit"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "rhs_weap_makarov_pmm";
private _secondaryAmmo = "rhs_mag_9x18_12_57N181S";
private _secondaryAccessory = [];

comment "Officer";
private _oplClass = "B_officer_F"; 
comment "Squad Leader";
private _funkerClass = "B_Soldier_SL_F";
comment "Combat Life Saver";
private _medicClass = "B_medic_F";

comment "Team Leader";
private _tfClass = "B_Soldier_TL_F";
comment "Grenadier"; // no GL - chemlights instead
private _glClass = "B_Soldier_GL_F";

comment "Autorifleman";
private _mgClass = "B_soldier_AR_F";
private _mgWeapon = "rhs_weap_pkm";
private _mgAmmo = "rhs_100Rnd_762x54mmR_green";
private _mgAccessory = [];
private _mgAccessoryExtra = [];
comment "Ammo Bearer";
private _mgAssiClass = "B_Soldier_A_F";

comment "Rifleman (AT)";
private _atClass = "B_soldier_LAT_F";
private _atWeapon = "rhs_weap_rpg26";

comment "Engineer";
private _pioClass = "B_engineer_F";
comment "Repair Specialist";
private _logisticClass = "B_soldier_repair_F";
comment "Rifleman (Light)";
private _medevacClass = "B_Soldier_lite_F";
comment "Helicopter Pilot";
private _pilotClass = "B_Helipilot_F";

comment "classes to use: B_Soldier_F (Rifleman), B_pilotClass_F (Pilot), B_helicrew_F (Helicopter Crew)";

// NVG classes
private _usLead = "B_G_Soldier_TL_F";
private _usFunk = "B_G_Soldier_SL_F";
private _usPio = "B_G_engineer_F";
private _usMedic = "B_G_medic_F";
private _usAt ="B_G_Soldier_LAT_F";

private _usSpotterUAV = "B_G_Soldier_M_F";
private _usSpotterLead = "B_G_officer_F";
private _usPilot = "B_G_Soldier_GL_F";

private _usUniform = "UK3CB_BAF_U_CrewmanCoveralls_RTR";
private _usVest = "V_PlateCarrier1_blk";

private _usBackpack = "B_AssaultPack_blk";
private _usLongRange = "tf_rt1523g_black";

private _usHeadgear = "BWA3_OpsCore_Camera";
private _usHeadgearPilot = "rhsusf_hgu56p_mask";

private _usStandardWeapon = "rhs_weap_m4_grip";
private _usStandardWeaponGL = "rhs_weap_m4_m320";
private _usStandardAmmo = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
private _usStandardAccessory = ["rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552"];
private _usStandardAccessoryExtra = [];

private _usSecondaryWeapon = "rhsusf_weap_m1911a1";
private _usSecondaryAmmo = "rhsusf_mag_7x45acp_MHP";
private _usSecondaryAccessory = [];

if(_parameterCorrect) then {
    if(_type == "") then {
        _type = typeOf _unit;
    };    
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpackGlobal _unit;
    removeHeadgear _unit;
    removeGoggles _unit;
    
    private _nvgEquipment = false;
    if(_type in [_usLead, _usFunk, _usPio, _usSpotterUAV, _usSpotterLead, _usPilot, _usMedic, _usAt]) then {
        _nvgEquipment = true;
    };
    
    comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
    if(_nvgEquipment) then {
        _unit forceAddUniform _usUniform;
        _unit addVest _usVest;
        if(_type in [_usPilot, _usFunk, _usSpotterLead]) then {
            _unit addBackpackGlobal _usLongRange;
        } else {
            if(_type == _usSpotterUAV) then {
                _unit addBackpackGlobal "B_UAV_01_backpack_F";
                _unit linkItem "B_UavTerminal";
            } else {
                _unit addBackpackGlobal _usBackpack;
            };
        };
        if(_type == _usPilot) then {
            _unit addHeadgear _usHeadgearPilot;
        } else {
            _unit addHeadgear _usHeadgear;
            _unit addGoggles "G_Goggles_VR";
        };
        if(_type in [_usSpotterUAV, _usSpotterLead, _usFunk]) then {
            _unit addWeapon "Laserdesignator";
            _unit addMagazine "Laserbatteries";
        } else {
            _unit addWeapon "Rangefinder";
        };
        comment "lead equipment for us";
        if(_type in [_usLead, _usPilot, _usSpotterLead]) then {
            [_unit,"ACE_microDAGR",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_DK10_b",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_CableTie",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
        };
    } else {
        _unit forceAddUniform _uniform;
        _unit addVest _vest;
        if(_type in [_oplClass, _funkerClass, _logisticClass, _pilotClass]) then {
            _unit addBackpack _backpackLR;
        } else {
            if(_type in [_medevacClass, _pioClass]) then {
                _unit addBackpack _backpackBig;
            } else {
                if(_type in [_mgClass, _mgAssiClass, _medicClass]) then {
                    _unit addBackpack _backpack;
                };
            };
        };
        if(_type == _pilotClass) then {
            _unit addHeadgear _headgearPilot;
        } else {
            _unit addHeadgear _headgear;
        };
        
        comment "Loadout based on TTT-Mod (weapons near end of file)";
        if(_type in [_oplClass, _tfClass, _funkerClass]) then {
            _unit addWeapon "ACE_Vector";
        } else {
            if(_type in [_atClass, _mgAssiClass, _glClass]) then{
                _unit addWeapon "ACE_Yardage450";
            } else {
                _unit addWeapon "Binocular";
            };
        };
    };
    
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadio";
    
    comment "lead equipment (tablet, etc)";
    if(_type in [_oplClass, _tfClass, _funkerClass, _logisticClass, _medevacClass, _pilotClass]) then {
        [_unit,"ACE_microDAGR",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
        if(_type in [_medevacClass, _funkerClass, _usFunk, _usSpotterUAV]) then {
            [_unit,"ACE_GD300_b",ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        } else {
            [_unit,"ACE_DK10_b",ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        };
    };
    if(_type in [_oplClass, _tfClass, _logisticClass, _pilotClass]) then {
        //[_unit,"ACE_HelmetCam",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    };
    if(_type in [_oplClass, _tfClass, _funkerClass]) then {
        [_unit,"ACE_CableTie",ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
    };
    
    comment "standard equipment (ear plugs, grenades)";
    [_unit,"ACE_EarPlugs",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_MapTools",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    
    [_unit,"ACE_IR_Strobe_Item",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_HandFlare_Green",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;

    [_unit,"SmokeShell",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;
    [_unit,"SmokeShellGreen",ADD_ANYWHERE, 2] call Spec_fnc_addItemToContainer;
    [_unit,"SmokeShellPurple",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
    
    comment "night equipment";
    [_unit,"ACE_Flashlight_MX991",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
    if(_nvgEquipment) then {
        _unit linkItem "ACE_NVG_Gen1";
    };
    
    [_unit,"ACE_M84",ADD_TO_VEST, 2] call Spec_fnc_addItemToContainer;

    comment "medic equipment";
    switch _type do {
        case _medicClass : {
            [_unit,"ACE_fieldDressing",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_elasticBandage",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_quikclot",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_packingBandage",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_tourniquet",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_salineIV_500",ADD_TO_BACKPACK, 4] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_atropine",ADD_TO_BACKPACK, 5] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_epinephrine",ADD_TO_BACKPACK, 8] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_morphine",ADD_TO_BACKPACK, 8] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_surgicalKit",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ace_medical_medicClass", 1, true];
        };
        case _medevacClass : {
            [_unit,"ACE_fieldDressing",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_elasticBandage",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_quikclot",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_packingBandage",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_tourniquet",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_salineIV",ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_atropine",ADD_TO_BACKPACK, 8] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_epinephrine",ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_morphine",ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_surgicalKit",ADD_TO_BACKPACK, 5] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_personalAidKit",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_personalAidKit",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ace_medical_medicClass", 2, true];
        };
        case _usMedic : {
            [_unit,"ACE_elasticBandage",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_packingBandage",ADD_TO_BACKPACK, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_tourniquet",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_salineIV_500",ADD_TO_BACKPACK, 4] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_epinephrine",ADD_TO_BACKPACK, 4] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_morphine",ADD_TO_BACKPACK, 4] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_surgicalKit",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ace_medical_medicClass", 1, true];
        };
        default {
            [_unit,"ACE_elasticBandage",ADD_TO_VEST, 7] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_packingBandage",ADD_TO_VEST, 5] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_tourniquet",ADD_TO_VEST, 2] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_morphine",ADD_TO_VEST, 1] call Spec_fnc_addItemToContainer;;
        };
    };
    
    comment "role specific special equipment";
    switch _type do {
        case _pioClass : {
            [_unit,"ToolKit",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            [_unit,"DemoCharge_Remote_Mag",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
            [_unit,"SLAMDirectionalMine_Wire_Mag",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_M26_Clacker",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_Clacker",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_DefusalKit",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_IsEngineer", true, true];
            _unit setVariable ["ACE_isEOD", true, true];
        };
        case _logisticClass : {
            [_unit,"ToolKit",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_IsEngineer", true, true];
        };
        case _mgClass : {
            [_unit,"ACE_SpareBarrel",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        };
        case _mgAssiClass : {
            [_unit,_mgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
        };
        case _glClass : {
            [_unit,"ACE_HandFlare_Yellow",ADD_TO_VEST, 4] call Spec_fnc_addItemToContainer;
        };
        case _funkerClass : {
            [_unit,"ACE_HandFlare_Yellow",ADD_TO_BACKPACK, 4] call Spec_fnc_addItemToContainer;
        };
        case _usPio : {
            [_unit,"DemoCharge_Remote_Mag",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_M26_Clacker",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_DefusalKit",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_isEOD", true, true];
        };
        case _usSpotterUAV : {
            [_unit, "ACE_UAVBattery",ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        };
        case _usSpotterLead : {
            [_unit,"ACE_HuntIR_monitor",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_HuntIR_M203",ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
        };
    };
    
    comment "===========================================";
    comment "==============  Weapons  ==================";
    comment "===========================================";
    
    if(_type == _mgClass) then {
        [_unit,_mgAmmo,ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
        _unit addWeapon _mgWeapon;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach _mgAccessory;
        {
            [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
        } forEach _mgAccessoryExtra;
    } else {
        if(_nvgEquipment) then {
            [_unit,_usStandardAmmo,ADD_TO_VEST, 6] call Spec_fnc_addItemToContainer;
            if(_type == _usSpotterLead) then {
                _unit addWeapon _usStandardWeaponGL;
            } else {
                _unit addWeapon _usStandardWeapon;
            };
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _usStandardAccessory;
            {
                [_unit,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _usStandardAccessoryExtra;
            if(_type == _usAt) then {
                _unit addWeapon _atWeapon;
            };
        } else {
            comment "AT launcher";
            if(_type == _atClass) then {
                _unit addWeapon _atWeapon;
            };
            comment "standard weapon";
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
    comment "secondary weapon";
    if(_nvgEquipment) then {
        [_unit,_usSecondaryAmmo,ADD_ANYWHERE, 2] call Spec_fnc_addItemToContainer;
        _unit addWeapon _usSecondaryWeapon;
        {
            _unit addSecondaryWeaponItem _x;
        } forEach _usSecondaryAccessory;
    } else {
        [_unit,_secondaryAmmo,ADD_ANYWHERE, 2] call Spec_fnc_addItemToContainer;
        _unit addWeapon _secondaryWeapon;
        {
            _unit addSecondaryWeaponItem _x;
        } forEach _secondaryAccessory;
    };
    
    [_unit,"ACE_HandFlare_Red",ADD_ANYWHERE,2] call Spec_fnc_addItemToContainer;
    if(_type == _usLead) then {
        [_unit,1,["ACE_SelfActions","Spec_action_changeSideCIV"]] call ace_interact_menu_fnc_removeActionFromObject;
        [_unit,1,["ACE_SelfActions","Spec_action_changeSideBLUE"]] call ace_interact_menu_fnc_removeActionFromObject;
        private _actionCIV = ["Spec_action_changeSideCIV", "Change to Civilian", "", {
            [_this select 0, 1] remoteExec ["Spec_fnc_changeSide", 2];
        }, {!(side (_this select 0) isEqualTo CIVILIAN)}] call ace_interact_menu_fnc_createAction;
        private _actionBLUE = ["Spec_action_changeSideBLUE", "Change to Blufor", "", {
            [_this select 0, 0] remoteExec ["Spec_fnc_changeSide", 2];
        }, {!(side (_this select 0) isEqualTo WEST)}] call ace_interact_menu_fnc_createAction;
        [_unit,1, ["ACE_SelfActions"], _actionCIV] call ace_interact_menu_fnc_addActionToObject;
        [_unit,1, ["ACE_SelfActions"], _actionBLUE] call ace_interact_menu_fnc_addActionToObject;
    };
};
