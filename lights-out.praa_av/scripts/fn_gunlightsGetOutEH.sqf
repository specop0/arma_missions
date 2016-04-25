if(isServer) then {
    params [ ["_vehicle",objNull,[objNull]] ];
    _vehicle addEventHandler ["GetOut", {
        [_this select 2] spawn {
            params ["_unit"];
            [_unit,"forceOn"] remoteExec ["enableGunLights",_unit];
        };
    }];
};