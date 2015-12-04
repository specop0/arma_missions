/*
	Author: SpecOp0

	Description:
	Assigns a loadout to a given unit.
	
	Parameter(s):
	0: OBJECT - unit to assign loadout to

	Returns:
	true
*/

waitUntil {!isNull player || isServer};
private _parameterCorrect = params [["_unit",objNull,[objNull]]];
private _type = "";
if !(_unit isKindOf "Man") then {
	_parameterCorrect = params [ "", ["_caller", objNull,[objNull]] ];
	if(_parameterCorrect) then {
		_unit = _caller;
	};
	if ((_this select 3) isEqualTypeAny ["",[]]) then {
		private _addActionParameterCorrect = (_this select 3) params [ ["_typeAddActionArg","",["STRING"]] ];
		if(_addActionParameterCorrect) then {
			_type = _typeAddActionArg;
		};
	};
};

private _uniform = "U_B_CombatUniform_mcam";
private _vest = "V_PlateCarrier2_rgr";

private _backpack = "B_AssaultPack_mcamo";
private _backpackBig = "B_Carryall_mcamo";
private _backpackLR = "tf_rt1523g_big";

private _headgear = "H_HelmetSpecB_paint1";
private _headgearPilot = "H_PilotHelmetHeli_B";
private _googles = "G_Combat";

private _standardWeapon = "arifle_MX_F";
private _standardAmmo = "30Rnd_65x39_caseless_mag";
private _standardAccessory = ["acc_pointer_IR","optic_Hamr"];
private _standardAccessoryExtra = ["optic_Aco"];

private _grenadeLauncherWeapon = "arifle_MX_GL_F";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

private _secondaryWeapon = "hgun_Pistol_heavy_01_F";
private _secondaryAmmo = "11Rnd_45ACP_Mag";
private _secondaryAccessory = [];

comment "Officer";
private _oplClass = "B_officer_F"; 
comment "Squad Leader";
private _funkerClass = "B_Soldier_SL_F";
comment "Combat Life Saver";
private _medicClass = "B_medic_F";

comment "Team Leader";
private _tfClass = "B_Soldier_TL_F";
comment "Grenadier";
private _glClass = "B_Soldier_GL_F";

comment "Autorifleman";
private _mgClass = "B_soldier_AR_F";
private _mgWeapon = "LMG_Zafir_F";
private _mgAmmo = "150Rnd_762x54_Box_Tracer";
private _mgAccessory = _standardAccessory;
private _mgAccessoryExtra = _standardAccessoryExtra;
comment "Ammo Bearer";
private _mgAssiClass = "B_Soldier_A_F";

comment "Helicopter Crew";
private _lmgClass = "B_helicrew_F";
private _lmgWeapon = "arifle_MX_SW_F";
private _lmgAmmo = "100Rnd_65x39_caseless_mag_Tracer";
private _lmgAccessory = _standardAccessory;
private _lmgAccessoryExtra = _standardAccessoryExtra;

comment "Rifleman (AT)";
private _atClass = "B_soldier_LAT_F";
private _atWeapon = "launch_NLAW_F";
private _atAmmo = "NLAW_F";

comment "Engineer";
private _pioClass = "B_engineer_F";
comment "Repair Specialist";
private _logisticClass = "B_soldier_repair_F";
comment "Rifleman (Light)";
private _medevacClass = "B_Soldier_lite_F";
comment "Helicopter Pilot";
private _pilotClass = "B_Helipilot_F";

