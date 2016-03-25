if(isServer) then {
	params [ ["_unit",objNull,[objNull]] ];
	_unit addEventHandler ["GetManOut", {
		params ["_unit"];
		private _player = nearestObject [_unit, "CAManBase"];
		private _wp = group _unit addWaypoint [_unit,0];
		_wp setWaypointBehaviour "COMBAT";
	}];
};