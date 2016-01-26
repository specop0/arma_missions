private _parameterCorrect = params [ ["_leader",objNull,[objNull]] ];

if(_parameterCorrect && {local _leader}) then {
	private _group = group _leader;
	if(!isNull _group) then {
		private _index = -1;
		{
			if(waypointType _x isEqualTo "CYCLE") exitWith { _index = _forEachIndex; };
		} forEach waypoints _leader;
		if(_index >= 0) then {
			_group setCurrentWaypoint [_group, _index + 1];
		};
	};
};