[teleporter] call FETT_fnc_W_addTeleport;
if(!isNil "opl1") then {
	if(player == opl1) then {
		Spec_fnc_cleanup = compile preprocessFileLineNumbers "cleanup.sqf";
		spawner addAction ["Cleanup Iraklia", Spec_fnc_cleanup, [player,"cleanup_1",2000],-1];
		spawner addAction ["Cleanup Flugplatz", Spec_fnc_cleanup, [player,"cleanup_2",3000],-2];
		spawner addAction ["Cleanup Edessa", Spec_fnc_cleanup, [player,"cleanup_3",4000],-3];
		spawner addAction ["Cleanup Solar", Spec_fnc_cleanup, [player,"cleanup_4",1500],-4];
	};
};
if(!isNil "opl2") then {
	if(player == opl2) then {
		Spec_fnc_cleanup = compile preprocessFileLineNumbers "cleanup.sqf";
		spawner addAction ["Cleanup Iraklia", Spec_fnc_cleanup, [player,"cleanup_1",2000],-1];
		spawner addAction ["Cleanup Flugplatz", Spec_fnc_cleanup, [player,"cleanup_2",3000],-2];
		spawner addAction ["Cleanup Edessa", Spec_fnc_cleanup, [player,"cleanup_3",4000],-3];
		spawner addAction ["Cleanup Solar", Spec_fnc_cleanup, [player,"cleanup_4",1500],-4];
	};
};