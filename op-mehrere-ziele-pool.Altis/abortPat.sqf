params ["_thisList"];

if(isServer) then {
	{ 
		if ((leader _x) in _thisList) then {
			private _number = (count (waypoints _x)) - 1;
			[_x,[_x,_number]] remoteExec ["setCurrentWaypoint", leader _x];
		};
	} forEach allGroups;
	if(!isNil "fennek") then {
		private _crew = crew fennek;
		if(count _crew > 0) then {
			private _group = group (_crew select 0);
			private _number = (count (waypoints _group)) - 1;
			[_group,[_group,_number]] remoteExec ["setCurrentWaypoint", leader _group];
		}; 
	};  
};