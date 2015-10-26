local _parameterCorrect = params [["_unitName",objNull,[objNull]]];
local _arrayTypeName = "ARRAY";

if(_parameterCorrect) then {
	local _swFreq = ["100","101","102","103"];
	if(call TFAR_fnc_haveSWRadio) then {
		_swFreq resize (count _swFreq min 8);
		local _swRadio = call TFAR_fnc_activeSwRadio;
		{
			[_swRadio, (_forEachIndex + 1), _x] call TFAR_fnc_SetChannelFrequency;
		} foreach _swFreq;
	};
};
