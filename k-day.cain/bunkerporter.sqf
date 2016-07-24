{
private _actionPack = ["test", "test", "", {
    params ["_target","_caller"];
    hint "yes";
    private _scriptHandle = [_caller] spawn {
        params ["_player"];
        _player setPosASL getPosASL bunkerporter_target1;
        sleep 2;
        _player setPosASL getPosASL bunkerporter_target2;
    };
}, {true}] call ace_interact_menu_fnc_createAction;
[_x,0, ["ACE_MainActions"], _actionPack] call ace_interact_menu_fnc_addActionToObject;

_x addAction ["<t color='#FF0000'>This Useless Action Is RED</t>", {hint "RED"}];

} forEach [bunkerporter1, bunkerporter2, bunkerporter3];

hint "done";