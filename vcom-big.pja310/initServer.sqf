private _id = addMissionEventHandler ["HandleDisconnect",{
    params ["_unit"];
    if((getPosASL _unit) distance (getMarkerPos "respawn") < 1000) then {
        deleteVehicle _unit;
    };
}];

// lights at medic facility
{
    _x params ["_lampOn","_lampOff", "_yOffset"];
    _lampOn attachTo [medicFacility, [1.63,_yOffset,-1.82]];
    _lampOff attachTo [medicFacility, [1.63,_yOffset,-1.82]];
    
    _lampOn setDir 0;
    _lampOff setDir 180;
    
    _lampOn setVariable ["lamp", _lampOff, true];
    _lampOff setVariable ["lamp", _lampOn, true];
    
    _lampOff hideObjectGlobal true;
} forEach [
    [lampMedicA, lampMedicAOff, 0.8],
    [lampMedicB, lampMedicBOff, 3.3]
];
// lights at hangar
lampHangarA attachTo [lampHangarHelper, [0,0,0]];
lampHangarB attachTo [lampHangarHelper, [0,-10.3,0]];