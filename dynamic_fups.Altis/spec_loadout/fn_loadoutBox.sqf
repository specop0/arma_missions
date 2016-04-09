#include "addItemToContainer.hpp"

private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];
if(_parameterCorrect && hasInterface) then {
	Spec_var_loadoutFaction = "MAIN";
	if(isNil "Spec_var_loadoutFactionList") then {
		[] call Spec_fnc_initLoadoutLists;
	};

	// selection faction
	private _conditionString = "";
	private _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
	{
	    _object addAction [_x, {
				(_this select 3) params ["_factionName"];
				Spec_var_loadoutFaction = _factionName;
			}, [_x], -2, false, false, "", _conditionString];
	} forEach Spec_var_loadoutFactionList;

	// for each faction add classes
	private _i = -4;
	private _factionName = "MAIN";
	{
		_factionName = _x;
		_i = -4;
		
		_conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
		_object addACtion ["Benutze Slot",{
				params ["","_caller"];
				(_this select 3) params ["_factionName"];
				[_caller, _factionName] call Spec_fnc_loadoutFaction;
				Spec_var_loadoutFaction = "MAIN";
			}, [_factionName], _i, false, true, "", _conditionString];
		// for each class addAction
		{
			_object addAction [(_x select 0), {
					params ["","_caller"];
					(_this select 3) params ["_type","_factionName"];
					[ [_caller, _type], _factionName] call Spec_fnc_loadoutFaction;
					Spec_var_loadoutFaction = "MAIN";
				}, [_x select 1,_factionName], _i, false, true, "", _conditionString];
			_i = _i - 1;
		} forEach Spec_var_loadoutClassList;
	} forEach Spec_var_loadoutFactionList;
	private _minimumActionIndex = _i;
	
	// add scopes
	/*_factionName = "SCOPES";
	_conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
	_object addAction [_factionName, {
		(_this select 3) params ["_factionName"];
		Spec_var_loadoutFaction = _factionName;
	}, [_factionName], -2, false, false, "", _conditionString];
	private _scopes = ["optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg",
		"optic_Hamr","optic_Arco","optic_MRCO",
		"optic_Holosight","optic_Holosight_smg","rhsusf_acc_eotech_552",
		"rhsusf_acc_ACOG","rhsusf_acc_ELCAN",
		"CUP_bipod_Harris_1A2_L","CUP_bipod_VLTOR_Modpod"
	];
	_conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
	_i = -4;
	{
		_object addAction [_x, {
			params ["","_caller"];
			(_this select 3) params ["_item"];
			if !(_item in items _caller) then {
				[_caller,_item,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			};
			Spec_var_loadoutFaction = "MAIN";
		}, [_x], _i, false, true, "", _conditionString];
		_i = _i - 1;
	} forEach _scopes;
	if(_i < _minimumActionIndex) then {
		_minimumActionIndex = _i;
	};*/
	
	
	// change m4 variants
	_factionName = "M4_VARIANTS";
	_conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
	_object addAction [_factionName, {
		(_this select 3) params ["_factionName"];
		Spec_var_loadoutFaction = _factionName;
	}, [_factionName], -2, false, false, "", _conditionString];
	private _weapons = ["rhs_weap_m16a4","rhs_weap_m16a4_grip","rhs_weap_m16a4_carryhandle_M203",
		"rhs_weap_m4","rhs_weap_m4_grip","rhs_weap_m4_m320",
		"rhs_weap_m4a1","rhs_weap_m4a1_grip","rhs_weap_m4a1_m320",
		"rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle_grip","rhs_weap_m4a1_carryhandle_m203S"
	];
	_conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
	_i = -4;
	{
		_object addAction [_x, {
			params ["","_caller"];
			(_this select 3) params ["_weapon"];
			private _magazines = primaryWeaponMagazine _caller;
			private _items = primaryWeaponItems _caller;
			_caller removeWeapon primaryWeapon _caller;
			{
				[_caller,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
			} forEach _magazines;
			_caller addWeapon _weapon;
			{
				_caller addPrimaryWeaponItem _x;
			} forEach _items;
			Spec_var_loadoutFaction = "MAIN";
		}, [_x], _i, false, true, "", _conditionString];
		_i = _i - 1;
	} forEach _weapons;
	if(_i < _minimumActionIndex) then {
		_minimumActionIndex = _i;
	};
	
	// add ace action for helicopter scripts
	_factionName = "HELI_SCRIPT";
	_conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
	_object addAction [_factionName, {
		(_this select 3) params ["_factionName"];
		Spec_var_loadoutFaction = _factionName;
	}, [_factionName], -2, false, false, "", _conditionString];
	_conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
	_object addAction ["MedEvac/Weiss",{
		params ["_target","_caller"];
		private _actionMedevac = ["Spec_action_callMedevac", "Rufe Weiss", "", {_this remoteExec ["Spec_fnc_heli_medevac",2]}, {true}] call ace_interact_menu_fnc_createAction;
		[_caller,1, ["ACE_SelfActions"], _actionMedevac] call ace_interact_menu_fnc_addActionToObject;
		
		Spec_var_loadoutFaction = "MAIN";
	}, [], -4, false, true, "", _conditionString];
	_object addAction ["Logistik/Bussard",{
		params ["_target","_caller"];
		private _actionBussard = ["Spec_action_callBussard", "Rufe Bussard", "", {_this remoteExec ["Spec_fnc_heli_taxi",2]}, {true}] call ace_interact_menu_fnc_createAction;
		[_caller,1, ["ACE_SelfActions"], _actionBussard] call ace_interact_menu_fnc_addActionToObject;
		
		if !(_caller getVariable ["hasClickEvent",false]) then {
			[] call Spec_fnc_moveMarkerLZ;
			_caller setVariable ["hasClickEvent",true];
		} else {
			_action = ["Spec_action_moveMarkerLZ", "Bewege LZ", "", {(_this select 0) setVariable ["Spec_var_selectLZ", true]}, {true}] call ace_interact_menu_fnc_createAction;
		[_caller,1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
		};
		
		Spec_var_loadoutFaction = "MAIN";
	}, [], -5, false, true, "", _conditionString];
	_object addAction ["Entferne Actions",{
		params ["_target","_caller"];
		[_caller,1,["ACE_SelfActions", "Spec_action_moveMarkerLZ"]] call ace_interact_menu_fnc_removeActionFromObject; 
		[_caller,1,["ACE_SelfActions", "Spec_action_callMedevac"]] call ace_interact_menu_fnc_removeActionFromObject; 
		[_caller,1,["ACE_SelfActions", "Spec_action_callBussard"]] call ace_interact_menu_fnc_removeActionFromObject; 
		
		Spec_var_loadoutFaction = "MAIN";
	}, [], -6, false, true, "", _conditionString];
	
	// add items to cargo (launcher / weapon only)
	_factionName = "ADD_CARGO";
	_conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
	_object addAction [_factionName, {
		(_this select 3) params ["_factionName"];
		Spec_var_loadoutFaction = _factionName;
	}, [_factionName], -2, false, false, "", _conditionString];
	private _cargoItems = [
		"rhs_weap_M136","UK3CB_BAF_AT4_CS_AP_Launcher",
		"BWA3_Pzf3",
		"rhs_weap_rpg7",
		"launch_NLAW_F","rhs_weap_smaw","BWA3_RGW90","CUP_launch_Mk153Mod0",
		"CUP_launch_Javelin","rhs_weap_fgm148",
		"launch_I_Titan_short_F",
		"CUP_launch_FIM92Stinger","BWA3_Fliegerfaust","launch_B_Titan_F"
	];
	_conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
	_i = -4;
	{
		_object addAction [_x, {
			params ["_target"];
			(_this select 3) params ["_cargoItem"];
			_target addWeaponCargoGlobal [_cargoItem,2];
			// add magazines
			_magazines = getArray (configFile >> "CfgWeapons" >> _cargoItem >> "Magazines");
			{
				_target addMagazineCargoGlobal [_x,3];
			} forEach _magazines;
			Spec_var_loadoutFaction = "MAIN";
		}, [_x], _i, false, true, "", _conditionString];
		_i = _i - 1;
	} forEach _cargoItems;
	if(_i < _minimumActionIndex) then {
		_minimumActionIndex = _i;
	};
	
	// clear cargo of loadoutBox
	_i = _minimumActionIndex - 1;
	_object addAction ["Leere Box", {
		params ["_target","_caller"];
		clearBackpackCargoGlobal _target;
		clearItemCargoGlobal _target;
		clearMagazineCargoGlobal _target;
		clearWeaponCargoGlobal _target;
	}, nil, _i, false, true, "", "Spec_var_loadoutFaction isEqualTo ""MAIN"";"];
	clearBackpackCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearWeaponCargoGlobal _object;
	
	_object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_var_loadoutFaction = "MAIN";}, nil, -2, false, false, "", "!(Spec_var_loadoutFaction isEqualTo ""MAIN"")"];
	_object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_var_loadoutFaction = "MAIN";}, nil, _i, false, false, "", "!(Spec_var_loadoutFaction isEqualTo ""MAIN"")"];
};
