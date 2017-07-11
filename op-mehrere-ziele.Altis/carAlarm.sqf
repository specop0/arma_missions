if(isServer) then {
    private _carAlarm1 = [] spawn {
        while {!isNil "offroad" && !(missionNamespace getVariable ["repaired", false])} do {
            playSound3D ["A3\Sounds_F\sfx\alarmCar.wss", offroad, false, getPosASL offroad, 0.3, 1, 100];
            sleep 10;
        };
    };
    _carAlarm2 = [] spawn {
        while {!isNil "truck" && !(missionNamespace getVariable ["repaired", false])} do {
            playSound3D ["A3\Sounds_F\sfx\alarmCar.wss", truck, false, getPosASL truck, 0.3, 1, 100];
            sleep 8;
        };
    };
};