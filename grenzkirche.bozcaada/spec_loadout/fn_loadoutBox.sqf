private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];
if(_parameterCorrect && hasInterface) then {
	private _loadoutClassList = [];
	_loadoutClassList pushBack ["AT-Schuetze","O_soldier_LAT_F"];
	_loadoutClassList pushBack ["Feldarzt","O_helicrew_F"];
	_loadoutClassList pushBack ["Funker","O_Soldier_SL_F"];
	_loadoutClassList pushBack ["Gefechtssanitaeter","O_medic_F"];
	_loadoutClassList pushBack ["Grenadier","O_Soldier_GL_F"];
	_loadoutClassList pushBack ["LMG-Schuetze","O_Soldier_lite_F"];
	_loadoutClassList pushBack ["Logistik","O_soldier_repair_F"];
	_loadoutClassList pushBack ["MG-Assistent","O_Soldier_A_F"];
	_loadoutClassList pushBack ["MG-Schuetze","O_soldier_AR_F"];
	_loadoutClassList pushBack ["OPL","O_officer_F"];
	_loadoutClassList pushBack ["Pilot","O_Helipilot_F"];
	_loadoutClassList pushBack ["Pionier","O_engineer_F"];
	_loadoutClassList pushBack ["Truppfuehrer","O_Soldier_TL_F"];

	//add classes
	private _i = -4;
	
	_conditionString = "true";
	_object addAction ["Benutze Slot",{
			params ["","_caller"];
			[_caller] call Spec_fnc_loadout_rus_flora_alt;
		}, nil, _i, false, true, "", _conditionString];
	// for each class addAction
	{
		_object addAction [(_x select 0), {
				params ["","_caller"];
				(_this select 3) params ["_type"];
				[_caller, _type] call Spec_fnc_loadout_rus_flora_alt;
			}, [_x select 1], _i, false, true, "", _conditionString];
		_i = _i - 1;
	} forEach _loadoutClassList;

};
