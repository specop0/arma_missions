private _parameterCorrect = params [["_x",objNull,[objNull]]];

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
private _saline250 = "ACE_salineIV_250";

private _bodyBag = "ACE_bodyBag";

if(_parameterCorrect && isServer) then {
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addItemCargoGlobal [_bandageBasic,100];
	_x addItemCargoGlobal [_packingBandage,65];
	_x addItemCargoGlobal [_quikcloth,25];
	_x addItemCargoGlobal [_elasticBandage,25];
	_x addItemCargoGlobal [_tourniquet,25];
	
	_x addItemCargoGlobal [_saline,25];
	_x addItemCargoGlobal [_saline500,25];
	_x addItemCargoGlobal [_saline250,25];
	_x addItemCargoGlobal [_morphine,25];
	_x addItemCargoGlobal [_epinephrine,25];
	_x addItemCargoGlobal [_atropine,25];
	
	_x addItemCargoGlobal [_personalAidKit,10];
	_x addItemCargoGlobal [_surgicalKit,10];
	
	_x addItemCargoGlobal [_bodyBag, 5];
};
