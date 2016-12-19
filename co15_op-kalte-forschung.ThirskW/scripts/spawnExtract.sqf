params [ ["_spawnPosition",[0],[[]]], ["_targetPosition",[0],[[]]], ["_heliType","",[""]] ];

if(isServer) then {
    _spawnPosition set [2, (_spawnPosition select 2) + 150];
    private _heliArray = [_spawnPosition, 0, _heliType, west] call BIS_fnc_spawnVehicle;
    _heliArray params ["_heli", "_heliCrew", "_heliGroup"];
    
    private _waypoint = _heliGroup addWaypoint [_targetPosition, 0];
    _waypoint setWaypointType "TR UNLOAD";
    
    private _scriptHandle = [] spawn {
        sleep 60;
        ["Mission Complete",True] call BIS_fnc_endMissionServer;
    };
};
true
