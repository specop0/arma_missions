[teleporter1] call FETT_fnc_W_addTeleport;
[teleporter2] call FETT_fnc_W_addTeleport;

carA addAction [
    "Lade Little Bird ab - <t color=""#A50000"">Platz hinterm Fahrzeug ist frei!</t>",
    {
        private _pos = carA modelToWorld [0, -9, -2.4];
        private _direction = getDir carA;
        detach birdA;
        birdA setPos _pos;
        birdA setDir _direction;
    },
    [],
    1.5,
    false,
    true,
    "",
    "birdA in attachedObjects carA",
    3
];