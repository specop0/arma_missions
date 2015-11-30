local _parameterCorrect = params [["_unit",objNull],["_item",objNull],["_container",3,[0]]];
local _returnValue = 0;

if(_parameterCorrect) then {
	params ["","","", ["_numberOfItems",1,[0]] ];
	local _itemsAdded = 0;
	switch (_container) do {
		case 0 : {
			while {_itemsAdded < _numberOfItems} do {
				if(_unit canAddItemToUniform _item) then {
					_unit addItemToUniform _item;
					_itemsAdded = _itemsAdded + 1;
				} else {
					hint format ["Could not add %1 to Uniform\nUnit Type = %2\nUnit Name = %3\n%4/%5 items added", _item, typeOf _unit, str _unit, _itemsAdded, _numberOfItems];
					_returnValue = 1;
					_itemsAdded = _numberOfItems;
				};
			};
		};
		case 1 : {
			while {_itemsAdded < _numberOfItems} do {
				if(_unit canAddItemToVest _item) then {
					_unit addItemToVest _item;
					_itemsAdded = _itemsAdded + 1;
				} else {
					hint format ["Could not add %1 to Vest\nUnit Type = %2\nUnit Name = %3\n%4/%5 items added", _item, typeOf _unit, str _unit, _itemsAdded, _numberOfItems];
					_returnValue = 1;
					_itemsAdded = _numberOfItems;
				};
			};
		};
		case 2 : {
			while {_itemsAdded < _numberOfItems} do {
				if(_unit canAddItemToBackpack _item) then {
					_unit addItemToBackpack _item;
					_itemsAdded = _itemsAdded + 1;
				} else {
					hint format ["Could not add %1 to Backpack\nUnit Type = %2\nUnit Name = %3\n%4/%5 items added", _item, typeOf _unit, str _unit, _itemsAdded, _numberOfItems];
					_returnValue = 1;
					_itemsAdded = _numberOfItems;
				};
			};
		};
		default {
			while {_itemsAdded < _numberOfItems} do {
				if(_unit canAddItemToUniform _item) then {
					_unit addItemToUniform _item;
					_itemsAdded = _itemsAdded + 1;
				} else {
					if(_unit canAddItemToVest _item) then {
						_unit addItemToVest _item;
						_itemsAdded = _itemsAdded + 1;
					} else {
						if(_unit canAddItemToBackpack _item) then {
							_unit addItemToBackpack _item;
							_itemsAdded = _itemsAdded + 1;
						} else {
							hint format ["Could not add %1 to any Container\nUnit Type = %2\nUnit Name = %3\n%4/%5 items added", _item, typeOf _unit, str _unit, _itemsAdded, _numberOfItems];
							_returnValue = 1;
							_itemsAdded = _numberOfItems;
						};
					};
				};
			};
		};
	};
};
_returnValue
