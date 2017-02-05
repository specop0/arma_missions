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
// add spectator cam
teleporter addAction ["Zuschauermodus", {
    params ["_target","_caller"];
    ["Initialize", [_caller, [], true]] call BIS_fnc_EGSpectator;
    [_caller,true] remoteExecCall ["hideObjectGlobal", 2];
},[],0.5,false,true,"","",5];