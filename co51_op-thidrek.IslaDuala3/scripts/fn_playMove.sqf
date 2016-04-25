params [ ["_unit",objNull,[objNull]] ];
if(!isNull _unit && {local _unit}) then {
    params ["", ["_animation","Acts_carFixingWheel",[""]], ["_timeout",10,[0]] ];
    private _scriptHandle = [_unit,_animation,_timeout] spawn {
        params ["_unit","_animation","_timeout"];
        _unit forceSpeed 0;
        group _unit setBehaviour "CARELESS";
        sleep 5;
        // test if animation must be looped manually or not
        if(_animation in ["Acts_TerminalOpen"]) then {
            // switchMove effect global in JIP compatible (wiki says otherwise)
            _unit switchMove _animation;
        } else {
            while {!isNull _unit && {alive _unit}} do {
                _unit playMove _animation;
                sleep _timeout;
            };
        };
    };
};
true

// Acts_listeningToRadio_Loop    6.2s
// construction like animation
// Acts_TerminalOpen switchMove (automatic Loop)
// AinvPknlMstpSnonWnonDnon_medicUp2 5.27
// AmovPercMstpSnonWnonDnon_exerciseKata 33.4