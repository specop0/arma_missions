params ["_thisTrigger","_mine"];

[_thisTrigger, 0, true] call compile preprocessFileLineNumbers "scripts\upOnTrigger.sqf";
_mine setDamage 1;