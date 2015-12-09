waitUntil {!isNull player || isServer};
private _parameterCorrect = params [["_unit",objNull,[objNull]]];

private _uniform = "TFA_white";
private _vest = "TFA_PlateCarrier_WTE";

private _backpack = "TFA_assault_wte";

private _headgear = "TFA_H_HelmetIA_wte";
private _googles = "G_Balaclava_combat";

private _standardWeapon = "rhs_weap_m4_grip";
private _standardAmmo = "30Rnd_556x45_Stanag";
private _standardAccessory = ["rhsusf_acc_nt4_black","acc_pointer_IR","rhsusf_acc_ACOG"];
private _standardAccessoryExtra = ["rhsusf_acc_eotech_552"];

private _grenadeLauncherWeapon = "rhs_weap_m4_m320";
private _grenadeLauncherAmmo = _standardAmmo;
private _grenadeLauncherAccessory = _standardAccessory;
private _grenadeLauncherAccessoryExtra = _standardAccessoryExtra;

private _secondaryWeapon = "BWA3_P8";
private _secondaryAmmo = "BWA3_15Rnd_9x19_P8";
private _secondaryAccessory = [];

comment "Team Leader";
private _tfClass = "B_Soldier_TL_F";
comment "Grenadier";
private _glClass = "B_Soldier_GL_F";
comment "Combat Life Saver";
private _medicClass = "B_medic_F";

comment "Autorifleman";
private _mgClass = "B_soldier_AR_F";
private _mgWeapon = "BWA3_mg5";
private _mgAmmo = "BWA3_120Rnd_762x51";
private _mgAccessory = ["BWA3_muzzle_snds_G28","acc_pointer_IR","optic_MRCO"];
private _mgAccessoryExtra = ["BWA3_optic_EOTech"];
comment "Ammo Bearer";
private _mgAssiClass = "B_Soldier_A_F";

comment "Helicopter Crew";
private _lmgClass = "B_Soldier_lite_F";
private _lmgWeapon = "BWA3_MG4";
private _lmgAmmo = "BWA3_200Rnd_556x45_Tracer";
private _lmgAccessory = ["BWA3_muzzle_snds_G36","acc_pointer_IR","optic_MRCO"];
private _lmgAccessoryExtra = ["BWA3_optic_EOTech"];

comment "Rifleman (AT)";
private _atClass = "B_soldier_LAT_F";
private _atWeapon = "BWA3_Pzf3";
private _atAmmo = "BWA3_Pzf3_IT";

comment "Engineer";
private _pioClass = "B_engineer_F";

private _sniperClass = "B_Soldier_F";
private _sniperWeapon = "rhs_weap_sr25";
private _sniperAmmo = "rhsusf_20Rnd_762x51_m118_special_Mag";
private _sniperAccessory = ["rhsusf_acc_SR25S","acc_pointer_IR","optic_LRPS","rhsusf_acc_harris_bipod"];
private _sniperAccessoryExtra = ["rhsusf_acc_eotech_552"];
private _sniperHelpClass = "B_Helipilot_F";

