params ["_thisTrigger", "_upOnTriggerNumber", "_rpgSoldiers"];

[_thisTrigger, _upOnTriggerNumber] call compile preprocessFileLineNumbers "scripts\upOnTrigger.sqf";
{
    [_x, getPosASL _thisTrigger] call compile preprocessFileLineNumbers "scripts\rpgAttack.sqf"; 
} forEach _rpgSoldiers;