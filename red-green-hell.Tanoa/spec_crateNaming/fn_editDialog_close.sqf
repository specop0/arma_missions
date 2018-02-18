/*
    Author: SpecOp0

    Description:
    Closes the dialog to edit the display name of the crate.

    Parameter(s):
    0 - BOOL: True if the dialog was successfull; false otherwise (default: true)

    Return Value:
    None

    Example:
    [] call Spec_crateNaming_fnc_editDialog_close;
*/
#include "const.hpp"

params [ ["_success",true,[true]] ];

missionNamespace setVariable [SPEC_CRATENAMING_CRATE_VAR, objNull];
private _dialogResult = if (_success) then { IDC_OK } else { IDC_CANCEL };
closeDialog _dialogResult;