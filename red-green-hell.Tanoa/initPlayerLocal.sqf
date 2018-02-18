[teleporter] call FETT_fnc_W_addTeleport;
player addEventHandler ["Respawn",{
    params ["","_corpse"];
    if((getPosASL player) distance (getMarkerPos "respawn") < 1000) then {
        deleteVehicle _corpse;
    };
}];
teleporter addAction ["Zuschauermodus", {
    params ["_target","_caller"];
    _caller setPosASL (getPosASL spectator_cam_helper);
    [_caller, true] remoteExecCall ["hideObjectGlobal", 2];
    ["Initialize", [_caller, [], true]] call BIS_fnc_EGSpectator;
}];
if (typeOf player isEqualTo "B_Helipilot_F") then {
    [player] call Spec_cargoDrop_fnc_addPackAction;
};