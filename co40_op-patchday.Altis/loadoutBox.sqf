private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];
if(_parameterCorrect) then {
	_object addAction ["Use Class", Spec_fnc_loadout, nil, -2];
	_object addAction ["AT-Schuetze", Spec_fnc_loadout, "B_soldier_LAT_F", -3];
	_object addAction ["Feldarzt", Spec_fnc_loadout, "B_helicrew_F", -4];
	_object addAction ["Funker", Spec_fnc_loadout, "B_Soldier_SL_F", -5];
	_object addAction ["Gefechtssanitaeter", Spec_fnc_loadout, "B_medic_F", -6];
	_object addAction ["Grenadier", Spec_fnc_loadout, "B_Soldier_GL_F", -7];
	_object addAction ["LMG-Schuetze", Spec_fnc_loadout, "B_Soldier_lite_F", -8];
	_object addAction ["Logistik", Spec_fnc_loadout, "B_soldier_repair_F", -9];
	_object addAction ["MG-Assistent", Spec_fnc_loadout, "B_Soldier_A_F", -10];
	_object addAction ["MG-Schuetze", Spec_fnc_loadout, "B_soldier_AR_F", -11];
	_object addAction ["OPL", Spec_fnc_loadout, "B_officer_F", -12];
	_object addAction ["Pilot", Spec_fnc_loadout, "B_Helipilot_F", -13];
	_object addAction ["Pionier", Spec_fnc_loadout, "B_engineer_F", -14];
	_object addAction ["Truppfuehrer", Spec_fnc_loadout, "B_Soldier_TL_F", -15];
};
