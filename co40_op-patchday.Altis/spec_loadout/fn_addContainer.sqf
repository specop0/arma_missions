/*
	Author: SpecOp0, jokoho48

	Description:
	Wrapper to add a container to a unit (Uniform, Vest or Backpack).
	If the unit already has the container the content is cleared to avoid
	locality problems: http://feedback.arma3.com/view.php?id=19829
	Otherwise the container is removed and the new one is added.

	Parameter(s):
	0: OBJECT - unit to add a container
	1: STRING - classname of container

	Returns:
	BOOL - true if container was added (or cleared) successful
*/

private _parameterCorrect = params [ ["_unit",objNull,[objNull]], ["_containerClassname","",["STRING"]], ["_containerNumber",-1,[0]] ];
private _returnValue = false;

if !(isNull _unit || _containerClassname isEqualTo "") then {
	private _cfg = (configFile >> "CfgWeapons");
	if (_containerClassname isKindOf ["Uniform_Base", _cfg]) then {
		_containerNumber = 0;
		
	};
	if (_containerClassname isKindOf ["Vest_NoCamo_Base", _cfg] || _containerClassname isKindOf ["Vest_Camo_Base", _cfg]) then {
		_containerNumber = 1;
	};
	if (_containerClassname isKindOf "Bag_Base") then {
		_containerNumber = 2;
	};
	_returnValue = true;
	switch (_containerNumber) do {
		case 0 : {
			_uniformName = uniform _unit;
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
			_vestName = vest _unit;
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
				_backpack = backpackContainer _unit;
				clearItemCargoGlobal _backpack;
				clearMagazineCargoGlobal _backpack;
				clearWeaponCargoGlobal _backpack;
			} else {
				removeBackpackGlobal _unit;
				_unit addBackpackGlobal _containerClassname;
			};
		};
		default {
			_returnValue = false;
		};
	};
};
_returnValue
