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
#include "classVariables.hpp"

private _parameterCorrect = params [ ["_unit",objNull,[objNull]], ["_type","",[""]] ];

if(_parameterCorrect) then {
    comment "Loadout based on TTT-Mod (weapons near end of file)";
    if(_type == CLASS_PIO) then {
        comment "MineDetector has to be equipped BEFORE any ACE Item to be functional";
        [_unit, "MineDetector", 2] call Spec_fnc_addItemToContainer;
    };
		
    if(_type in [CLASS_OPL, CLASS_TF]) then {
        _unit addWeapon "ACE_Vector";
    } else {
        if(_type in [CLASS_AT, CLASS_MG_ASSI, CLASS_GL]) then{
            _unit addWeapon "ACE_Yardage450";
        } else {
			if(_type == CLASS_FUNKER) then {
				_unit addWeapon "Laserdesignator";
				[_unit,"Laserbatteries",3] call Spec_fnc_addItemToContainer;
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
    if(_type in [CLASS_OPL, CLASS_TF, CLASS_FUNKER, CLASS_LOGISTIC, CLASS_MEDEVAC, CLASS_PILOT]) then {
        [_unit,"ACE_microDAGR",0] call Spec_fnc_addItemToContainer;
        if(_type in [CLASS_MEDEVAC, CLASS_FUNKER]) then {
            [_unit,"ACE_GD300_b",2] call Spec_fnc_addItemToContainer;
        } else {
            [_unit,"ACE_DK10_b",2] call Spec_fnc_addItemToContainer;
        };
    };
    if(_type in [CLASS_OPL, CLASS_TF, CLASS_LOGISTIC, CLASS_PILOT]) then {
        //[_unit,"ACE_HelmetCam",0] call Spec_fnc_addItemToContainer;
    };
    if(_type in [CLASS_OPL, CLASS_TF, CLASS_FUNKER]) then {
        [_unit,"ACE_CableTie",1, 3] call Spec_fnc_addItemToContainer;
    };

    comment "standard equipment (ear plugs, grenades)";
    [_unit,"ACE_EarPlugs",0] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_MapTools",0] call Spec_fnc_addItemToContainer;

    [_unit,"ACE_IR_Strobe_Item",0,2] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_HandFlare_Green",0,2] call Spec_fnc_addItemToContainer;

    [_unit,"SmokeShell",0,2] call Spec_fnc_addItemToContainer;
    [_unit,"SmokeShellGreen",0, 2] call Spec_fnc_addItemToContainer;
    [_unit,"SmokeShellPurple",0] call Spec_fnc_addItemToContainer;

    comment "night equipment";
    [_unit,"ACE_Flashlight_MX991",0] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_NVG_Wide",1] call Spec_fnc_addItemToContainer;

    [_unit,"ACE_M84",1, 2] call Spec_fnc_addItemToContainer;

    comment "medic equipment";
    switch _type do {
        case CLASS_MEDIC : {
            [_unit,"ACE_fieldDressing",2, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_elasticBandage",2, 15] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_quikclot",2, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_packingBandage",2, 10] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_tourniquet",2, 3] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_salineIV_500",2, 4] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_atropine",2, 5] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_epinephrine",2, 8] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_morphine",2, 8] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_surgicalKit",2, 3] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ace_medical_medicClass", 1];
        };
        case CLASS_MEDEVAC : {
			[_unit,"ACE_fieldDressing",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_elasticBandage",2, 15] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_quikclot",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_packingBandage",2, 10] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_tourniquet",2, 2] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_salineIV",2, 6] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_atropine",2, 8] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_epinephrine",2, 12] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_morphine",2, 12] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_surgicalKit",2, 5] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_personalAidKit",2, 3] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ace_medical_medicClass", 2];
        };
        default {
			[_unit,"ACE_elasticBandage",2, 7] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_packingBandage",2, 5] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_tourniquet",2, 2] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_morphine",2, 1] call Spec_fnc_addItemToContainer;
        };
    };

    comment "role specific special equipment";
    switch _type do {
        case CLASS_TF : {
            [_unit,"rhs_GRD40_White",2, 6] call Spec_fnc_addItemToContainer;
            [_unit,"rhs_GRD40_Red",2, 6] call Spec_fnc_addItemToContainer;
        };
        case CLASS_GL : {
            [_unit,"rhs_VOG25",2, 12] call Spec_fnc_addItemToContainer;
        };
		case CLASS_FUNKER : {
			[_unit,"rhs_GRD40_White",2, 6] call Spec_fnc_addItemToContainer;
		};
        case CLASS_PIO : {
            [_unit,"ToolKit",2] call Spec_fnc_addItemToContainer;
            [_unit,"DemoCharge_Remote_Mag",2, 2] call Spec_fnc_addItemToContainer;
            [_unit,"SLAMDirectionalMine_Wire_Mag",2, 2] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_M26_Clacker",3] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_Clacker",3] call Spec_fnc_addItemToContainer;
            [_unit,"ACE_DefusalKit",3] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_IsEngineer", true];
			_unit setVariable ["ACE_isEOD", true];
        };
        case CLASS_LOGISTIC : {
            [_unit,"ToolKit",2] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_IsEngineer", true];
        };
		case CLASS_PILOT : {
			_unit setVariable ["ACE_IsEngineer", 2];
		};
        case CLASS_MG : {
            [_unit,"ACE_SpareBarrel",2] call Spec_fnc_addItemToContainer;
        };
    };
};
true
