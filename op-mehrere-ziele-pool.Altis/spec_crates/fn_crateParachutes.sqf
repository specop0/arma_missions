private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _parachute = "B_Parachute";


if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _crate;
    clearBackpackCargoGlobal _crate;
    clearItemCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    _crate addBackpackCargoGlobal [_parachute, 80];
};
