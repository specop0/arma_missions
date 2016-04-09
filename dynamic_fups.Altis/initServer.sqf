private _id = ["HandleDisconnect",{
	params ["_unit"];
	private _posASL = getPosASL _unit;
	_posASL resize 2;
	if(_posASL distance (getMarkerPos "respawn") < 1000) then {
		deleteVehicle _unit;
	};
}];