/*
    Author: SpecOp0

    Description:
    Adds an item to the Uniform, Vest, Backpack or wherever possible.
    As an optional parameter an item could be added multiple times.
    
    If the Container is full a hint will be displayed.

    Parameter(s):
    0: OBJECT - unit to add an item
    1: STRING - item to add (class name)
    3: NUMBER - container to add item: 0 Uniform, 1 Vest, 2 Backpack, 3 wherever possible (tries uniform, then vest and then backpack) [use addItemToContainer.hpp]
    4 (Optional): NUMBER - quantity of the item (default 1)

    Returns:
    NUMBER - 0 if item(s) could be added, else 1
*/
#include "addItemToContainer.hpp"

private _parameterCorrect = params [["_unit",objNull],["_item",objNull],["_container",3,[0]]];
private _returnValue = 0;

if(_parameterCorrect) then {
    params ["","","", ["_numberOfItems",1,[0]] ];
    private _itemsAdded = 0;
    switch (_container) do {
        case ADD_TO_UNIFORM : {
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
        case ADD_TO_VEST : {
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
        case ADD_TO_BACKPACK : {
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
        // ADD_ANYWHERE
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
