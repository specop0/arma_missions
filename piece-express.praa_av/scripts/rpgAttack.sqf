params [ ["_unit", objNull,[objNull]], ["_targetPos",[0,0,0],[[0]]] ];

private _nearestCars = nearestObjects [_targetPos, ["Car","Tank"], 150];
private _target = selectRandom _nearestCars;

_unit reveal _target;
_unit doTarget _target;
_unit fire "CUP_launch_RPG7V";

private _scriptHandle = [_unit] spawn {
    params ["_unit"];
    sleep 10;
    _unit fire "CUP_launch_RPG7V";
    sleep 5;
    _unit setUnitPos "AUTO";
};

