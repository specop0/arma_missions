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
		if(side _x == east) then {
			comment "assign loadout to AI only (excellent for testing purposes)";
			[_x] call Spec_fnc_loadout_rus_flora_alt;
			_x addEventHandler ["Respawn", Spec_fnc_loadout_rus_flora_alt];
		} else {
			[_x] spawn Spec_fnc_loadout_nato_rebel;
			_x addEventHandler ["Respawn", Spec_fnc_loadout_nato_rebel];
		};
	} foreach  allUnits - allPlayers;
};
if(hasInterface) then {
	if(side player == east) then {
		[player] call Spec_fnc_loadout_rus_flora_alt;
		player addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_rus_flora_alt;}];
	} else {
		[player] spawn Spec_fnc_loadout_nato_rebel;
		player addEventHandler ["Respawn", {(_this select 0) call Spec_fnc_loadout_nato_rebel;}];
	};
};
true
