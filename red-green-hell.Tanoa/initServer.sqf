private _id = addMissionEventHandler ["HandleDisconnect",{
    params ["_unit"];
    if((getPosASL _unit) distance (getMarkerPos "respawn") < 1000) then {
        deleteVehicle _unit;
    };
}];

{
    if(typeof _x isEqualTo "I_MRAP_03_hmg_F") then {
        [_x] call Spec_fnc_fennek;
        _x disableTIEquipment true;
    };
} forEach vehicles;