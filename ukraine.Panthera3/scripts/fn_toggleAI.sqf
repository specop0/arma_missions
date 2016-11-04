params [ "_positionOrObject", ["_enabled",false,[true]] ];
private _vehicles = nearestObjects [_positionOrObject, ["LandVehicle"], 50];
{
    {
        _x enableSimulationGlobal _enabled;
    } foreach crew _x;
    if(_enabled) then {
        private _groupOfDriver = group (driver _x);
        ((waypoints _groupOfDriver) select (currentWaypoint _groupOfDriver)) setWaypointStatements ["true",""];
    };
    _x hideObjectGlobal !_enabled;
} foreach _vehicles;
{
    _x enableSimulationGlobal _enabled;
} foreach (nearestObjects [_positionOrObject, ["CAManBase"], 50]);
true
