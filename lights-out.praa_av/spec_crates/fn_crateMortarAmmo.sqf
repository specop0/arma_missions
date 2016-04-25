private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _flare = "UK3CB_BAF_1Rnd_81mm_Mo_Flare_white";
private _he = "UK3CB_BAF_1Rnd_81mm_Mo_shells";
private _smoke = "UK3CB_BAF_1Rnd_81mm_Mo_Smoke_white";

if(_parameterCorrect && isServer) then {
    clearMagazineCargoGlobal _crate;
    _crate addMagazineCargoGlobal [_flare,12];
    _crate addMagazineCargoGlobal [_he,5];
};
