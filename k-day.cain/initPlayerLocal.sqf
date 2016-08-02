[teleporter] call FETT_fnc_W_addTeleport;
teleporter addAction ["Zuschauermodus", {
    params ["_target","_caller"];
    _caller setPosASL (getPosASL spectator_cam_helper);
    [_caller, true] remoteExecCall ["hideObjectGlobal", 2];
    ["Initialize", [_caller, [], true]] call BIS_fnc_EGSpectator;
}];

// bunker porter
private _actionTeleport = ["bunkerTeleporterAction", "Betrete Bunker", "", {
    params ["_target","_caller"];
    private _scriptHandle = [_caller] spawn {
        params ["_player"];
        titleText ["Betrete Bunker...","BLACK OUT",2];
        sleep 2;
        _player setPosASL getPosASL bunkerporter_target1;
        sleep 2;
        titleText ["... man sieht wieder Sonnenlicht!","BLACK",0.000001];
        sleep 4;
        _player setPosASL getPosASL bunkerporter_target2;
        titleText ["","BLACK IN",2];
    };
}, {true}] call ace_interact_menu_fnc_createAction;
{
    [_x,0,["ACE_MainActions"],_actionTeleport] call ace_interact_menu_fnc_addActionToObject;
} forEach [bunkerporter1, bunkerporter2, bunkerporter3];

// hint for pilots that new flight is needed
private _radioPilotAction = ["radioPilotAction", "Funke Piloten an", "", {
    {
        if(typeOf _x == "B_Pilot_F") then {
            "Hier HQ:\nNeue Truppen sind vom Flugfeld in das Kampfgebiet zu verbringen." remoteExecCall ["hint",_x];
        };
    } forEach allPlayers;
    hint "Piloten sind unterwegs.";
}, {true}] call ace_interact_menu_fnc_createAction;
[radio_pilot,0,["ACE_MainActions"],_radioPilotAction] call ace_interact_menu_fnc_addActionToObject;

// radio and radio documents
private _radioTargetAction = ["radioTargetAction", "Zerstöre Funkggerät und nehme Codes", "", {
    params ["_target","_caller"];
    deleteVehicle _target;
    hint "Dechiffrierschlüssel genommen und Funkgerät zerstört.";
}, {true}] call ace_interact_menu_fnc_createAction;
if(!isNil "radio_documents") then {
    [radio_documents,0,["ACE_MainActions"],_radioTargetAction] call ace_interact_menu_fnc_addActionToObject;
    removeAllActions radio_documents;
};

// tank depot charge
private _depotExplodeAction = ["depotExplodeAction", "Stelle Zeitzünder", "", {
    hint "Zeitzünder auf 30 Sekunden gestellt.";
    private _scriptHandle = [] spawn {
        sleep 25;
        for "_i" from 0 to 4 do {
            hintSilent format ["%1", 5 - _i];
            sleep 1;
        };
        hintSilent "Zündung!";
        missionNamespace getVariable ["target2_charge", objNull] setDamage 1;
    };
}, {true}] call ace_interact_menu_fnc_createAction;
if(!isNil "target2_crate") then {
    [target2_crate,0,["ACE_MainActions"],_depotExplodeAction] call ace_interact_menu_fnc_addActionToObject;
};

// air raid alarm
private _airraidAction = ["airraidAction", "Melde Fliegeralarm!", "", {
    params ["_target","_caller"];
    missionNamespace setVariable ["airraidTriggered", true, true];
    hint "Alarm ausgelöst!";
    [_target, "fliegeralarm"] remoteExecCall ["say3D"];
}, {
    !(missionNamespace getVariable ["airraidTriggered", false])
}] call ace_interact_menu_fnc_createAction;
if(!isNil "airraid_tower") then {
    [airraid_tower,0,["ACE_MainActions"],_airraidAction] call ace_interact_menu_fnc_addActionToObject;
};

// initial music
playMusic "aufKreta";

// looped radio music (say3D local -> local start if nearby but no network traffic)
private _scriptHandle = [] spawn {
    while {true} do {
        {
            _x say3D "sovjetMusic";
        } forEach [radio1,radio2,radio3,radio4,radio5];
        sleep 1263;
    };
};