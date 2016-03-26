[teleporter] call FETT_fnc_W_addTeleport;
if(typeOf player in ["TTT_Bussard1_Us_Woodland","TTT_Bussard2_Us_Woodland"]) then {
	[player] call Spec_cargoDrop_fnc_addPackAction;
};

if(typeOf player in ["TTT_Weiss1_Us_Woodland"]) then {
	[player] call Spec_fnc_longrangeMedic;
	player addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_longrangeMedic;}];
};