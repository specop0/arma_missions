private _parameterCorrect = params [["_x",objNull,[objNull]]];

private _parachute = "B_Parachute";


if(_parameterCorrect) then {
	clearWeaponCargoGlobal _x;
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	_x addBackpackCargoGlobal [_parachute, 80];
};
