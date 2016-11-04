private _vehicleAndGunSet = 
[
    [offroad_1, gun_1],
    [offroad_2, gun_2],
    [offroad_3, gun_3],
    [offroad_4, gun_4],
    [offroad_5, gun_5],
    [offroad_6, gun_6]
];

#define CAR_OFFSET_X_GETOUT 1.5
#define CAR_OFFSET_Y_GETOUT - 2
#define CAR_OFFSET_ATTACH_ARRAY [0.3,-1.3,0.35]

// TODO disable dissassemble action
{
    _x params ["_vehicle","_gun"];
    if(isServer) then {
        // attach gun to car (on server)
        _gun attachTo [_vehicle, CAR_OFFSET_ATTACH_ARRAY];
    };
    if(hasInterface) then {
        // disable ace drag and carry
        [_gun, false, [0,0,0], 0] call ace_dragging_fnc_setDraggable;
        [_gun, false, [0,0,0], 0] call ace_dragging_fnc_setCarryable;
    
        // add action to reattach gun
       _gun setVariable ["Spec_attachObject", _vehicle];
       _gun addAction ["Am Fahrzeug befestigen", {
            params ["_target", "_caller"];
            private _vehicle = _target getVariable ["Spec_attachObject", objNull];
            if (alive _vehicle) then {
                if(_target distance _vehicle < 5) then {
                    _target attachTo [_vehicle, CAR_OFFSET_ATTACH_ARRAY];
                    hint "Ich war so nett die Waffe nochmal am Fahrzeug festzuschnallen. Pass nächstes mal besser auf!";
                } else {
                    hint "Du bist zu weit weg um die Waffe erneut am Fahrzeug zu befestigen. (Mehr als 5m)";
                };
            };
        }, [], 1.5, false, true, "", "isNull attachedTo _target", 4.9];
        
        // if player gets out of attached gun, reposition him to minimize clipping in vehicle
        _gun addEventHandler ["GetOut", {
            params ["_vehicle", "_position", "_unit"];
            private _attachedObject = attachedTo _vehicle;
            if (!isNull _attachedObject) then {
                private _pos = getPosASL _attachedObject;
                private _posX = _pos select 0;
                private _posY = _pos select 1;
                private _direction = direction _vehicle;
                _unit setPosASL [
                    _posX + CAR_OFFSET_Y_GETOUT * sin(_direction) - CAR_OFFSET_X_GETOUT * cos(_direction),
                    _posY + CAR_OFFSET_Y_GETOUT * cos(_direction) + CAR_OFFSET_X_GETOUT * sin(_direction),
                    _pos select 2
                ];
            };
        }];
    };
} forEach _vehicleAndGunSet;