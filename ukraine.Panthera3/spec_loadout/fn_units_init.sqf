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
    {
        switch (side _x) do {
            case west : {
                [_x] call Spec_fnc_loadout_norway_wood;
                _x addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_norway_wood;}];
            };
            case independent : {
                [_x] call Spec_fnc_loadout_syndicat;
                _x addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_syndicat;}];
            };
            case civilian : {
                [_x] call Spec_fnc_loadout_civilian;
                _x addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_civilian;}];
            };
        };
    } foreach  allUnits - allPlayers;  
};
if(hasInterface) then {
    switch (side player) do {
        case west : {
            [player] call Spec_fnc_loadout_norway_wood;
            player addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_norway_wood;}];
        };
        case independent : {
            [player] call Spec_fnc_loadout_syndicat;
            player addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_syndicat;}];
        };
        case civilian : {
            [player] call Spec_fnc_loadout_civilian;
            player addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_civilian;}];
        };
    };
};
true
