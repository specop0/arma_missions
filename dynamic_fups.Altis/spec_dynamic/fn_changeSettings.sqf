#include "const.hpp"

params [ ["_caller",objNull,[objNull]], ["_settingIndex",-1,[0]], ["_change",0,[0]] ];

if(isServer) then {
    private _extraType = ["Group","Vehicle","Armor"] select _settingIndex;
    private _extraVar = [EXTRA_GROUP_VAR,EXTRA_VEHICLE_VAR,EXTRA_ARMOR_VAR] select _settingIndex;
    switch (_settingIndex) do {
        case 0 : {
            EXTRA_GROUP_VAR = EXTRA_GROUP_VAR + _change;
            _extraVar = EXTRA_GROUP_VAR;
        };
        case 1: {
            EXTRA_VEHICLE_VAR = EXTRA_VEHICLE_VAR + _change;
            _extraVar = EXTRA_VEHICLE_VAR;
        };
        case 2: {
            EXTRA_ARMOR_VAR = EXTRA_ARMOR_VAR + _change;
            _extraVar = EXTRA_ARMOR_VAR;
        };
    };
    format ["Extra %1 = %2", _extraType, _extraVar] remoteExecCall ["hint",_caller];
} else {
    ["This function must be called on the Server."] call BIS_fnc_error;
};
true
