#include "classVariables.hpp"

private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];
if(_parameterCorrect && hasInterface) then {

    private _loadoutClassList = [];
    _loadoutClassList pushBack ["AA-Schuetze",CLASS_AA];
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

    // for each faction add classes
    _object addAction ["Benutze Slot",{
            params ["","_caller"];
            [_caller, typeOf _caller] call Spec_fnc_loadout_rus_winter;
        }, [], 2, false, true, "", "true"];
    // for each class addAction
    {
        _x params ["_name", "_type"];
        _object addAction [_name, {
            params ["","_caller"];
            (_this select 3) params ["_type"];
            [_caller, _type] call Spec_fnc_loadout_rus_winter;
        }, [_type], 1, false, true, "", "true"];
    } forEach _loadoutClassList;
};
