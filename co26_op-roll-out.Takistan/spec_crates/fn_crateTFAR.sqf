private _parameterCorrect = params [["_x",objNull,[objNull]]];

private _shortRange = "tf_fadak_1";
private _longRange = "tf_mr3000";

if(_parameterCorrect) then {
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addItemCargoGlobal [_shortRange,10];
	_x addBackpackCargoGlobal [_longRange,3];
};
