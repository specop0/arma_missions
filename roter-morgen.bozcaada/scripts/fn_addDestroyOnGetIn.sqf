params [ ["_vehicle",objNull,[objNull]] ];

if(!isNull _vehicle) then {
    _vehicle addEventHandler ["GetIn", {
        params ["_vehicle", "_position", "_unit"];
        if(({ isPlayer _x } count crew _vehicle) > 0 && _vehicle getVariable ["canBeDestroyed", true]) then {
            _vehicle setVariable ["canBeDestroyed", false, true];
            private _scriptHandle = [_vehicle] spawn {
                params ["_vehicle"];
                // play a sound to signalize the player that he fucked up
                for "_i" from 0 to 8 do {
                    playSound3D ["a3\sounds_f\sfx\beep_target.wss", _vehicle];
                    sleep (0.5 - _i * 0.05);
                };
                // destroy the vehicle
                _vehicle setDamage 1;
            };
        };
    }];
};