if(_parameterCorrect) then {
	if(side _unit == west) then {
		private _type = typeOf _unit;
		
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		
		comment "Vest, Uniform, Backpack, Headgear (, Googgles)";
		_unit forceAddUniform _uniform;
		_unit addVest _vest;
		if(_type == _medicClass || _type == _pioClass) then {
			_unit addBackpack _backpack;
		};
		
		_unit addHeadgear _headgear;
		_unit addGoggles _googles;
		
		comment "Loadout based on TTT-Mod (weapons near end of file)";
		if(_type == _tfClass) then {
			_unit addWeapon "ACE_Vector";
		} else {
			if(_type == _atClass || _type == _mgAssiClass || _type == _glClass || _type == _sniperHelpClass) then{
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
		if(_type == _tfClass) then {
			[_unit,"ACE_DK10_b",3] call Spec_fnc_addItemToContainer;
			[_unit,"ACE_CableTie",1, 3] call Spec_fnc_addItemToContainer;
			
			Spec_fnc_ammoBox = compile preprocessFileLineNumbers "scripts\ammoBox.sqf";
			_unit addAction ["Fordere Nachschub an", Spec_fnc_ammoBox, [], -100, false, true, "", "_target == _this"];
			Spec_fnc_canCallAmmoBox = {
				params ["_target","_caller"];
				_target == _caller
			};
			_action = ["Spec_ammoBox_bla", "Fordere Nachschub an", "",
				Spec_fnc_ammoBox,
				true
			] call ace_interact_menu_fnc_createAction;
			// https://github.com/acemod/ACE3/issues/1232
			[_unit,1,["ACE_SelfActions", "Fordere Nachsch"], _action] call ace_interact_menu_fnc_addActionToObject;
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
				[_unit,"ACE_salineIV_500",2, 6] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_salineIV",2, 4] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_atropine",2, 5] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_epinephrine",2, 8] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",2, 8] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_surgicalKit",2, 3] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ace_medical_medicClass", 1];
			};
			default {
				[_unit,"ACE_fieldDressing",1, 7] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_tourniquet",1, 2] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_morphine",1, 1] call Spec_fnc_addItemToContainer;
			};
		};
		
		comment "role specific special equipment";
		switch _type do {
			case _tfClass : {
				[_unit,"1Rnd_Smoke_Grenade_shell",1, 6] call Spec_fnc_addItemToContainer;
				[_unit,"1Rnd_SmokeRed_Grenade_shell",1, 6] call Spec_fnc_addItemToContainer;
			};
			case _glClass : {
				[_unit,"1Rnd_HE_Grenade_shell",1, 12] call Spec_fnc_addItemToContainer;
			};
			case _pioClass : {
				[_unit,"DemoCharge_Remote_Mag",2, 5] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_Clacker",3] call Spec_fnc_addItemToContainer;
				[_unit,"ACE_DefusalKit",3] call Spec_fnc_addItemToContainer;
				_unit setVariable ["ACE_IsEngineer", 2];
			};
			case _mgAssiClass : {
				[_unit,_mgAmmo,3, 2] call Spec_fnc_addItemToContainer;
			};
			case _sniperHelpClass : {
				[_unit,_sniperAmmo,1, 5] call Spec_fnc_addItemToContainer;
			};
		};
		
		comment "===========================================";
		comment "==============  Weapons  ==================";
		comment "===========================================";
		
		if(_type == _mgClass) then {
			[_unit,_mgAmmo,1, 3] call Spec_fnc_addItemToContainer;
			_unit addWeapon _mgWeapon;
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _mgAccessory;
			{
				[_unit,_x,3] call Spec_fnc_addItemToContainer;
			} forEach _mgAccessoryExtra;	
		} else {
			if(_type == _lmgClass) then {
				[_unit,_lmgAmmo,1, 3] call Spec_fnc_addItemToContainer;
				_unit addWeapon _lmgWeapon;
				{
					_unit addPrimaryWeaponItem _x;
				} forEach _lmgAccessory;
				{
					[_unit,_x,3] call Spec_fnc_addItemToContainer;
				} forEach _lmgAccessoryExtra;
				[_unit,_lmgAmmo,1, 1] call Spec_fnc_addItemToContainer;
			} else {
				if(_type == _sniperClass) then {
					[_unit,_sniperAmmo,1, 11] call Spec_fnc_addItemToContainer;
					_unit addWeapon _sniperWeapon;
					{
						_unit addPrimaryWeaponItem _x;
					} forEach _sniperAccessory;
					{
						[_unit,_x,3] call Spec_fnc_addItemToContainer;
					} forEach _sniperAccessoryExtra;
				} else {
					comment "grenade launcher";
					if(_type == _tfClass || _type == _glClass) then {
						[_unit,_grenadeLauncherAmmo,1, 10] call Spec_fnc_addItemToContainer;
						
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
							_unit addBackpack _backpack;
							_unit addItemToBackpack _atAmmo;
							_unit addWeapon _atWeapon;
							removeBackpack _unit;
						};
						comment "standard weapon";
						[_unit,_standardAmmo,1, 10] call Spec_fnc_addItemToContainer;

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
		};
		comment "secondary weapon";
		[_unit,_secondaryAmmo,3, 3] call Spec_fnc_addItemToContainer;
		_unit addWeapon _secondaryWeapon;
		{
			_unit addSecondaryWeaponItem _x;
		} forEach _secondaryAccessory;
	};
};
