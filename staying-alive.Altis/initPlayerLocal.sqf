[teleporter] call FETT_fnc_W_addTeleport;
teleporter addAction ["Zuschauermodus", {
    params ["_target","_caller"];
    _caller setPosATL (getMarkerPos "spectator_cam_helper");
    [_caller, true] remoteExec ["hideObjectGlobal", 2];
    ["Initialize", [_caller, [], true]] call BIS_fnc_EGSpectator;
}];