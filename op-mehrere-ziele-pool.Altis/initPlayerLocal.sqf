[teleporter] call FETT_fnc_W_addTeleport;
private _funkerClass = "B_Soldier_SL_F";
private _tfClass = "B_Soldier_TL_F";
if(typeOf player in [_funkerClass,_tfClass]) then {
	private _actionMedevac = ["Spec_action_callMedevac", "Rufe Weiss", "", {_this remoteExec ["Spec_fnc_heli_medevac",2]}, {true}] call ace_interact_menu_fnc_createAction;
	[player,1, ["ACE_SelfActions"], _actionMedevac] call ace_interact_menu_fnc_addActionToObject;
	if(typeOf player == _funkerClass) then {
		[] call Spec_fnc_moveMarkerLZ;
		private _actionBussard = ["Spec_action_callBussard", "Rufe Bussard", "", {_this remoteExec ["Spec_fnc_heli_taxi",2]}, {true}] call ace_interact_menu_fnc_createAction;
		[player,1, ["ACE_SelfActions"], _actionBussard] call ace_interact_menu_fnc_addActionToObject;
	};
};

[player] call compile preprocessFileLineNumbers "briefing.sqf"