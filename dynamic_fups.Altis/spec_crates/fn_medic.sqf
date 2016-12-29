private _parameterCorrect = params [["_crate",objNull,[objNull]]];

private _bandageBasic = "ACE_fieldDressing";
private _packingBandage = "ACE_packingBandage";
private _quikcloth = "ACE_quikclot";
private _elasticBandage = "ACE_elasticBandage";
private _tourniquet = "ACE_tourniquet";

private _morphine = "ACE_morphine";
private _epinephrine = "ACE_epinephrine";
private _atropine = "ACE_atropine";

private _personalAidKit = "ACE_personalAidKit";
private _surgicalKit = "ACE_surgicalKit";

private _saline = "ACE_salineIV";
private _saline500 = "ACE_salineIV_500";

private _bodyBag = "ACE_bodyBag";

if(_parameterCorrect) then {
    _crate addItemCargoGlobal [_packingBandage,50];
    _crate addItemCargoGlobal [_elasticBandage,25];
    _crate addItemCargoGlobal [_bandageBasic,125];
    _crate addItemCargoGlobal [_quikcloth,25];
    _crate addItemCargoGlobal [_tourniquet,10];
    
    _crate addItemCargoGlobal [_saline,25];
    _crate addItemCargoGlobal [_saline500,20];
    _crate addItemCargoGlobal [_morphine,15];
    _crate addItemCargoGlobal [_epinephrine,15];
    _crate addItemCargoGlobal [_atropine,10];
    
    _crate addItemCargoGlobal [_personalAidKit,15];
    _crate addItemCargoGlobal [_surgicalKit,15];
    
    _crate addItemCargoGlobal [_bodyBag, 10];
};
