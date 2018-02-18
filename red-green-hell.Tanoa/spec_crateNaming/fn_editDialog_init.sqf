/*
    Author: SpecOp0

    Description:
    Initializes the dialog to edit the display name of the crate.
    Fills the text box with the existing display name or the default one.

    Parameter(s):
    0 - BOOL: True if the text box is filled with the default display name; false otherwise (default: false)

    Return Value:
    None

    Example:
    [true] call Spec_crateNaming_fnc_editDialog_init;
*/
#include "const.hpp"
#include "script_component.hpp"

params [ ["_loadDefault", false, [true]] ];

disableSerialization;

private _crate = missionNamespace getVariable [SPEC_CRATENAMING_CRATE_VAR, objNull];
if (isNull _crate) exitWith {
    hint "Error: No Crate found.";
    [false] call Spec_crateNaming_fnc_editDialog_close;
};

// get display name defined by user or default one
private _userDisplayName = _crate getVariable [QGVAR(displayName), ""];
if (_userDisplayName isEqualTo "" || _loadDefault) then {
    _userDisplayName = getText (configfile >> "CfgVehicles" >> (typeOf _crate) >> "displayName");
};

// copy display name to text box
private _scriptHandle = [_userDisplayName] spawn {
    params ["_userDisplayName"];
    waitUntil { !isNull findDisplay IDC_SPEC_CRATENAMING_DIALOGID };
    ctrlSetText [IDC_SPEC_CRATENAMING_EDITBOX, _userDisplayName];
};