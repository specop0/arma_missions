#include "classVariables.hpp"

private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];
if(_parameterCorrect && hasInterface) then {
	private _loadoutClassList = [];
	_loadoutClassList pushBack ["AT-Schuetze",CLASS_AT];
	_loadoutClassList pushBack ["Feldarzt",CLASS_MEDEVAC];
	_loadoutClassList pushBack ["Funker",CLASS_FUNKER];
	_loadoutClassList pushBack ["Gefechtssanitaeter",CLASS_MEDIC];
	_loadoutClassList pushBack ["Grenadier",CLASS_GL];
	_loadoutClassList pushBack ["LMG-Schuetze",CLASS_LMG];
	_loadoutClassList pushBack ["Logistik",CLASS_LOGISTIC];
	_loadoutClassList pushBack ["MG-Assistent",CLASS_MG_ASSI];
	_loadoutClassList pushBack ["MG-Schuetze",CLASS_MG];
	_loadoutClassList pushBack ["OPL",CLASS_OPL];
	_loadoutClassList pushBack ["Pilot",CLASS_PILOT];
	_loadoutClassList pushBack ["Pionier",CLASS_PIO];
	_loadoutClassList pushBack ["Truppfuehrer",CLASS_TF];

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
