/*
    Author: SpecOp0

    Description:
    Saves the user input of the dialog to edit the display name of the crate.
    Will change the display name of the crate and close the dialog.

    Parameter(s):
    -

    Return Value:
    None

    Example:
    [] call Spec_crateNaming_fnc_editDialog_save;
*/
#include "const.hpp"
#include "script_component.hpp"

disableSerialization;

private _crate = missionNamespace getVariable [SPEC_CRATENAMING_CRATE_VAR, objNull];
if (isNull _crate) exitWith {
    hint "Error: No Crate found.";
    [false] call Spec_crateNaming_fnc_editDialog_close;
};

// get display name defined by user or default one
private _userDisplayName = ctrlText IDC_SPEC_CRATENAMING_EDITBOX;
private _defaultDisplayName = getText (configfile >> "CfgVehicles" >> typeOf _crate >> "displayName");
if (_userDisplayName isEqualTo _defaultDisplayName) then {
    _userDisplayName = "";
};

// save the display name
_crate setVariable [QGVAR(displayName), _userDisplayName, true];

// close dialog
[true] call Spec_crateNaming_fnc_editDialog_close;