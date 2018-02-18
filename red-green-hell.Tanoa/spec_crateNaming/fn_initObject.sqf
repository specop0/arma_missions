/*
 * Author: Glowbal, SilentSpike, SpecOp0
 * Initializes variables for loadable objects. Called from init EH.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_cargo_fnc_initObject
 *
 * Public: No
 */
#include "const.hpp"
#include "script_component.hpp"

params ["_object"];
private _type = typeOf _object;

// If object had size given to it via eden/public then override config canLoad setting
private _canLoadPublic = _object getVariable [QGVAR(canLoad), false];
private _canLoadConfig = getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(canLoad)) == 1;

// Nothing to do here if object can't be loaded
if !(_canLoadConfig || {_canLoadPublic in [true, 1]}) exitWith {};

// Servers and HCs do not require action menus (beyond this point)
if !(hasInterface) exitWith {};

// Add action to let user rename the cargo container
private _actionRename = ["spec_crateNaming_rename", localize "STR_Spec_crateNaming_Rename", "", {
    params ["_target", "_caller"];
    missionNamespace setVariable [SPEC_CRATENAMING_CRATE_VAR, _target];
    createDialog "spec_crateNaming_EditDialog";
}, {true}] call ace_interact_menu_fnc_createAction;
[_object,0, ["ACE_MainActions", "spec_crateNaming_rename"]] call ace_interact_menu_fnc_removeActionFromObject;
[_object,0, ["ACE_MainActions"], _actionRename] call ace_interact_menu_fnc_addActionToObject;