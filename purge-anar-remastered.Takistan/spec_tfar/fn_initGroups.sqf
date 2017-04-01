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
            _swFreq = ["100.0"];
            _lrFreq = ["30.0","31.0","32.0","41.0","42.0","43.0","51.0","52.0"];
            _callsign = "Gelb";
        };
        case 1 : {
            _swFreq = ["111.0","110.0","112.0","113.0"];
            _lrFreq = ["31.0","30.0"];
            _callsign = "Gruen";
        };
        case 2 : {
            _swFreq = ["112.0","110.0","111.0","113.0"];
            _lrFreq = ["31.0","30.0"];
            _callsign = "Schwarz";
        };
        case 3 : {
            _swFreq = ["113.0","110.0","111.0","112.0"];
            _lrFreq = ["31.0","30.0"];
            _callsign = "Blau";
        };
        case 4 : {
            _swFreq = ["121.0","120.0","122.0","123.0"];
            _lrFreq = ["32.0","30.0"];
            _callsign = "Braun";
        };
        case 5 : {
            _swFreq = ["122.0","120.0","121.0","123.0"];
            _lrFreq = ["32.0","30.0"];
            _callsign = "Rot";
        };
        case 6 : {
            _swFreq = ["123.0","120.0","121.0","122.0"];
            _lrFreq = ["32.0","30.0"];
            _callsign = "Violett";
        };
        case 7 : {
            _swFreq = ["141.0","140.0"];
            _lrFreq = ["41.0","30.0","31.0","32.0","42.0","43.0","51.0","52.0"];
            _callsign = "Weiss";
            _BFTicon = "b_air";
        };
        case 8 : {
            _swFreq = ["143.0","140.0"];
            _lrFreq = ["43.0","30.0","31.0","32.0","41.0","42.0","51.0","52.0"];
            _callsign = "Bussard";
            _BFTicon = "b_air";
        };
        case 9 : {
            _swFreq = [];
            _lrFreq = ["50.0","30.0"];
            _callsign = "Zeus";
        };
        default {
            _swFreq = ["100.0"];
            _lrFreq = ["30.0"];
            _callsign = "Default";
        };
    };
    // set frequency variables
    _unitName setVariable ["Spec_var_swFreq", _swFreq];
    _unitName setVariable ["Spec_var_lrFreq", _lrFreq];

    // BFT Settings
    (group _unitName) setGroupIdGlobal [_callsign];
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
