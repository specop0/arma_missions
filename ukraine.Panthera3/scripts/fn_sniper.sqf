params ["_sniper", "_target"];
private _previousTarget = _sniper getVariable ["target",objNull];
private _time = _sniper getVariable ["time", (time - 181)];
if (isNull _previousTarget || !alive _previousTarget || _previousTarget getVariable ["ACE_isUnconscious",true] || _time < (time - 180)) then {
    _sniper setVariable ["target", _target];
    _sniper reveal [_target, 4];
    _sniper doTarget _target;
    _sniper doFire _target;
};