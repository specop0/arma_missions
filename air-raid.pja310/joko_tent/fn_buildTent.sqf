/*
 * Author: joko // Jonas (, SpecOp0)
 */
#include "const.hpp"

(_this select 0) params ["_JKvehicle","_JKplayer"];

private _position = (getPos _JKvehicle) findEmptyPosition [5, 20, "MASH"];
if (_position isEqualTo []) then {
    hint JK_BUILD_NO_SPACE;
} else {
    private _JKtent = "MASH" createVehicle _position;
    _JKtent setdir (getDir _JKvehicle);
    private _action = [JK_VAR_TENT_OF_VEHICLE_BUILT, JK_TEAR_DOWN_NAME, "",
        JK_fnc_destructTentProgressBar,
        JK_fnc_canBuildTent
    ] call ace_interact_menu_fnc_createAction;
    [_JKtent, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject",0,true];
    _JKtent setVariable ["ace_medical_isMedicalFacility", true, true];
    _JKvehicle setVariable [JK_VAR_TENT_OF_VEHICLE_BUILT, true, true];
    _JKtent setVariable [JK_VAR_VEHICLE_OF_TENT, _JKvehicle, true];
};
true
