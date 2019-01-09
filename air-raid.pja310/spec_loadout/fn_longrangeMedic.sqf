#include "addItemToContainer.hpp"

private _parameterCorrect = params [ ["_unit",objNull,[objNull]], ["_backpackLR","",[""]] ];

if(_parameterCorrect) then {
    removeBackpackGlobal _unit;
    _unit addBackpackGlobal _backpackLR;
    clearItemCargoGlobal (unitBackpack _unit);
    clearMagazineCargoGlobal (unitBackpack _unit);
    [_unit,"ItemAndroid",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_fieldDressing",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_elasticBandage",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_quikclot",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_packingBandage",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_tourniquet",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_salineIV",ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_atropine",ADD_TO_BACKPACK, 5] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_epinephrine",ADD_TO_BACKPACK, 8] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_morphine",ADD_TO_BACKPACK, 8] call Spec_fnc_addItemToContainer;
    [_unit,"ACE_personalAidKit",ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
    //[_unit,"ACE_surgicalKit",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
};
true
