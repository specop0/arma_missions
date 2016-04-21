/*
	Author: SpecOp0

	Description:
	Initializes for a unit variables needed for setting TFAR frequencies
	and set names for BFT system.
	Variables are chosen based on variable "Spec_var_TFARgroup".
	
	Example in init-field add: this setVariable ["Spec_var_TFARgroup",0];
	
	Parameter(s):
	0: OBJECT - unit/player which variables need to be initialized

	Returns:
	true
*/
private _parameterCorrect = params [["_unitName",objNull,[objNull]]];

if(_parameterCorrect) then {
	private _groupID = _unitName getVariable ["Spec_var_TFARgroup", 0];
	private ["_swFreq", "_lrFreq", "_callsign", "_BFTicon", "_BFTremarks"];
	_BFTicon = "b_inf";
	_BFTremarks = name _unitName;
	
	switch _groupID do {
		case 0 : {
			_swFreq = ["100"];
			_lrFreq = ["30","31","32","41","43","52","60","61","62"];
			_callsign = "Yellow";
			_BFTicon = "b_hq";
		};
		case 1 : {
			_swFreq = ["111","110","112","113"];
			_lrFreq = ["31","30"];
			_callsign = "Green";
		};
		case 2 : {
			_swFreq = ["112","110","111","113"];
			_lrFreq = ["31","30"];
			_callsign = "Black";
		};
		case 3 : {
			_swFreq = ["113","110","111","112"];
			_lrFreq = ["31","30"];
			_callsign = "Blue";
		};
		case 4 : {
			_swFreq = ["121","120","122","123"];
			_lrFreq = ["32","30"];
			_callsign = "Brown";
		};
		case 5 : {
			_swFreq = ["122","120","121","123"];
			_lrFreq = ["32","30"];
			_callsign = "Red";
		};
		case 6 : {
			_swFreq = ["123","120","121","122"];
			_lrFreq = ["32","30"];
			_callsign = "Purple";
		};
		case 7 : {
			_swFreq = ["141","140"];
			_lrFreq = ["41","30","31","32","43","52","62"];
			_callsign = "White";
			_BFTicon = "b_med";
		};
		case 8 : {
			_swFreq = ["143","140"];
			_lrFreq = ["43","30","31","32","52","62"];
			_callsign = "Silver";
			_BFTicon = "b_service";
		};
		case 9 : {
			_swFreq = ["152","150","151"];
			_lrFreq = ["52","30","31","32","51","62"];
			_callsign = "Gray";
		};
		case 10 : {
			_swFreq = ["160"];
			_lrFreq = ["60","30","31","32","61","62"];
			_callsign = "Reaper";
			_BFTicon = "b_plane";			
		};
		case 11 : {
			_swFreq = ["161"];
			_lrFreq = ["61","30","31","32","52"];
			_callsign = "Eagle";
			_BFTicon = "b_recon";
		};
		case 12 : {
			_swFreq = ["162","150","151"];
			_lrFreq = ["62","60","30"];
			_callsign = "Snake";
		};
		default {
			_swFreq = ["100"];
			_lrFreq = ["30"];
			_callsign = "Default";
		};
	};
	// set frequency variables
	_unitName setVariable ["Spec_var_swFreq", _swFreq];
	_unitName setVariable ["Spec_var_lrFreq", _lrFreq];

	// BFT Settings
	_unitName setGroupIdGlobal [_callsign];
	_unitName setVariable ["BG_BFT_groupId", _callsign, true];
	_unitName setVariable ["BG_BFT_icon", _BFTicon, true]; 
	_unitName setVariable ["BG_BFT_remarks", _BFTremarks, true];
	if(count _swFreq > 0) then {
		_unitName setVariable ["BG_BFT_radioSR", (_swFreq select 0), true];
	};
	if(count _lrFreq > 0) then {
		_unitName setVariable ["BG_BFT_radioLR", (_lrFreq select 0), true];
	};
	
};
true
