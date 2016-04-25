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
            _lrFreq = ["30","31","32"];
            _callsign = "Olga";
        };
        case 1 : {
            _swFreq = ["111","110","112","113"];
            _lrFreq = ["31","30"];
            _callsign = "Dmitri";
        };
        case 2 : {
            _swFreq = ["112","110","111","113"];
            _lrFreq = ["31","30"];
            _callsign = "Boris";
        };
        case 3 : {
            _swFreq = ["113","110","111","112"];
            _lrFreq = ["31","30"];
            _callsign = "Yuri";
        };
        case 4 : {
            _swFreq = ["120","110","100"];
            _lrFreq = ["32","30","31"];
            _callsign = "Tatyana";
        };
        case 5 : {
            _swFreq = ["157","100"];
            _lrFreq = ["33","30","31","32"];
            _callsign = "HQ";
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
