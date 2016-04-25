private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _chemlightRed = "ACE_HandFlare_Red";
private _chemlightRed = "ACE_HandFlare_Yellow";

if(_parameterCorrect && isServer) then {
    _crate addMagazineCargoGlobal [_chemlightRed,12];
    _crate addMagazineCargoGlobal [_chemlightYellow,24];
};
