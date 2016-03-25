// Behaviour Careless not Working
private _parameterCorrect = params [ ["_leader",objNull,[objNull]] ];

if(_parameterCorrect && {local _leader}) then {
	params ["", ["_disableAI",true,[true]] ];
	if(_disableAI) then {
		{
			_x disableAI "AUTOCOMBAT";
			_x disableAI "AUTOTARGET";
			_x disableAI "FSM";
			_x disableAI "TARGET";
		} forEach units (group _leader);
	} else {
		{
			_x enableAI "AUTOCOMBAT";
			_x enableAI "AUTOTARGET";
			_x enableAI "FSM";
			_x enableAI "TARGET";
		} forEach units (group _leader);
	};
};