/*
    Author: SpecOp0

    Description:
    Checks if all or any given class names are present.

    Parameter(s):
    0: STRING or STRING[] - class name(s) to check
    1: BOOL (optional) - true if all class names must be present; false if any class name must be present

    Returns:
    BOOL - true if all or any given classname are present (according to second parameter)

    Usage:
    ["CUP_arifle_M16A4_Base"] call Spec_fnc_isClassNamePresent
    ["CUP_arifle_M16A4_Base", true] call Spec_fnc_isClassNamePresent
    ["CUP_arifle_M16A4_Base", false] call Spec_fnc_isClassNamePresent
    Return true if CUP is available.

    [["CUP_arifle_M16A4_Base","rhs_m4a1_grip_acog"], true] call Spec_fnc_isClassNamePresent
    Returns true if CUP and RHS are available.
    [["CUP_arifle_M16A4_Base","rhs_m4a1_grip_acog"], false] call Spec_fnc_isClassNamePresent
    Returns true if CUP or RHS are available.
*/

private _returnValue = false;

params [ ["_classNames",[],[[],""]], ["_checkAll",true,[true]] ];
if (_classNames isEqualType "") then {
    _classNames = [_classNames];
};

if (count _classNames > 0) then {
#define IsClassNamePresent(className) (isClass (configFile >> "CfgWeapons" >> className) || isClass (configFile >> "CfgVehicles" >> className) || isClass (configFile >> "CfgMagazines" >> className))
    if (_checkAll) then {
        _returnValue = { !IsClassNamePresent(_x)} count _classNames == 0;
    } else {
        _returnValue = { IsClassNamePresent(_x) } count _classNames > 0;
    };
};

_returnValue
