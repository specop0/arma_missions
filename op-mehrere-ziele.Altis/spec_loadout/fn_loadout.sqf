waitUntil {!isNull player || isServer};
local _parameterCorrect = params [["_x",objNull,[objNull]]];

comment "Officer";
local _opl = "B_officer_F"; 
comment "Squad Leader";
local _funker = "B_Soldier_SL_F";
comment "Combat Life Saver";
local _medic = "B_medic_F";


comment "Team Leader";
local _tf = "B_Soldier_TL_F";
comment "Grenadier";
local _gl = "B_Soldier_GL_F";
comment "Autorifleman";
local _mg = "B_soldier_AR_F";
comment "Ammo Bearer";
local _mgAssi = "B_Soldier_A_F";
comment "Rifleman (AT)";
local _at = "B_soldier_LAT_F";
comment "Engineer";
local _pio = "B_engineer_F";

comment "Repair Specialist";
local _logistic = "B_soldier_repair_F";
comment "Rifleman (Light)";
local _medevac = "B_Soldier_lite_F";

comment "Helicopter Pilot";
local _pilot = "B_Pilot_F";

comment "Helicopter Crew";
local _lmg = "B_helicrew_F";

comment "classes to use: B_Soldier_F (Rifleman), B_Helipilot_F (Helicopter Pilot), B_helicrew_F (Helicopter Crew)";

