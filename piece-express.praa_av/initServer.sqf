// initialize units for scripts/upOnTrigger.sqf
{
    if(_x getVariable ["upOnTrigger", -1] >= 0) then {
        _x setUnitPos "DOWN";
    };
} forEach allUnits;

// attach planks to bus
private ["_vehicle", "_plank", "_memPointArray"];
_vehicle = bus;
_memPointArray = [
    [-1.35, 1.8, 0.6],
    [-1.35, -2.8, 0.6],
    [1.1, 1.2, 0.6],
    [1.1, -2.8, 0.6]
];
{
    _plank = "PRAA_statics_woodenramp1x4m90_2" createVehicle getPosASL _vehicle;
    _plank attachTo [_vehicle, _x];
    _plank setDir 90;
} foreach _memPointArray;
