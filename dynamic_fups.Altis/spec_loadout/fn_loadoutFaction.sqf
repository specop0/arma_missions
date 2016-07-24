private _parameterCorrect = params ["_parameter", ["_faction","NATO",[""]] ];

if(_parameterCorrect) then {
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
        case "RUS" : {
            _parameter call Spec_fnc_loadout_rus_flora;
        };
        case "RUS_ALT" : {
            _parameter call Spec_fnc_loadout_rus_flora_alt;
        };
        case "UK" : {
            _parameter call Spec_fnc_loadout_uk;
        };
        case "BW_TROPEN" : {
            _parameter call Spec_fnc_loadout_bw_tropentarn;
        };
        case "BW_FLECK" : {
            _parameter call Spec_fnc_loadout_bw_flecktarn;
        };
        default {
            _parameter call Spec_fnc_loadout_nato;
        };
    };
};
