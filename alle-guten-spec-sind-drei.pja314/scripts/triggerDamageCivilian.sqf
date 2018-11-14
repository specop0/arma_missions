params ["_trigger"];

if (isServer && missionNamespace getVariable ["notAlreadyDamaged", true]) then {
    missionNamespace setVariable ["notAlreadyDamaged", false];

    // gather all civilian targets to damage
    private _civilianTargets = [];
    {
        if (!(isPlayer _x) && side _x isEqualTo CIVILIAN) then {
            _civilianTargets pushBack _x;
        };
    } forEach nearestObjects [_trigger, ["Man"], 80];

    // code must be executed where unit is local (e.g. headless clients)
    [[_civilianTargets], {
        params ["_civilianTargets"];
        {
            private _unit = _x;
            if (local _unit) then {
                // activate ace medic (needs advanced medic settings and remote controlled AI false)
                _unit setVariable ["bis_fnc_moduleRemoteControl_owner", _unit, true];
                _unit setVariable ["ace_medical_enableMedical", true, true];
                [_unit] call ace_medical_fnc_init;

                // add wounds
                [_unit, 0.8, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
                [_unit, 0.8, "body", "bullet"] call ace_medical_fnc_addDamageToUnit;
                {
                    _x params ["_selection", "_type"];
                    if (random 10 < 7) then {
                        [_unit, (floor random 8) + 0.2, _selection, _type] call ace_medical_fnc_addDamageToUnit;
                    };
                } forEach [
                    ["hand_r", "punch"],
                    ["hand_l", "shell"],
                    ["leg_r", "falling"],
                    ["leg_l", "bite"]
                ];
            };
        } forEach _civilianTargets;
    }] remoteExec ["BIS_fnc_call", _civilianTargets];
};