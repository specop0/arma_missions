[teleporter_1] call FETT_fnc_W_addTeleport;
[teleporter_2] call FETT_fnc_W_addTeleport;

private _match = [typeOf player,"Gelb"] call ace_common_fnc_stringCompare;
if(_match >= 4) then {
	player call Spec_checkpoint_fnc_addShowDataAction;
};