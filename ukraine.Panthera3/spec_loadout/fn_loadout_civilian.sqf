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

private _uniform = "U_C_Journalist";
private _backpackLR = "tf_anprc155_coyote";

private _goggles = goggles _unit;
private _headgear = selectRandom ["H_Cap_grn_BI", "H_Cap_blk", "H_Cap_blu", "H_Cap_blk_ION", "H_Cap_surfer"];

if(_parameterCorrect && _type in [CLASS_LOGISTIC, CLASS_REPORTER]) then {
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
    if(_type == CLASS_LOGISTIC) then {
        private _workerUniform = selectRandom ["CUP_U_C_Worker_01", "CUP_U_C_Worker_02", "CUP_U_C_Worker_03", "CUP_U_C_Worker_04"];
        _unit forceAddUniform _workerUniform;
        [_unit, "V_HarnessO_brn"] call Spec_fnc_addContainer;
        [_unit, _backpackLR] call Spec_fnc_addContainer;
        clearItemCargoGlobal (unitBackpack _unit);
        clearMagazineCargoGlobal (unitBackpack _unit);
    } else {
        [_unit, _uniform] call Spec_fnc_addContainer;
        [_unit, "V_Press_F"] call Spec_fnc_addContainer;
        [_unit, "CUP_B_AssaultPack_Black"] call Spec_fnc_addContainer;
    };
    
    _unit addHeadgear _headgear;
    _unit addGoggles _goggles;
    
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadio";
    
    if(_type == CLASS_LOGISTIC) then {
        [_unit,"ToolKit",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        _unit setVariable ["ACE_IsEngineer", true];
    } else {
        [_unit,"ACE_Cellphone", ADD_TO_VEST] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_SpraypaintBlack",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_SpraypaintRed",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_SpraypaintGreen",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_wirecutter",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_Banana",ADD_TO_BACKPACK, 3] call Spec_fnc_addItemToContainer;
        [_unit,"ACE_bodyBag",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
        if(!isNull (_unit getVariable ["camera", objNull])) then {
            deleteVehicle (_unit getVariable ["camera", objNull]);
        };
        // camera
        private _camera = "Land_HandyCam_F" createVehicle getPosASL player;
        _camera attachTo [_unit, [0.13,-0.03,0.56], "Pelvis"];
        _camera setDir 180;
        _unit setVariable ["camera", _camera];
        _unit addEventHandler ["GetInMan", {
            params ["_unit"];
            private _camera = _unit getVariable ["camera", objNull];
            _unit setVariable ["cameraHidden", isObjectHidden _camera];
            _camera hideObjectGlobal true;
        }];
        _unit addEventHandler ["GetOutMan", {
            params ["_unit"];
            private _camera = _unit getVariable ["camera", objNull];
            private _isHidden = _unit getVariable ["cameraHidden", false];
            if (!_isHidden) then {
                _camera hideObjectGlobal false;
            };
        }];
        [_unit,1,["ACE_SelfActions","cameraShowHide"]] call ace_interact_menu_fnc_removeActionFromObject;
        private _actionShowHideCamera = ["cameraShowHide", "Zeige / Verstecke Kamera", "", {
            params ["_target","_caller"];
            private _camera = _caller getVariable ["camera", objNull];
            private _isHidden = isObjectHidden _camera;
            _camera hideObjectGlobal (!_isHidden);
            _caller setVariable ["cameraHidden", !_isHidden];
            if(_isHidden) then {
                hint "Kamera läuft.";
            } else {
                hint "Kamera eingepackt.";
            };
        },
        {
            params ["_target", "_caller"];
            _caller == vehicle _caller
        }] call ace_interact_menu_fnc_createAction;
        [_unit,1,["ACE_SelfActions"],_actionShowHideCamera] call ace_interact_menu_fnc_addActionToObject;
    };

};
true
