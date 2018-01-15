private _id = addMissionEventHandler ["HandleDisconnect",{
    params ["_unit"];
    if((getPosASL _unit) distance (getMarkerPos "respawn") < 1000) then {
        deleteVehicle _unit;
    };
}];
// attach charge to vehicle and let it destroy on get in
[iedVehicle1] call Spec_fnc_addDestroyOnGetIn;
ied1 attachTo [iedVehicle1, [0.1,1,-0.68]];
ied1 setDir 0;