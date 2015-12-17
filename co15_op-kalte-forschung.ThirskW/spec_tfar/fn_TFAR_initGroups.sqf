private _parameterCorrect = params [["_unitName",objNull,[objNull]]];

if(_parameterCorrect) then {
	private _groupID = _unitName getVariable ["Spec_var_TFARgroup", 0];
	private ["_swFreq", "_lrFreq", "_callsign", "_BFTicon", "_BFTremarks"];
	_BFTicon = "b_inf";
	_lrFreq = [];
	_BFTremarks = name _unitName;
	
	switch _groupID do {
		case 0 : {
			_swFreq = ["101","100","102","103"];
			_callsign = "Alpha";
		};
		case 1 : {
			_swFreq = ["102","100","101","103"];
			_callsign = "Bravo";
		};
		case 2 : {
			_swFreq = ["103","100","101","102"];
			_callsign = "Charlie";
		};
		default {
			_swFreq = ["101","100","102","103"];
			_callsign = "Default";
		};
	};
	// set frequency variables
	_unitName setVariable ["Spec_var_swFreq", _swFreq];
	_unitName setVariable ["Spec_var_lrFreq", _lrFreq];

	// BFT Settings
	_unitName setGroupID [_callsign];
	_unitName setVariable ["BG_BFT_groupId", _callsign, true];
	_unitName setVariable ["BG_BFT_icon", _BFTicon, true]; 
	if(count _swFreq > 0) then {
		_unitName setVariable ["BG_BFT_radioSR", (_swFreq select 0), true];
	};
	if(count _lrFreq > 0) then {
		_unitName setVariable ["BG_BFT_radioLR", (_lrFreq select 0), true];
	};
	
};
true
