private _parameterCorrect = params [ ["_leader",objNull,[objNull]], ["_sideNumber",0,[0]] ];

if(isServer && _parameterCorrect) then {
	private _side = BLUFOR;
	switch (_sideNumber) do {
		case 1 : {
			_side = CIVILIAN;
		};
		case 2 : {
			_side = OPFOR;
		};
		case 3 : {
			_side = INDEPENDENT;
		};
	};
	if !(side _leader isEqualTo _side) then {
		private _group = createGroup _side;
		(units (group _leader)) joinSilent _group;
	};
};