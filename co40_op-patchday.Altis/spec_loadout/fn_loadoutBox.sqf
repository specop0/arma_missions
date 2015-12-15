private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];
if(_parameterCorrect && hasInterface) then {
	Spec_var_loadoutFaction = "MAIN";
	if(isNil "Spec_var_loadoutFactionList") then {
		[] call Spec_fnc_initLoadoutLists;
	};

	// selection faction
	private _conditionString = "";
	private _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
	{
	    _object addAction [_x, {
				(_this select 3) params ["_factionName"];
				Spec_var_loadoutFaction = _factionName;
			}, [_x], -2, false, false, "", _conditionString];
	} forEach Spec_var_loadoutFactionList;

	// for each faction add classes
	private _i = -4;
	private _factionName = "MAIN";
	{
		_factionName = _x;
		_i = -4;
		
		_conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
		_object addACtion ["Benutze Slot",{
				params ["","_caller"];
				(_this select 3) params ["_factionName"];
				[player, _factionName] call Spec_fnc_loadoutFaction;
				Spec_var_loadoutFaction = "MAIN";
			}, [_factionName], _i, false, true, "", _conditionString];
		// for each class addAction
		{
			_object addAction [(_x select 0), {
					params ["","_caller"];
					(_this select 3) params ["_type","_factionName"];
					[ [_caller, _type], _factionName] call Spec_fnc_loadoutFaction;
					Spec_var_loadoutFaction = "MAIN";
				}, [_x select 1,_factionName], _i, false, true, "", _conditionString];
			_i = _i - 1;
		} forEach Spec_var_loadoutClassList;
	} forEach Spec_var_loadoutFactionList;

	_object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_var_loadoutFaction = "MAIN";}, nil, -2, false, false, "", "!(Spec_var_loadoutFaction isEqualTo ""MAIN"")"];
	_object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_var_loadoutFaction = "MAIN";}, nil, _i, false, false, "", "!(Spec_var_loadoutFaction isEqualTo ""MAIN"")"];
};
