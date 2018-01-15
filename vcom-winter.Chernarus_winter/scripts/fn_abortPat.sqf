params ["_trigger", ["_radius", 1000, [0]]];

if(isServer) then {
    { 
        // search groups which are in range and have no player
        private _group = _x;
        if ((leader _group) distance _trigger < _radius && {{ isPlayer _x } count units _group == 0}) then {
            // check if waypoint to skip is present (e.g. cycle or hold)
            private _nextWaypointIndex = -1;
            {
                if (waypointType _x in ["CYCLE", "HOLD", "GUARD"]) exitWith { _nextWaypointIndex = _forEachIndex + 1; };
            } forEach waypoints _group;
            // skip waypoint
            if !(_nextWaypointIndex isEqualTo -1) then {
                [_group,[_group,_nextWaypointIndex]] remoteExec ["setCurrentWaypoint", groupOwner _group];
            };
        };
    } forEach allGroups;
};