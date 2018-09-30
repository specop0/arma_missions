birdA attachTo [carA, [0, -1.6, 0.72]];

// load crates (in spawn because the spare wheel should be added first)
private _spawn = [] spawn {
    sleep 1;
    private _carAndTypes = 
    {
        _x params ["_vehicle", "_types"];
        {
            {
                [_x, _vehicle] call ace_cargo_fnc_loadItem;
            } forEach nearestObjects [_vehicle, [_x], 100];
        } forEach _types;
    } forEach [
        [carA, ["Box_NATO_Ammo_F"]],
        [medic1, ["ACE_medicalSupplyCrate"]],
        [carB, ["Box_NATO_Grenades_F", "Box_NATO_AmmoOrd_F", "Box_NATO_WpsLaunch_F"]]
    ];
};