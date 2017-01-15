// let special forces mount bus
private _contact = contact;
_contact addAction ["Wir uebernehmen. Steigt in den Bus", {
    params ["_target","_caller"];
    [0,{
        params ["_contact","_caller"];
        private _busArray = nearestObjects [_contact, ["CUP_C_Ikarus_TKC"], 400];
        if(count _busArray >= 1) then {
            "Alles klar, ich gebe meinen Jungs Bescheid." remoteExecCall ["hint", _caller];
            private _bus = _busArray select 0;
            {
                if(_x getVariable ["specialForce", false]) then {
                    _x assignAsCargo _bus;
                    [_x,1] remoteExecCall ["forceSpeed", _x];
                    [[_x], true] remoteExecCall ["orderGetIn", _x];
                    [_x,false] remoteExecCall ["setCaptive", _x];
                };
            } forEach allUnits;
        } else {
            "Wo ist der Bus? Ich kann ihn nicht finden" remoteExecCall ["hint",_caller];
        };
    }, [_target,_caller]] call CBA_fnc_globalExecute;
}, [], 1.5, false, true, "vehicle _target == _target", "true", 2];

// add medical tent
{
    [_x] call JK_fnc_addTent;
} forEach [truckA, truckB];

// only player who "canDriveTruck" can drive the wisent or bus
/*
player addEventHandler ["GetInMan", {
    params ["_unit", "_position", "_vehicle", "_turret"];
    if(typeOf _vehicle in ["CUP_C_Ikarus_TKC", "rsr_wisent_covered_tropentarn"]) then {
        if(_unit getVariable ["canDriveTruck", false]) then {
            [_vehicle, _vehicle getVariable ["lastFuel", 1]] remoteExecCall ["setFuel", _vehicle];
        } else {
            _vehicle setVariable ["lastFuel", fuel _vehicle, true];
            [_vehicle, 0] remoteExecCall ["setFuel", _vehicle];
        };
    };
}];
*/

// add teleporter and spectator cam
[teleporter] call FETT_fnc_W_addTeleport;
teleporter addAction ["Zuschauermodus", {
    params ["_target","_caller"];
    ["Initialize", [_caller, [], true]] call BIS_fnc_EGSpectator;
    [_caller,true] remoteExecCall ["hideObjectGlobal", 2];
},[],0.5,false,true,"","",5];

// remove corpse if respawned in base
player addEventHandler ["Respawn",{
    params ["","_corpse"];
    if((getPosASL player) distance (getMarkerPos "respawn") < 1000) then {
        deleteVehicle _corpse;
    };
}];