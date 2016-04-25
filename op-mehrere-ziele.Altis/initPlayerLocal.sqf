[teleporter] call FETT_fnc_W_addTeleport;
if(!isNil "opl1") then {
    if(player == opl1) then {
        Spec_fnc_cleanup = compile preprocessFileLineNumbers "cleanup.sqf";
        spawner addAction ["Cleanup Iraklia", Spec_fnc_cleanup, [player,"cleanup_1",2000],-6];
        spawner addAction ["Cleanup Flugplatz", Spec_fnc_cleanup, [player,"cleanup_2",3000],-7];
        spawner addAction ["Cleanup Edessa", Spec_fnc_cleanup, [player,"cleanup_3",4000],-8];
        spawner addAction ["Cleanup Solar", Spec_fnc_cleanup, [player,"cleanup_4",1500],-9];
    };
};
if(!isNil "opl2") then {
    if(player == opl2) then {
        Spec_fnc_cleanup = compile preprocessFileLineNumbers "cleanup.sqf";
        spawner addAction ["Cleanup Iraklia", Spec_fnc_cleanup, [player,"cleanup_1",2000],-6];
        spawner addAction ["Cleanup Flugplatz", Spec_fnc_cleanup, [player,"cleanup_2",3000],-7];
        spawner addAction ["Cleanup Edessa", Spec_fnc_cleanup, [player,"cleanup_3",4000],-8];
        spawner addAction ["Cleanup Solar", Spec_fnc_cleanup, [player,"cleanup_4",1500],-9];
    };
};
