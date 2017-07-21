/*
 * Author: joko // Jonas (, SpecOp0)
 */
#include "const.hpp"

(_this select 0) params ["_JKtent","_JKplayer"];
private _JKvehicle = _JKtent getVariable [JK_VAR_VEHICLE_OF_TENT, objNull];
_JKtent setVariable [JK_VAR_VEHICLE_OF_TENT, objNull, true];
_JKvehicle setVariable [JK_VAR_TENT_OF_VEHICLE_BUILT, false, true];
deleteVehicle _JKtent;
true
