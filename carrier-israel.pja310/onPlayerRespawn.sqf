private _posASL = getPosASL player;
// test if we respawned in the water, then set the player at the correct position
if((_posASL select 2) <= 0.5) then {
    player setPosASL [560.58,18560.4,3.1];
    player setDir 212;
};