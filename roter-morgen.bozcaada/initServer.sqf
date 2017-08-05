private _id = addMissionEventHandler ["HandleDisconnect",{
    params ["_unit"];
    if((getPosASL _unit) distance (getMarkerPos "respawn") < 1000) then {
        deleteVehicle _unit;
    };
}];
missionNamespace setVariable  ["ace_cookoff_ammoCookoffDuration", 0.01, true];