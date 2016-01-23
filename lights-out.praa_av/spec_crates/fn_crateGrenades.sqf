private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _chemlightRed = "ACE_HandFlare_Red";

if(_parameterCorrect && isServer) then {
	_crate addMagazineCargoGlobal [_chemlightRed,12];
};
