{
    [_x] call FETT_fnc_W_addTeleport; 
} forEach [flagA, flagB];

if(typeof player in ["B_Helipilot_F", "B_soldier_repair_F"]) then {
    [player] call Spec_cargoDrop_fnc_addPackAction;
};

dockBottom addAction ["Nach Oben", {
    player setPosASL getPosASL dockTopHelper;
    player setDir direction dockTopHelper;
}, [], 1.5, true, true, "", "true", 2];
dockTop addAction ["Nach Unten", {
    player setPosASL getPosASL dockBottomHelper;
    player setDir direction dockBottomHelper;
}, [], 1.5, true, true, "", "true", 2];

radioA setVariable ["helper", radioAhelper];
radioB setVariable ["helper", radioBhelper];
{
    _x addAction ["Radio an/aus", {
        params ["_target", "_caller"];
        private _helper = _target getVariable ["helper", objNull];
        if((getPosASL _helper) isEqualTo [0,0,0]) then {
            _helper setPosASL (getPosASL _target);
            hint "Radio an";
        } else {
            _helper setPosASL [0,0,0];
            hint "Radio aus";
        };
    }, [], 1.5, true, true, "", "true", 2];
} forEach [radioA, radioB];