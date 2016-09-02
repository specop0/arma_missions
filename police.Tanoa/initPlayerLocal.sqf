[teleporter1] call FETT_fnc_W_addTeleport;

private _actionSirenOn = ["sirenOn", "Sirene an", "", {
    private _scriptHandle = _this spawn {
        params ["_target","_caller"];
        if(!(_target getVariable ["sirenOn", false])) then {
            _target setVariable ["sirenOn", true, true];
            while { vehicle _caller == _target && _target getVariable ["sirenOn", false] && alive _target && alive _caller } do {
                [_target, "ambulance"] remoteExecCall ["say3D"];
                sleep 23.5;
            };
            _target setVariable ["sirenOn", false, true];
        };
    };
}, {
    params ["_target","_caller"];
    !(_target getVariable ["sirenOn", false])
}] call ace_interact_menu_fnc_createAction;
private _actionSirenOff = ["sirenOff", "Sirene aus", "", {
    params ["_target", "_caller"];
    _target setVariable ["sirenOn", false, true];
}, {
    params ["_target","_caller"];
    _target getVariable ["sirenOn", false]
}] call ace_interact_menu_fnc_createAction;
{
    [_x,1, ["ACE_SelfActions"], _actionSirenOn] call ace_interact_menu_fnc_addActionToObject;
    [_x,1, ["ACE_SelfActions"], _actionSirenOff] call ace_interact_menu_fnc_addActionToObject;
} foreach [ambulance1, ambulance2, ambulance3, police1];


private _course =
[
    [course_a1, "Toggle A1"],
    [course_a2, "Toggle A2"],
    [course_b1, "Toggle B1"],
    [course_b2, "Toggle B2"],
    [course_c1, "Toggle C1"],
    [course_c2, "Toggle C2"],
    [course_c3, "Toggle C3"],
    [course_c4, "Toggle C4"],
    [course_d1, "Toggle D1"]
];

{
    laptop addAction [_x select 1, {
        params ["_target","_caller","_id","_arguments"];
        _arguments params ["_object", "_name"];
        private _isObjectShown = !(isObjectHidden _object);
        [_object, _isObjectShown] remoteExecCall ["hideObjectGlobal", 2];
        if(_isObjectShown) then {
            hint format ["%1: %2", _name, "offen"];
        } else {
            hint format ["%1: %2", _name, "verschlossen"];
        };
    }, _x, 1.5, false];
} forEach _course;