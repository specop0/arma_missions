private _scriptHandle = _this spawn {

params [ "_targetPosition", ["_upOnTriggerNumber",-1,[0]], ["_targetsAboveWater",false,[true]] ];

if(_upOnTriggerNumber != -1) then {
    private _nearestObjects = nearestObjects [_targetPosition, ["CAManBase","LandVehicle"], 300];
    private _nearestEnemies = [];
    {
        if(alive _x && (side _x == WEST || side _x == CIVILIAN)) then {
            _nearestEnemies pushBack _x;
        };
    } forEach _nearestObjects;
    
    private _unitsToFire = [];
    {
        if(_x getVariable ["upOnTrigger", -1] == _upOnTriggerNumber) then {
            _unitsToFire pushBack _x;
        };
    } forEach allUnits;
    // erect units
    {
        _x setUnitPos "UP";
    } forEach _unitsToFire;
    // wait short time before commanding suppressive fire
    hint "getup";
    sleep 4;
    hint "fire!";
    for "_i" from 0 to 20 do {
        hint format ["fire %1", time];
        {
            // getPosATL if targets are above water!
            private _position = if(_targetsAboveWater) then { getPosATL (selectRandom _nearestEnemies) } else { getPosASL (selectRandom _nearestEnemies) };
            _x doSuppressiveFire _position;
        } forEach _unitsToFire;
        sleep 3;
    };
};

};
true