comment "classes to use: B_Soldier_F (Rifleman), B_pilotClass_F (Pilot), B_helicrew_F (Helicopter Crew)";

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
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		
		comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
		[_unit, _uniform] call Spec_fnc_addContainer;
		[_unit, _vest] call Spec_fnc_addContainer;
		if(_type == _oplClass || _type == _funkerClass || _type == _logisticClass || _type == _pilotClass) then {
			[_unit, _backpackLR] call Spec_fnc_addContainer;
			if(backpack _unit == "") then {
				[_unit, _backpack] call Spec_fnc_addContainer;
			};
		} else {
			if(_type == _medevacClass || _type == _pioClass) then {
				[_unit, _backpackBig] call Spec_fnc_addContainer;
			} else {
				[_unit, _backpack] call Spec_fnc_addContainer;
			};
		};
		if(_type == _pilotClass) then {
			_unit addHeadgear _headgearPilot;
		} else {
			_unit addHeadgear _headgear;
		};
		_unit addGoggles _googles;
		
		comment "Loadout based on TTT-Mod (weapons near end of file)";
		if(_type == _pioClass) then {
			comment "MineDetector has to be equipped BEFORE any ACE Item to be functional";
			[_unit, "MineDetector", 2] call Spec_fnc_addItemToContainer;
		};
		
		if(_type == _oplClass || _type == _tfClass) then {
			_unit addWeapon "ACE_Vector";
		} else {
			if(_type == _atClass || _type == _mgAssiClass || _type == _glClass) then{
				_unit addWeapon "ACE_Yardage450";
			} else {
				_unit addWeapon "Binocular";
			};
		};
		
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "tf_anprc152";
		
		comment "lead equipment (tablet, etc)";
		if(_type == _oplClass || _type == _tfClass || _type == _funkerClass || _type == _logisticClass || _type == _medevacClass || _type == _pilotClass) then {
			_unit addItemToUniform "ACE_microDAGR";
			if(_type == _oplClass) then {
				[_unit,"ACE_DK10_b",2] call Spec_fnc_addItemToContainer;
			} else {
				[_unit,"ACE_GD300_b",2] call Spec_fnc_addItemToContainer;
			};
		};
		if(_type == _oplClass || _type == _tfClass || _type == _logisticClass || _type == _pilotClass) then {
			//[_unit,"ACE_HelmetCam",0] call Spec_fnc_addItemToContainer;
		};
		if(_type == _oplClass || _type == _tfClass || _type == _funkerClass) then {
			[_unit,"ACE_CableTie",1, 3] call Spec_fnc_addItemToContainer;
		};
		
		comment "standard equipment (ear plugs, grenades)";
		[_unit,"ACE_EarPlugs",0] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_MapTools",0] call Spec_fnc_addItemToContainer;
		
		[_unit,"ACE_IR_Strobe_Item",0,2] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_HandFlare_Green",0,2] call Spec_fnc_addItemToContainer;

		[_unit,"SmokeShell",0,2] call Spec_fnc_addItemToContainer;
		[_unit,"SmokeShellGreen",0, 2] call Spec_fnc_addItemToContainer;
		[_unit,"SmokeShellPurple",0] call Spec_fnc_addItemToContainer;
		
		comment "night equipment";
		[_unit,"ACE_Flashlight_MX991",0] call Spec_fnc_addItemToContainer;
		[_unit,"ACE_NVG_Wide",1] call Spec_fnc_addItemToContainer;
		
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
				_unit setVariable ["ace_medical_medicClass", 2];
			};
			default {
				[_unit,"ACE_fieldDressing",2, 7] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_tourniquet",2, 2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",2, 1] call Spec_fnc_addItemToContainer;
			};
		};
		
		comment "role specific special equipment";
		switch _type do {
			case _tfClass : {
				[_unit,"1Rnd_Smoke_Grenade_shell",2, 6] call Spec_fnc_addItemToContainer;
				[_unit,"1Rnd_SmokeRed_Grenade_shell",2, 6] call Spec_fnc_addItemToContainer;
			};
			case _glClass : {
				[_unit,"1Rnd_HE_Grenade_shell",2, 12] call Spec_fnc_addItemToContainer;
			};
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
		};
		
		comment "===========================================";
		comment "==============  Weapons  ==================";
		comment "===========================================";
		
		if(_type == _mgClass) then {
			[_unit,_mgAmmo,1, 2] call Spec_fnc_addItemToContainer;
			[_unit,_mgAmmo,2] call Spec_fnc_addItemToContainer;
			_unit addWeapon _mgWeapon;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _mgAccessory;
			{
				[_unit,_x,3] call Spec_fnc_addItemToContainer;
			} forEach _mgAccessoryExtra;	
		} else {
			if(_type == _lmgClass) then {
				[_unit,_lmgAmmo,1] call Spec_fnc_addItemToContainer;
				[_unit,_lmgAmmo,2, 3] call Spec_fnc_addItemToContainer;
				
				_unit addWeapon _lmgWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _lmgAccessory;
				{
					[_unit,_x,3] call Spec_fnc_addItemToContainer;
				} forEach _lmgAccessoryExtra;				
			} else {
				comment "grenade launcher";
				if(_type == _tfClass || _type == _glClass) then {
					[_unit,_grenadeLauncherAmmo,2, 6] call Spec_fnc_addItemToContainer;
					
					_unit addWeapon _grenadeLauncherWeapon;
					{
						_unit addPrimaryWeaponItem _x;
					} forEach _grenadeLauncherAccessory;
					{
						[_unit,_x,3] call Spec_fnc_addItemToContainer;
					} forEach _grenadeLauncherAccessoryExtra;
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
		};
		comment "secondary weapon";
		[_unit,_secondaryAmmo,1, 3] call Spec_fnc_addItemToContainer;
		_unit addWeapon _secondaryWeapon;
		{
			_unit addSecondaryWeaponItem _x;
		} forEach _secondaryAccessory;
	};
};
true
