#include "addItemToContainer.hpp"

private _parameterCorrect = params [ ["_unit",objNull,[objNull]] ];

if(_parameterCorrect) then {
	removeBackpackGlobal _unit;
	_unit addBackpackGlobal "TTT_Backpack_Funkerfac_Us_Woodland";
	clearItemCargoGlobal (unitBackpack _unit);
	clearMagazineCargoGlobal (unitBackpack _unit);
	[_unit,"ACE_DK10_b",ADD_TO_BACKPACK] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_fieldDressing",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_elasticBandage",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_quikclot",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_packingBandage",ADD_TO_BACKPACK, 15] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_tourniquet",ADD_TO_BACKPACK, 2] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_salineIV",ADD_TO_BACKPACK, 6] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_atropine",ADD_TO_BACKPACK, 5] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_epinephrine",ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_morphine",ADD_TO_BACKPACK, 12] call Spec_fnc_addItemToContainer;
	[_unit,"ACE_personalAidKit",ADD_ANYWHERE, 3] call Spec_fnc_addItemToContainer;
	//[_unit,"ACE_surgicalKit",ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
};
true
