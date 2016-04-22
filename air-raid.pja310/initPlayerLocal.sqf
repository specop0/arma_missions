[teleporter] call FETT_fnc_W_addTeleport;
if(player getVariable ["isBussard",false]) then {
	[player] call Spec_cargoDrop_fnc_addPackAction;
};
player addEventHandler ["Respawn",{
	params ["","_corpse"];
	if((getPosASL player) distance (getMarkerPos "respawn") < 1000) then {
		deleteVehicle _corpse;
	};
}];