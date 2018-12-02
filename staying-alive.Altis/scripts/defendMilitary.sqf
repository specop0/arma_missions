private _sourceMarkerPos = getMarkerPos "OPFOR_2";
private _sourceMarkerSize = getMarkerSize "OPFOR_2";
private _sourceRadius = (_sourceMarkerSize select 0) max (_sourceMarkerSize select 1);
private _groups = [];
{
    private _group = group _x;
    if !(_group in _groups) then {
         _groups pushBack _group;
    };
} forEach nearestObjects [_sourceMarkerPos, ["CAManBase"], _sourceRadius * 1.75];

private _targetMarkerPos = getMarkerPos "OPFOR_1";
private _targetMarkerSize = getMarkerSize "OPFOR_1";
private _targetRadius = (_targetMarkerSize select 0) max (_targetMarkerSize select 1);
{
    private _waypoint = _x addWaypoint [_targetMarkerPos, _targetRadius];
    _waypoint setWaypointType "SAD";
    _x setCurrentWaypoint [_x, count waypoints _x];
} forEach _groups;