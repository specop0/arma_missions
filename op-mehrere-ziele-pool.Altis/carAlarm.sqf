if(isNil "repaired") then {
	repaired = false;
};
if(hasInterface) then {
	private _carAlarm1 = [] spawn {
		while {!isNil "offroad" && !repaired} do {
			playSound3D ["A3\Sounds_F\sfx\alarmCar.wss", offroad, false, getPosASL offroad, 0.3, 1, 100]; sleep 10;
		};
	};
	_carAlarm2 = [] spawn {
		while {!isNil "truck" && !repaired} do {
			playSound3D ["A3\Sounds_F\sfx\alarmCar.wss", truck, false, getPosASL truck, 0.3, 1, 100]; sleep 8;
		};
	};
};