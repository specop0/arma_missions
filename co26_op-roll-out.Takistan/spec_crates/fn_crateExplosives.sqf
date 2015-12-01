private _parameterCorrect = params [["_x",objNull,[objNull]]];

private _explosiveCharge = "DemoCharge_Remote_Mag";
private _apMine = "SLAMDirectionalMine_Wire_Mag";
private _clacker = "ACE_Clacker";

if(_parameterCorrect) then {
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addItemCargoGlobal [_explosiveCharge,8];
	_x addItemCargoGlobal [_apMine,8];
	_x addItemCargoGlobal [_clacker,2];
};
