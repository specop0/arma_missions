/*
 * Author: joko // Jonas (, SpecOp0)
 */
#include "const.hpp"

params ["_JKvehicle","_JKplayer"];
!(_JKvehicle getVariable [JK_VAR_TENT_OF_VEHICLE_BUILT, false]) && (([_JKplayer] call ace_medical_fnc_isMedic) || ([_JKplayer] call ace_common_fnc_isEngineer)) && _JKplayer == vehicle _JKplayer
