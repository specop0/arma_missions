/*
	Author: SpecOp0

	Description:
	Assigns a loadout to a given unit.
	The type of loadout is determined with the classname.
	
	Can be used as an addAction entry as well.
	
	Parameter(s):
	0: OBJECT - unit to assign loadout to
	1 (Optional) : STRING - classname which represents loadout type (default: classname of unit)
	
	Alternativ Usage:
	0: -
	1: OBJECT - unit which choose addAction entry
	2: -
	3 (Optional): STRING - classname which represents loadout type (default: classname of unit)

	Returns:
	true
*/

waitUntil {!isNull player || isServer};
private _unit = objNull;
private _type = "";
private _parameterCorrect = false;
// test if addAction was used (caller _this select 3 is present)
if(_this isEqualType [] && {count _this > 3}) then {
	_parameterCorrect = params [ "", ["_caller", objNull,[objNull]] ];
	_unit = _caller;
	_type = typeOf _unit;
	// test if addAction arguments were used
	if (count _this > 3 && {(_this select 3) isEqualTypeAny ["",[]]}) then {
		private _addActionParameterCorrect = (_this select 3) params [ ["_typeAddActionArg","",["STRING"]] ];
		if(_addActionParameterCorrect) then {
			_type = _typeAddActionArg;
		};
	};
} else {
	_parameterCorrect = params [["_unitArg",objNull,[objNull]]];
	_unit = _unitArg;
	_type = typeOf _unit;
	// test if type argument present (_this select 1)
	if(_this isEqualType [] && {count _this > 1}) then {
		private _typeParameterCorrect = params ["", ["_typeArg","",[""]] ];
		if(_typeArg != "") then {
			_type = _typeArg;
		};
	};
};

private _uniform = "LOP_U_TKA_Fatigue_02";
private _vest = "LOP_V_6Sh92_OLV";

private _backpack = "B_AssaultPack_rgr";
private _backpackBig = "B_Carryall_oli";
private _backpackLR = "tf_bussole";

private _headgear = "LOP_H_SSh68Helmet_OLV";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _googles = "";

private _standardWeapon = "rhs_weap_akms";
private _standardAmmo = "rhs_30Rnd_762x39mm_tracer";
private _standardAccessory = ["rhs_acc_2dpZenit"];
private _standardAccessoryExtra = [];

private _secondaryWeapon = "rhs_weap_makarov_pmm";
private _secondaryAmmo = "rhs_mag_9x18_12_57N181S";
private _secondaryAccessory = [];

comment "Officer";
private _oplClass = "B_officer_F"; 
comment "Squad Leader";
private _funkerClass = "B_Soldier_SL_F";
comment "Combat Life Saver";
private _medicClass = "B_medic_F";

comment "Team Leader";
private _tfClass = "B_Soldier_TL_F";
comment "Grenadier"; // no GL - chemlights instead
private _glClass = "B_Soldier_GL_F";

comment "Autorifleman";
private _mgClass = "B_soldier_AR_F";
private _mgWeapon = "rhs_weap_pkm";
private _mgAmmo = "rhs_100Rnd_762x54mmR_green";
private _mgAccessory = [];
private _mgAccessoryExtra = [];
comment "Ammo Bearer";
private _mgAssiClass = "B_Soldier_A_F";

comment "Rifleman (AT)";
private _atClass = "B_soldier_LAT_F";
private _atWeapon = "rhs_weap_rpg26";

comment "Engineer";
private _pioClass = "B_engineer_F";
comment "Repair Specialist";
private _logisticClass = "B_soldier_repair_F";
comment "Rifleman (Light)";
private _medevacClass = "B_Soldier_lite_F";
comment "Helicopter Pilot";
private _pilotClass = "B_Helipilot_F";

comment "classes to use: B_Soldier_F (Rifleman), B_pilotClass_F (Pilot), B_helicrew_F (Helicopter Crew)";

