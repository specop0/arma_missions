/*
	Author: SpecOp0

	Description:
	Assigns a Player to all Curators (Respawn/JIP).
	If the Player is a Curator an action entry will be added to assign allUnits manually.

	Parameter(s):
	0: OBJECT - player (or unit) which should be added to the Curators

	Returns:
	true
*/

if(!isServer) then {
	// call this function on server
	_this remoteExecCall ["Spec_fnc_assignToAllCurators", 2, false];
} else {
	private _parameterCorrect = params [ ["_player",objNull,[objNull]] ];
	if(_parameterCorrect) then {
		// add respawned (or JIP) player to allCurators
		{
			_x addCuratorEditableObjects [[_player],false];
		} forEach allCurators;
	} else {
		"Wrong Parameter: Expected (player) object" call BIS_fnc_error;
	};
};
true
