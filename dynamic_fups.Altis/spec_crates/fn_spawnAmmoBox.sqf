/*
    Author: SpecOp0

    Description:
    Ammunition Parachute Box.
    Spawns a Ammunition Box in the air and adds a parachute.
    The Ammunition Box will land safely if it is stuck in a tree.
    
    For use in a addAction entry, most parameter are hardcoded.
    
    
    Parameter(s):
    0: -
    1: OBJECT - player who wants to spawn the object (i.e. a player who chooses the menu entry)

    Returns:
    true
*/

private _script = _this spawn {

private _ammoBoxType = "B_supplyCrate_F";
private _parachuteType = "B_Parachute_02_F";
private _spawnedAmmoBoxHeight = 500;

private _hintAmmoBoxSpawned = "Die Nachschubkiste wurde ueber Ihnen abgeworfen.\nPassen Sie auf, dass der Feind diese nicht entdeckt!";
private _hintAmmoBoxAbovePlayer = "Eine Nachschubkiste ist bereits auf dem Weg. Gucken Sie nach oben in die Luft oder warten Sie ein Augenblick und rufen sie eine Weitere.";

private _parameterCorrect = params ["",["_caller",objNull]];

if(_parameterCorrect) then {
    comment "check if ammo box already spawned";
    private _spawnPosition = getPosATL _caller;
    private _spawnPositionHeight = (_spawnPosition select 2) + _spawnedAmmoBoxHeight;
    _spawnPosition set [2, _spawnPositionHeight];
    
    private _nearestAmmobox = nearestObjects [_spawnPosition,[_ammoBoxType],30];
    if(count _nearestAmmobox > 0) then {
        _hintAmmoBoxAbovePlayer remoteExec ["hint",_caller];
    } else {
    
        comment "spawn ammo box with parachute at player position";
        private _spawnedAmmoBox = createVehicle [_ammoBoxType,_spawnPosition, [],0,""];
        private _parachute =  createVehicle [_parachuteType,_spawnPosition, [], 0, "NONE"];
        _spawnedAmmoBox attachTo [_parachute, [0,0,1]];
               
        comment "set ammo content here";
        clearBackpackCargoGlobal _spawnedAmmoBox;
        clearItemCargoGlobal _spawnedAmmoBox;
        clearMagazineCargoGlobal _spawnedAmmoBox;
        clearWeaponCargoGlobal _spawnedAmmoBox;
        [_spawnedAmmoBox] remoteExec ["Spec_crates_fnc_addAmmoBoxActions"];
        
        comment "end of ammo content";
        _hintAmmoBoxSpawned remoteExec ["hint",_caller];
        
        comment "add box to allCurators";
        [objNull,_spawnedAmmoBox] remoteExec ["Spec_zeus_fnc_objectPlaced",2];
        
        comment "land ammo box safely (if stuck in tree)";
        private  _spawnedAmmoBoxOldPos = getPosATL _spawnedAmmoBox;
        sleep 60;
        private  _spawnedAmmoBoxCurPos = getPosATL _spawnedAmmoBox;
        waitUntil{
            _spawnedAmmoBoxCurPos = getPosATL _spawnedAmmoBox;
            sleep 5;
            if (isNull _parachute) then {
                true
            } else {
                if (_spawnedAmmoBoxOldPos distance _spawnedAmmoBoxCurPos < 2) then {
                    detach _spawnedAmmoBox;
                    deleteVehicle _parachute;
                    true
                } else {
                    _spawnedAmmoBoxOldPos = _spawnedAmmoBoxCurPos;
                    false
                };
            };
        };
    };
} else {
    hint "Script Error: Calling player is Null";
};

};
true
