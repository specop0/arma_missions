/*
    Author: SpecOp0
    
    Description:
    Adds ACE Actions to take (intel) item.
    
    See const.hpp for name of action.
    
    Parameter(s):
    0: OBJECT - intel item
    
    Returns:
    true
*/
#include "const.hpp"

private _parameterCorrect = params [ ["_item",objNull,[objNull]] ];

if(_parameterCorrect && hasInterface) then {
    removeAllActions _item;
    private _actionTakeIntel =
    [
        SPEC_ACTION_TAKE_INTEL_ID,
        SPEC_ACTION_TAKE_INTEL_NAME,
        "",
        {
            params ["_target","_caller"];
            deleteVehicle _target;
        },
        {true}
    ] call ace_interact_menu_fnc_createAction;
    [_item,0,["ACE_MainActions"], _actionTakeIntel] call ace_interact_menu_fnc_addActionToObject;
};
true