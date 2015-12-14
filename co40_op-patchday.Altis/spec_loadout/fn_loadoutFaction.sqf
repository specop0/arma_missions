private _parameterCorrect = params ["_parameter", ["_faction","NATO",[""]] ];

if(_parameterCorrect) then {
    switch (_faction) do {
        case "NATO" : {
            _parameter call Spec_fnc_loadout;
        };
        case "AAF" : {
            _parameter call Spec_fnc_loadout_aaf;
        };
        case "CSAT" : {
            _parameter call Spec_fnc_loadout_csat;
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
            _parameter call Spec_fnc_loadout;
        };
    };
};
