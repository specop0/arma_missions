private _treeCutter = [
    [treecutter_1, 150, 12],
    [treecutter_2, 80, 10]
];

{
    _x params ["_helper", "_distance", "_width"];
    private _pos = getPosASL _helper;
    {
        private _relativePos = _helper worldToModel (getPosASL _x);
        private _relativeWidth = _relativePos select 0;
        private _relativeDistance = _relativePos select 1;
        if(_relativeDistance > 0 && _relativeDistance < _distance && _relativeWidth > - _width && _relativeWidth < _width) then {
            hideObjectGlobal _x;
        };
    } foreach nearestTerrainObjects [_pos ,[],_distance];
} foreach _treeCutter;

[convoi_helper,false] call Spec_fnc_toggleAI;

private _scriptHandle = [] spawn {
    sleep 5;
    
    private _chairAndPerson = [
        [chair1, chairsitter1],
        [chair2, chairsitter2]
    ];
    
    {
        _x call acex_sitting_fnc_sit;
    } foreach _chairAndPerson;
};

private _id = addMissionEventHandler ["HandleDisconnect",{
    params ["_unit"];
    private _camera = _unit getVariable ["camera", objNull];
    if(!isNull _camera) then {
        detach _camera;
        [_camera, true] remoteExecCall ["hideObjectGlobal",2];
    };
}];