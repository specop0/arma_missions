private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _backpackBig = "B_Carryall_oli";

if(_parameterCorrect && isServer) then {
	clearBackpackCargoGlobal _crate;
	_crate addBackpackCargoGlobal [_backpackBig,2];
};
