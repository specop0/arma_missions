[teleporter] call FETT_fnc_W_addTeleport;

[player] call Spec_fnc_loadout_init;
player addEventHandler ["respawn", Spec_fnc_loadout_respawn];

call JK_fnc_medicTent;

transport_spawner addAction ["Spawn Transporter", Spec_fnc_spawn_vehicle];