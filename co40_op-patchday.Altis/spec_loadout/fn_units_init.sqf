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
		if(side _x == west) then {
			comment "assign loadout to AI only (excellent for testing purposes)";
			if(!isPlayer _x) then {
				[_x] call Spec_fnc_loadout;
				_x addEventHandler ["respawn", Spec_fnc_loadout];
			}
		} else {
			_x removeMagazines "1Rnd_HE_Grenade_shell";
		};
	} foreach  allunits;  
};
if(hasInterface) then {
	[player] call Spec_fnc_loadout;
	player addEventHandler ["respawn", Spec_fnc_loadout];
};
true
