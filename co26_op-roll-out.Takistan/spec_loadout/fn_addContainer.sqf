private _parameterCorrect = params [["_unit",objNull,[objNull]],["_containerClassname","",["string"]],["_containerNumber",0,[0]]];
private _returnValue = false;

if(_parameterCorrect) then {
	_returnValue = true;
	switch (_containerNumber) do {
		case 0 : {
			private _uniformName = uniform _unit;
			if(_containerClassname == _uniformName && _containerClassname != "") then {
				private _uniform = uniformContainer _unit;
				clearItemCargoGlobal _uniform;
				clearMagazineCargoGlobal _uniform;
				clearWeaponCargoGlobal _uniform;
			} else {
				removeUniform _unit;
				_unit forceAddUniform _containerClassname;
			};	
		};
		case 1 : {
			private _vestName = vest _unit;
			if(_containerClassname == _vestName && _containerClassname != "") then {
				private _vest = vestContainer _unit;
				clearItemCargoGlobal _vest;
				clearMagazineCargoGlobal _vest;
				clearWeaponCargoGlobal _vest;
			} else {
				removeVest _unit;
				_unit addVest _containerClassname;
			};	
		};
		case 2 : {
			private _backpackName = backpack _unit;
			if(_containerClassname == _backpackName && _containerClassname != "") then {
				private _backpack = backpackContainer _unit;
				clearItemCargoGlobal _backpack;
				clearMagazineCargoGlobal _backpack;
				clearWeaponCargoGlobal _backpack;
			} else {
				removeBackpackGlobal _unit;
				_unit addBackpack _containerClassname;
			};	
		};
		default {
			_returnValue = false;
		};
	};
};
_returnValue
