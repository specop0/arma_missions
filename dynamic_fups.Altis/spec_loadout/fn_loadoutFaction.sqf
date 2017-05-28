/*
    Author: SpecOp0

    Description:
    Assigns a loadout for a given faction.

    Parameter(s):
    0: ARRAY
        1: OBJECT - unit to assign loadout to
        2 (Optional) : STRING - classname classname which represents loadout type (default: classname of unit)
    1 (Optional) : STRING - Name of the faction. Uses the saved default value in missionNamespace or NATO.

    Returns:
    true
*/
#include "const.hpp"

private _parameterCorrect = params ["_parameter", ["_faction", missionNamespace getVariable [SPEC_LOADOUT_VAR_FACTION, "NATO"],[""]] ];

if(_parameter isEqualTypeAny [objNull,[]]) then {
    missionNamespace setVariable [SPEC_LOADOUT_VAR_FACTION, _faction];
    switch (_faction) do {
        case "NATO" : {
            _parameter call Spec_fnc_loadout_nato;
        };
        case "AAF" : {
            _parameter call Spec_fnc_loadout_aaf;
        };
        case "CSAT" : {
            _parameter call Spec_fnc_loadout_csat;
        };
        case "NATO_PACIFIC" : {
            _parameter call Spec_fnc_loadout_nato_tropentarn;
        };
        case "CSAT_PACIFIC" : {
            _parameter call Spec_fnc_loadout_csat_tropentarn;
        };
        case "SYNDICAT" : {
            _parameter call Spec_fnc_loadout_syndicat;
        };
        case "POLICE" : {
            _parameter call Spec_fnc_loadout_police;
        };
        case "CUP_USSOCOM" : {
            _parameter call Spec_fnc_loadout_cup_ussocom;
        };
        case "KOREA" : {
            _parameter call Spec_fnc_loadout_korea;
        };
        case "USARMY" : {
            _parameter call Spec_fnc_loadout_usarmy;
        };
        case "USMC" : {
            _parameter call Spec_fnc_loadout_usmc;
        };
        case "USSOCOM" : {
            _parameter call Spec_fnc_loadout_ussocom;
        };
        case "US_WINTER" : {
            _parameter call Spec_fnc_loadout_us_winter;
        };
        case "RUS" : {
            _parameter call Spec_fnc_loadout_rus_flora;
        };
        case "RUS_ALT" : {
            _parameter call Spec_fnc_loadout_rus_flora_alt;
        };
        case "UK" : {
            _parameter call Spec_fnc_loadout_uk;
        };
        case "UK_WINTER" : {
            _parameter call Spec_fnc_loadout_uk_winter;
        };
        case "BW_TROPEN" : {
            _parameter call Spec_fnc_loadout_bw_tropentarn;
        };
        case "BW_FLECK" : {
            _parameter call Spec_fnc_loadout_bw_flecktarn;
        };
        case "NORWAY_WOOD" : {
            _parameter call Spec_fnc_loadout_norway_wood;
        };
        case "NORWAY_DESERT" : {
            _parameter call Spec_fnc_loadout_norway_desert;
        };
        case "UKRAINE" : {
            _parameter call Spec_fnc_loadout_ukraine;
        };
        default {
            _parameter call Spec_fnc_loadout_nato;
        };
    };
};
true
