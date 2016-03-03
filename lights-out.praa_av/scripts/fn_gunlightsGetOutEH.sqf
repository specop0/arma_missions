if(isServer) then {
	params [ ["_vehicle",objNull,[objNull]] ];
	_vehicle addEventHandler ["GetOut", {_this select 2 enableGunLights "forceOn";} ];
};