if(_parameterCorrect) then {
	if(side _x == west) then {
		local _type = typeOf _x;
		
		removeAllWeapons _x;
		removeAllItems _x;
		removeAllAssignedItems _x;
		removeUniform _x;
		removeVest _x;
		removeBackpack _x;
		removeHeadgear _x;
		removeGoggles _x;
		
		comment "Edit Vest, Uniform, Backpack, Headgear (, Googgles)";
		_x forceAddUniform "TFA_aus_wdl";
		_x addVest "TFAx_PlateCarrier_fol";
		if(_type == _opl || _type == _funker || _type == _logistic || _type == _pilot) then {
			_x addBackpack "TFA_511_BDU";
		} else {
			if(_type == _medevac || _type == _medic) then {
				_x addBackpack "TFA_Kitbag_Grn";
			} else {
				_x addBackpack "TFAx_assault_fol";
			};
		};
		if(_type == _pilot) then {
			_x addHeadgear "H_HelmetCrew_0";
		} else {
			_x addHeadgear "TFAX_H_HelmetIA_aus";
		};
		_x addGoggles "BWA3_G_Combat_Black";
		
		comment "Loadout based on TTT-Mod (edit weapons near end of file)";
		if(_type == _pio) then {
			comment "MineDetector hast to be equipped BEFORE any ACE Item to be functional";
			[_x, "MineDetector", 2] call Spec_fnc_addItemToContainer;
		};
		
		
		if(_type == _opl || _type == _tf) then {
			_x addWeapon "ACE_Vector";
		} else {
			if(_type == _at || _type == _mgAssi || _type == _gl) then{
				_x addWeapon "ACE_Yardage450";
			} else {
				_x addWeapon "Binocular";
			};
		};
		
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "tf_anprc152";
		
		comment "lead equipment (tablet, etc)";
		if(_type == _opl || _type == _tf || _type == _funker || _type == _logistic || _type == _medevac || _type == _pilot) then {
			_x addItemToUniform "ACE_microDAGR";
			if(_type == _opl) then {
				//[_x,"ACE_DK10_b",2] call Spec_fnc_addItemToContainer;
			} else {
				//[_x,"ACE_GD300_b",2] call Spec_fnc_addItemToContainer;
			};
		};
		if(_type == _opl || _type == _tf || _type == _logistic || _type == _pilot) then {
			//[_x,"ACE_HelmetCam",0] call Spec_fnc_addItemToContainer;
		};
		if(_type == _opl || _type == _tf || _type == _funker) then {
			for "_i" from 1 to 3 do {[_x,"ACE_CableTie",1] call Spec_fnc_addItemToContainer;};
		};
		
		comment "standard equipment (ear plugs, grenades)";
		[_x,"ACE_EarPlugs",0] call Spec_fnc_addItemToContainer;
		[_x,"ACE_MapTools",0] call Spec_fnc_addItemToContainer;
		
		for "_i" from 1 to 2 do {[_x,"ACE_IR_Strobe_Item",0] call Spec_fnc_addItemToContainer;};
		for "_i" from 1 to 2 do {[_x,"ACE_HandFlare_Green",0] call Spec_fnc_addItemToContainer;};

		for "_i" from 1 to 2 do {[_x,"SmokeShell",0] call Spec_fnc_addItemToContainer;};
		for "_i" from 1 to 2 do {[_x,"SmokeShellGreen",0] call Spec_fnc_addItemToContainer;};
		[_x,"SmokeShellPurple",0] call Spec_fnc_addItemToContainer;
		
		comment "night equipment";
		[_x,"ACE_Flashlight_MX991",0] call Spec_fnc_addItemToContainer;
		[_x,"ACE_NVG_Wide",1] call Spec_fnc_addItemToContainer;
		
		for "_i" from 1 to 2 do {[_x,"ACE_M84",1] call Spec_fnc_addItemToContainer;};

		comment "medic equipment";
		switch _type do {
			case _medic : {
				for "_i" from 1 to 10 do {[_x,"ACE_fieldDressing",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 15 do {[_x,"ACE_elasticBandage",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 10 do {[_x,"ACE_quikclot",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 10 do {[_x,"ACE_packingBandage",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,"ACE_tourniquet",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 4 do {[_x,"ACE_salineIV_500",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 5 do {[_x,"ACE_atropine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 8 do {[_x,"ACE_epinephrine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 8 do {[_x,"ACE_morphine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,"ACE_surgicalKit",2] call Spec_fnc_addItemToContainer;};
				_x setVariable ["ace_medical_medicClass", 1];
			};
			case _medevac : {
				for "_i" from 1 to 10 do {[_x,"ACE_fieldDressing",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 15 do {[_x,"ACE_elasticBandage",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 10 do {[_x,"ACE_quikclot",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 10 do {[_x,"ACE_packingBandage",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,"ACE_tourniquet",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 6 do {[_x,"ACE_salineIV",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 8 do {[_x,"ACE_atropine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 12 do {[_x,"ACE_epinephrine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 12 do {[_x,"ACE_morphine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 5 do {[_x,"ACE_surgicalKit",2] call Spec_fnc_addItemToContainer;};
				[_x,"ACE_personalAidKit",2] call Spec_fnc_addItemToContainer;
				_x setVariable ["ace_medical_medicClass", 2];
			};
			default {
				for "_i" from 1 to 7 do {[_x,"ACE_fieldDressing",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,"ACE_tourniquet",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,"ACE_morphine",2] call Spec_fnc_addItemToContainer;};
			};
		};
		
		comment "role specific special equipment";
		switch _type do {
			case _tf : {
				for "_i" from 1 to 6 do {[_x,"1Rnd_Smoke_Grenade_shell",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 6 do {[_x,"1Rnd_SmokeRed_Grenade_shell",2] call Spec_fnc_addItemToContainer;};
			};
			case _gl : {
				for "_i" from 1 to 12 do {[_x,"1Rnd_HE_Grenade_shell",2] call Spec_fnc_addItemToContainer;};
			};
			case _pio : {
				_x addItemToBackpack "ToolKit";
				for "_i" from 1 to 2 do {[_x,"DemoCharge_Remote_Mag",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,"SLAMDirectionalMine_Wire_Mag",3] call Spec_fnc_addItemToContainer;};
				[_x,"ACE_M26_Clacker",2] call Spec_fnc_addItemToContainer;
				[_x,"ACE_Clacker",2] call Spec_fnc_addItemToContainer;
				[_x,"ACE_DefusalKit",2] call Spec_fnc_addItemToContainer;
				_x setVariable ["ACE_IsEngineer", 2];
			};
			case _logistic : {
				[_x,"ToolKit",2] call Spec_fnc_addItemToContainer;
				_x setVariable ["ACE_IsEngineer", 2];
			};
			case _mg : {
				[_x,"ACE_SpareBarrel",2] call Spec_fnc_addItemToContainer;
			};
			case _mgAssi : {
				for "_i" from 1 to 2 do {[_x,"hlc_100Rnd_762x51_B_M60E4",2] call Spec_fnc_addItemToContainer;};
			};
		};
		
		comment "===========================================";
		comment "==============  Weapons  ==================";
		comment "===========================================";
		
		comment "MG (change 'case _mgAssi :' ammunition for mmg above)";
		if(_type == _mg) then {
			for "_i" from 1 to 2 do {[_x,"hlc_100Rnd_762x51_B_M60E4",2] call Spec_fnc_addItemToContainer;};
			[_x,"hlc_100Rnd_762x51_B_M60E4",1] call Spec_fnc_addItemToContainer;

			_x addWeapon "hlc_lmg_m60";
		} else {
			comment "grenade launcher";
			if(_type == _tf || _type == _gl) then {
				for "_i" from 1 to 6 do {[_x,"hlc_30Rnd_556x45_SOST_AUG",2] call Spec_fnc_addItemToContainer;};

				_x addWeapon "hlc_rifle_auga3_GL";
				_x addPrimaryWeaponItem "acc_flashlight";
			} else {
				if(_type == _lmg) then {
					for "_i" from 1 to 1 do {[_x,"rhs_200rnd_556x45_M_SAW",1] call Spec_fnc_addItemToContainer;};
					for "_i" from 1 to 3 do {[_x,"rhs_200rnd_556x45_M_SAW",2] call Spec_fnc_addItemToContainer;};
					_x addWeapon "rhs_weap_m249_pip_L";
				} else {
					comment "AT launcher";
					if(_type == _at) then {
						_x addWeapon "UK3CB_BAF_AT4_AT_Launcher";
					};
					comment "standard weapon";
					for "_i" from 1 to 6 do {[_x,"hlc_30Rnd_556x45_SOST_AUG",1] call Spec_fnc_addItemToContainer;};

					_x addWeapon "hlc_rifle_auga3";
					_x addPrimaryWeaponItem "acc_flashlight";
				};
			};
		};
		comment "secondary weapon for everyone";
		for "_i" from 1 to 3 do {[_x,"rhsusf_mag_17Rnd_9x19_JHP",1] call Spec_fnc_addItemToContainer;};
		
		_x addWeapon "rhsusf_weap_glock17g4";
		_x addPrimaryWeaponItem "acc_flashlight";

	};
};