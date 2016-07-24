/*
    Author: SpecOp0

    Description:
    Assigns a loadout to every unit.

    On the server every AI unit on the west side will be given the loadout (Spec_fnc_loadout).
    For every client (hasInterface) the loadout will be given - inclusive a respawn EventHandler.

    Parameter(s):
    -

    Returns:
    true
*/

if(isServer) then {
    private _scriptHandle = [] spawn {
        {
            if(local _x) then {
                comment "assign loadout to AI only (excellent for testing purposes)";
                [_x] call Spec_fnc_loadout;
                _x addEventHandler ["Respawn", Spec_fnc_loadout];
            };
        } foreach  allUnits - allPlayers;
    };
};
if(hasInterface) then {
    [player] call Spec_fnc_loadout;
    player addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout;}];
};
true
