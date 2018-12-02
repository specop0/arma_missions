/*
    Author: SpecOp0

    Description:
    Parses the unit and type of given parameters which can be used to assign a loadout to a given unit.
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
    0: OBJECT - the unit to assign loadout to
    1: STRING - classname which represents loadout type (default: classname of unit)
*/
#include "const.hpp"

waitUntil {!isNull player || isServer};
private _unit = objNull;
private _type = "";
private _returnValue = [];
// test if addAction was used (caller _this select 3 is present)
if (_this isEqualType [] && {count _this > 3}) then {
    params [ "", ["_caller", objNull,[objNull]] ];
    _unit = _caller;
    _type = missionNamespace getVariable [SPEC_LOADOUT_VAR_CLASS, typeOf _unit];
    // test if addAction arguments were used
    if (count _this > 3 && {(_this select 3) isEqualTypeAny ["",[]]}) then {
        private _addActionParameterCorrect = (_this select 3) params [ ["_typeAddActionArg","",["STRING"]] ];
        if (_addActionParameterCorrect) then {
            _type = _typeAddActionArg;
        };
    };
} else {
    // normal call
    params [["_unitArg",objNull,[objNull]]];
    _unit = _unitArg;
    _type = missionNamespace getVariable [SPEC_LOADOUT_VAR_CLASS, typeOf _unit];
    // test if type argument present (_this select 1)
    if (_this isEqualType [] && {count _this > 1}) then {
        private _typeParameterCorrect = params ["", ["_typeArg","",[""]] ];
        if (_typeArg != "") then {
            _type = _typeArg;
        };
    };
};
// if the result is valid construct the correct return value
if (!(isNull _unit)) then {
    if (_unit == player && !(_type isEqualTo "")) then {
        // save new default type
        missionNamespace setVariable [SPEC_LOADOUT_VAR_CLASS, _type];
    };
    _returnValue = [_unit, _type];
};
_returnValue
