{
    [_x] call FETT_fnc_W_addTeleport; 
} forEach [flagA, flagB];

dockBottom addAction ["Nach Oben", {
    player setPosASL getPosASL dockTopHelper;
    player setDir direction dockTopHelper;
}, [], 1.5, true, true, "", "true", 2];
dockTop addAction ["Nach Unten", {
    player setPosASL getPosASL dockBottomHelper;
    player setDir direction dockBottomHelper;
}, [], 1.5, true, true, "", "true", 2];