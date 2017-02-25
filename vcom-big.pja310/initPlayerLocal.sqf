[teleporter] call FETT_fnc_W_addTeleport;

{
    _x addAction ["Lampe an/aus", {
        params ["_target","_caller"];
        private _otherLamp = _target getVariable ["lamp", objNull];
        [_target,true] remoteExec ["hideObjectGlobal",2];
        [_otherLamp,false] remoteExec ["hideObjectGlobal",2];
    }, [], 1.5, true, true, "", "true", 3];
} forEach [lampMedicA, lampMedicB, lampMedicAOff, lampMedicBOff];

player addEventHandler ["Respawn",{
    params ["","_corpse"];
    if((getPosASL player) distance (getMarkerPos "respawn") < 1000) then {
        deleteVehicle _corpse;
    };
}];