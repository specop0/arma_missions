/*
 * Author: joko // Jonas (, SpecOp0)
 */
#include "const.hpp"

params ["_JKvehicle"];
private _position = (getPos _JKvehicle) findEmptyPosition [5, 20, "MASH"];
if (_position isEqualTo []) then {
	hint JK_BUILD_NO_SPACE;
} else {
	player playMove JK_BUILD_ANIMATION;
	[JK_BUILD_TIME, _this, JK_fnc_buildTent, {(_this select 0) select 1 switchMove ""}, JK_BUILD_NAME] call ace_common_fnc_progressBar;
};
true
