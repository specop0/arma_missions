/*
	Author: SpecOp0

	Description:
	Assigns the standard equipment to a given unit.
	For example map, radio, grenades and medic stuff.
    Furthermore role specific stuff like explosives or 40mm HE grenades.

	Can be used as an addAction entry as well.

	Parameter(s):
	0: OBJECT - unit to assign loadout to
	1: STRING - classname which represents loadout type

	Returns:
	true
*/
#include "addItemToContainer.hpp"
#include "classVariables.hpp"

private _parameterCorrect = params [ ["_unit",objNull,[objNull]], ["_type","",[""]] ];

if(_parameterCorrect) then {
    comment "Loadout based on TTT-Mod (weapons near end of file)";
    if(_type == CLASS_PIO) then {
        comment "MineDetector has to be equipped BEFORE any ACE Item to be functional";
        [_unit, "MineDetector",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
    };

    if(_type in [CLASS_OPL, CLASS_TF]) then {
        _unit addWeapon "ACE_Vector";
    } else {
        if(_type in [CLASS_AT, CLASS_MG_ASSI, CLASS_GL]) then{
            _unit addWeapon "ACE_Yardage450";
        } else {
			if(_type == CLASS_FUNKER) then {
				_unit addWeapon "Laserdesignator";
				[_unit,"Laserbatteries",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			} else {
				_unit addWeapon "Binocular";
			};
        };
    };

    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadio"; //tf_anprc152

    comment "lead equipment (tablet, etc)";
    if(_type in [CLASS_OPL, CLASS_TF, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_MEDEVAC, CLASS_PILOT]) then {
        [_unit,"ACE_microDAGR",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
        if(_type in [CLASS_MEDEVAC, CLASS_FUNKER]) then {
            [_unit,"ACE_GD300_b",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        } else {
            [_unit,"ACE_DK10_b",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        };
    };
    if(_type in [CLASS_OPL, CLASS_TF, CLASS_LOGISTIC, CLASS_PILOT]) then {
        //[_unit,"ACE_HelmetCam",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    };
    if(_type in [CLASS_OPL, CLASS_TF, CLASS_FUNKER]) then {
        [_unit,"ACE_CableTie",ADD_TO_VEST, 3] call Spec_fnc_addItemToContainer;
    };

    comment "standard equipment (ear plugs, grenades)";
    [_unit,"ACE_EarPlugs",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_MapTools",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;

    [_unit,"ACE_IR_Strobe_Item",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_HandFlare_Green",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;

    [_unit,"SmokeShell",ADD_TO_UNIFORM,2] call Spec_fnc_addItemToContainer;
    [_unit,"SmokeShellGreen",ADD_TO_UNIFORM, 2] call Spec_fnc_addItemToContainer;
    [_unit,"SmokeShellPurple",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;

    comment "night equipment";
    [_unit,"ACE_Flashlight_MX991",ADD_TO_UNIFORM] call Spec_fnc_addItemToContainer;
    _unit addWeapon "ACE_NVG_Gen1";

    [_unit,"ACE_M84",ADD_TO_VEST, 2] call Spec_fnc_addItemToContainer;

    comment "medic equipment";
    switch _type do {
        case CLASS_MEDIC : {
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
			_unit setVariable ["ace_medical_medicClass", 1];
        };
        case CLASS_MEDEVAC : {
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
			[_unit,"ACE_personalAidKit",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ace_medical_medicClass", 2];
        };
        default {
			[_unit,"ACE_elasticBandage",ADD_TO_BACKPACK, 7] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_packingBandage",ADD_TO_BACKPACK, 5] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_tourniquet",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_morphine",ADD_TO_BACKPACK, 1] call Spec_fnc_addItemToContainer;
        };
    };

    comment "role specific special equipment";
    switch _type do {
        case CLASS_TF : {
            [_unit,"1Rnd_Smoke_Grenade_shell",ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
            [_unit,"1Rnd_SmokeRed_Grenade_shell",ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
        };
        case CLASS_GL : {
            [_unit,"1Rnd_HE_Grenade_shell",ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
        };
		case CLASS_FUNKER : {
			[_unit,"1Rnd_SmokeRed_Grenade_shell",ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
		};
        case CLASS_PIO : {
            [_unit,"ToolKit",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            [_unit,"DemoCharge_Remote_Mag",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
            [_unit,"SLAMDirectionalMine_Wire_Mag",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_M26_Clacker",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_Clacker",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_DefusalKit",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_IsEngineer", true];
			_unit setVariable ["ACE_isEOD", true];
        };
        case CLASS_LOGISTIC : {
            [_unit,"ToolKit",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_IsEngineer", true];
        };
        case CLASS_MG : {
            [_unit,"ACE_SpareBarrel",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        };
    };
};
true
