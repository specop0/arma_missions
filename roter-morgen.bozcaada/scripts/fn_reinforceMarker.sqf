private _scriptHandle = _this spawn {
	private _parameterCorrect = params [ ["_marker","",[""]] ];
	_parameterCorrect = true;
	if(_parameterCorrect && isServer) then {
		private _markerPos = getMarkerPos _marker;
		if(_markerPos select 0 != 0 && _markerPos select 1 != 0) then {
			private ["_wp"];
			{
				if(!isNull _x && {alive leader _x && side _x in [WEST,INDEPENDENT]}) then {
					_wp = _x addWaypoint [_markerPos, 100];
					_wp setWaypointSpeed "FULL";
					_wp setWaypointBehaviour "COMBAT";
					_x setCurrentWaypoint _wp;
					sleep 1;
				};
			} forEach allGroups;
		} else {
			hint format ["marker\n'%1'\nnot found",_marker];
		};
	};
};
true
