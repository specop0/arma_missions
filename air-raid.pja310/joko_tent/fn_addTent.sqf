/*
 * Author: joko // Jonas (, SpecOp0)
 */
#include "const.hpp"

params ["_vehicle"];

private _action = [JK_VAR_TENT_OF_VEHICLE_BUILT, JK_BUILD_NAME, "",
    JK_fnc_buildTentProgressBar,
    JK_fnc_canBuildTent
] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