// NVG classes
private _usLead = "B_G_Soldier_TL_F";
private _usFunk = "B_G_Soldier_SL_F";
private _usPio = "B_G_engineer_F";
private _usMedic = "B_G_medic_F";
private _usAt ="B_G_Soldier_LAT_F";

private _usSpotterUAV = "B_G_Soldier_M_F";
private _usSpotterLead = "B_G_officer_F";
private _usPilot = "B_G_Soldier_GL_F";

private _usUniform = "UK3CB_BAF_U_CrewmanCoveralls_RTR";
private _usVest = "V_PlateCarrier1_blk";

private _usBackpack = "B_AssaultPack_blk";
private _usLongRange = "tf_rt1523g_black";

private _usHeadgear = "BWA3_OpsCore_Schwarz_Camera";
private _usHeadgearPilot = "rhsusf_hgu56p_mask";

private _usStandardWeapon = "rhs_weap_m4_grip";
private _usStandardAmmo = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
private _usStandardAccessory = ["rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552"];
private _usStandardAccessoryExtra = [];

private _usSecondaryWeapon = "rhsusf_weap_m1911a1";
private _usSecondaryAmmo = "rhsusf_mag_7x45acp_MHP";
private _usSecondaryAccessory = [];

if(_parameterCorrect) then {
	if(side _unit == west) then {
		if(_type == "") then {
			_type = typeOf _unit;
		};	
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpackGlobal _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		
		private _nvgEquipment = false;
		if(_type in [_usLead, _usFunk, _usPio, _usSpotterUAV, _usSpotterLead, _usPilot, _usMedic, _usAt]) then {
			_nvgEquipment = true;
		};
		
		comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
		if(_nvgEquipment) then {
			_unit forceAddUniform _usUniform;
			_unit addVest _usVest;
			if(_type in [_usPilot, _usFunk, _usSpotterLead]) then {
				_unit addBackpack _usLongRange;
			} else {
				if(_type == _usSpotterUAV) then {
					_unit addBackpack "B_UAV_01_backpack_F";
					_unit linkItem "B_UavTerminal";
				} else {
					_unit addBackpack _usBackpack;
				};
			};
			if(_type == _usPilot) then {
				_unit addHeadgear _usHeadgearPilot;
			} else {
				_unit addHeadgear _usHeadgear;
				_unit addGoggles "G_Goggles_VR";
			};
			if(_type in [_usSpotterUAV, _usSpotterLead, _usFunk]) then {
				_unit addWeapon "Laserdesignator";
				_unit addMagazine "Laserbatteries";
			} else {
				_unit addWeapon "Rangefinder";
			};
		} else {
			_unit forceAddUniform _uniform;
			switch _type do {
				case _oplClass : {
					_vest = "LOP_V_6Sh92_Radio_OLV";
				};
				case _tfClass : {
					_vest = "LOP_V_6Sh92_Radio_OLV";
				};
				case _mgClass : {
					_vest = "LOP_V_6Sh92_Vog_OLV";
				};
			};
			_unit addVest _vest;
			if(_type in [_oplClass, _funkerClass, _logisticClass, _pilotClass]) then {
				_unit addBackpack _backpackLR;
			} else {
				if(_type in [_medevacClass, _pioClass]) then {
					_unit addBackpack _backpackBig;
				} else {
					if(_type in [_mgClass, _mgAssiClass, _medicClass]) then {
						_unit addBackpack _backpack;
					};
				};
			};
			if(_type == _pilotClass) then {
				_unit addHeadgear _headgearPilot;
			} else {
				_unit addHeadgear _headgear;
			};
			
			comment "Loadout based on TTT-Mod (weapons near end of file)";
			if(_type in [_oplClass, _tfClass, _funkerClass]) then {
				_unit addWeapon "ACE_Vector";
			} else {
				if(_type in [_atClass, _mgAssiClass, _glClass]) then{
					_unit addWeapon "ACE_Yardage450";
				} else {
					_unit addWeapon "Binocular";
				};
			};
		};
		
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		
		comment "lead equipment (tablet, etc)";
		if(_type in [_oplClass, _tfClass, _funkerClass, _logisticClass, _medevacClass, _pilotClass]) then {
			_unit addItemToUniform "ACE_microDAGR";
			if(_type in [_medevacClass, _funkerClass]) then {
				[_unit,"ACE_GD300_b",1] call Spec_fnc_addItemToContainer;
			} else {
				[_unit,"ACE_DK10_b",1] call Spec_fnc_addItemToContainer;
			};
		};
		if(_type in [_oplClass, _tfClass, _logisticClass, _pilotClass]) then {
			//[_unit,"ACE_HelmetCam",0] call Spec_fnc_addItemToContainer;
		};
		if(_type in [_oplClass, _tfClass, _funkerClass]) then {
			[_unit,"ACE_CableTie",1, 3] call Spec_fnc_addItemToContainer;
		};
		
		comment "standard equipment (ear plugs, grenades)";
		[_unit,"ACE_EarPlugs",0] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_MapTools",0] call Spec_fnc_addItemToContainer;
		
		[_unit,"ACE_IR_Strobe_Item",0] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_HandFlare_Green",0,2] call Spec_fnc_addItemToContainer;

		[_unit,"SmokeShell",0,2] call Spec_fnc_addItemToContainer;
		[_unit,"SmokeShellGreen",3, 2] call Spec_fnc_addItemToContainer;
		[_unit,"SmokeShellPurple",3] call Spec_fnc_addItemToContainer;
		
		comment "night equipment";
		[_unit,"ACE_Flashlight_MX991",3] call Spec_fnc_addItemToContainer;
		if(_nvgEquipment) then {
			_unit linkItem "ACE_NVG_Gen1";
		};
		
		[_unit,"ACE_M84",1, 2] call Spec_fnc_addItemToContainer;

		comment "medic equipment";
		switch _type do {
			case _medicClass : {
				[_unit,"ACE_fieldDressing",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_elasticBandage",2, 15] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_quikclot",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_packingBandage",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_tourniquet",2, 3] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_salineIV_500",2, 4] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_atropine",2, 5] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_epinephrine",2, 8] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",2, 8] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_surgicalKit",2, 3] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ace_medical_medicClass", 1];
			};
			case _medevacClass : {
				[_unit,"ACE_fieldDressing",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_elasticBandage",2, 15] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_quikclot",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_packingBandage",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_tourniquet",2, 2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_salineIV",2, 6] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_atropine",2, 8] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_epinephrine",2, 12] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",2, 12] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_surgicalKit",2, 5] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_personalAidKit",2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_personalAidKit",2, 3] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ace_medical_medicClass", 2];
			};
			case _usMedic : {
				[_unit,"ACE_elasticBandage",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_packingBandage",2, 10] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_tourniquet",2, 3] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_salineIV_500",2, 4] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_epinephrine",2, 4] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",2, 4] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_surgicalKit",2, 2] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ace_medical_medicClass", 1];
			};
			default {
				[_unit,"ACE_elasticBandage",1, 7] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_packingBandage",1, 5] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_tourniquet",1, 2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",1, 1] call Spec_fnc_addItemToContainer;;
			};
		};
		
		comment "role specific special equipment";
		switch _type do {
			case _pioClass : {
				[_unit,"ToolKit",2] call Spec_fnc_addItemToContainer;
				[_unit,"DemoCharge_Remote_Mag",2, 2] call Spec_fnc_addItemToContainer;
				[_unit,"SLAMDirectionalMine_Wire_Mag",2, 2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_M26_Clacker",3] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_Clacker",3] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_DefusalKit",3] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ACE_IsEngineer", 2];
			};
			case _logisticClass : {
				[_unit,"ToolKit",2] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ACE_IsEngineer", 2];
			};
			case _mgClass : {
				[_unit,"ACE_SpareBarrel",2] call Spec_fnc_addItemToContainer;
			};
			case _mgAssiClass : {
				[_unit,_mgAmmo,2, 2] call Spec_fnc_addItemToContainer;
			};
			case _glClass : {
				[_unit,"ACE_HandFlare_Yellow",1, 4] call Spec_fnc_addItemToContainer;
			};
			case _funkerClass : {
				[_unit,"ACE_HandFlare_Yellow",2, 4] call Spec_fnc_addItemToContainer;
			};
			case _usPio : {
				[_unit,"DemoCharge_Remote_Mag",2, 3] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_M26_Clacker",2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_DefusalKit",2] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ACE_IsEngineer", 2];
			};
			case _usSpotterUAV : {
				[_unit, "ACE_UAVBattery", 1] call Spec_fnc_addItemToContainer;
			};
			case _usSpotterLead : {
				[_unit,"ACE_HuntIR_monitor",2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_HuntIR_M203",2, 6] call Spec_fnc_addItemToContainer;
			};
		};
		
		comment "===========================================";
		comment "==============  Weapons  ==================";
		comment "===========================================";
		
		if(_type == _mgClass) then {
			[_unit,_mgAmmo,2, 2] call Spec_fnc_addItemToContainer;
			_unit addWeapon _mgWeapon;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _mgAccessory;
			{
				[_unit,_x,3] call Spec_fnc_addItemToContainer;
			} forEach _mgAccessoryExtra;
		} else {
			if(_nvgEquipment) then {
				[_unit,_usStandardAmmo,1, 6] call Spec_fnc_addItemToContainer;
				_unit addWeapon _usStandardWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _usStandardAccessory;
				{
					[_unit,_x,3] call Spec_fnc_addItemToContainer;
				} forEach _usStandardAccessoryExtra;
				if(_type == _usAt) then {
					_unit addWeapon _atWeapon;
				};
			} else {
				comment "AT launcher";
				if(_type == _atClass) then {
					_unit addWeapon _atWeapon;
				};
				comment "standard weapon";
				[_unit,_standardAmmo,1, 6] call Spec_fnc_addItemToContainer;
				_unit addWeapon _standardWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _standardAccessory;
				{
					[_unit,_x,3] call Spec_fnc_addItemToContainer;
				} forEach _standardAccessoryExtra;
			};
		};
		comment "secondary weapon";
		if(_nvgEquipment) then {
			[_unit,_usSecondaryAmmo,3, 2] call Spec_fnc_addItemToContainer;
			_unit addWeapon _usSecondaryWeapon;
			{
				_unit addSecondaryWeaponItem _x;
			} forEach _usSecondaryAccessory;
		} else {
			[_unit,_secondaryAmmo,3, 2] call Spec_fnc_addItemToContainer;
			_unit addWeapon _secondaryWeapon;
			{
				_unit addSecondaryWeaponItem _x;
			} forEach _secondaryAccessory;
		};
		
		[_unit,"ACE_HandFlare_Red",3,2] call Spec_fnc_addItemToContainer;
		if(_type == _usLead) then {
			[_unit,1,["ACE_SelfActions","Spec_action_changeSideCIV"]] call ace_interact_menu_fnc_removeActionFromObject;
			[_unit,1,["ACE_SelfActions","Spec_action_changeSideBLUE"]] call ace_interact_menu_fnc_removeActionFromObject;
			private _actionCIV = ["Spec_action_changeSideCIV", "Change to Civilian", "", {
				[_this select 0, 1] remoteExec ["Spec_fnc_changeSide", 2];
			}, {!(side (_this select 0) isEqualTo CIVILIAN)}] call ace_interact_menu_fnc_createAction;
			private _actionBLUE = ["Spec_action_changeSideBLUE", "Change to Blufor", "", {
				[_this select 0, 0] remoteExec ["Spec_fnc_changeSide", 2];
			}, {!(side (_this select 0) isEqualTo WEST)}] call ace_interact_menu_fnc_createAction;
			[_unit,1, ["ACE_SelfActions"], _actionCIV] call ace_interact_menu_fnc_addActionToObject;
			[_unit,1, ["ACE_SelfActions"], _actionBLUE] call ace_interact_menu_fnc_addActionToObject;
		};
	};
};
