[teleporter] call FETT_fnc_W_addTeleport;
if(player getVariable ["isBussard",false]) then {
	[player] call Spec_cargoDrop_fnc_addPackAction;
};