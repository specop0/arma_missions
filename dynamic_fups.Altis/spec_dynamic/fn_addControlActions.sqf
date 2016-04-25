#include "const.hpp"
private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];

if(_parameterCorrect && hasInterface) then {
    private _entry = 1.5;
    
    Spec_dynamic_subMenu = "MAIN";
    private _conditionString = "!(Spec_dynamic_subMenu isEqualTo ""MAIN"")";
    
    _object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_dynamic_subMenu = "MAIN";}, nil, _entry, false, false, "", _conditionString];
    _object addAction ["Settings FUPS", {Spec_dynamic_subMenu = "SETTINGS";}, nil, _entry, false, false, "", "(Spec_dynamic_subMenu isEqualTo ""MAIN"")"];
    
    // enemy factions
    {
        _object addAction [_x,{
            (_this select 3) params ["_enemy"];
            [_enemy] remoteExec ["Spec_dynamic_fnc_selectEnemy",2];
            Spec_dynamic_subMenu = "MAIN";
        }, [_x], _entry, false, false, "", _conditionString ];
    } forEach ENEMY_SIDE_ARRAY;
    
    _object addAction ["---------",{hint "Missclick?";},nil,_entry, false, false, "", _conditionString];
    
    // settings for extra groups (units, vehicle, armor)
    private _color = ["579D1C","FF950E","EE0000"];
    private _type = ["Group","Vehicle","Armor"];
    for "_i" from 0 to 2 do {
        // show
        _object addAction [format ["<t color='#%2'>Show Extra %1</t>", _type select _i, _color select _i], {
            params ["_target","_caller"];
            (_this select 3) params ["_i"];
            [_caller,_i,0] remoteExec ["Spec_dynamic_fnc_changeSettings",2];
        }, _i, _entry, false, false, "", _conditionString ];
        // increase
        _object addAction [format ["<t color='#%2'>Increase Extra %1</t>", _type select _i, _color select _i], {
            params ["_target","_caller"];
            (_this select 3) params ["_i"];
            [_caller,_i,1] remoteExec ["Spec_dynamic_fnc_changeSettings",2];
        }, _i, _entry, false, false, "", _conditionString ];
        // decrease
        _object addAction [format ["<t color='#%2'>Decrease Extra %1</t>", _type select _i, _color select _i], {
            params ["_target","_caller"];
            (_this select 3) params ["_i"];
            [_caller,_i,-1] remoteExec ["Spec_dynamic_fnc_changeSettings",2];
        }, _i, _entry, false, false, "", _conditionString ];
    };
    
    _object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_dynamic_subMenu = "MAIN";}, nil, _entry, false, false, "", _conditionString];
    
    _object addAction [
        "Naechstes OBJ",
        {[] remoteExec ["Spec_dynamic_fnc_selectCity",2]},
        [],
        _entry,
        false,
        true,
        "",
        "_this distance _target < 3"
    ];
    
};
true
