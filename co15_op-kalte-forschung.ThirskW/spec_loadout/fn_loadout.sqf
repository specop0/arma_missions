waitUntil {!isNull player || isServer};
local _parameterCorrect = params [["_x",objNull,[objNull]]];

local _tf = "B_Soldier_TL_F";
local _gl = "B_Soldier_GL_F";
local _medic = "B_medic_F";
local _mg = "B_soldier_AR_F";
local _mgAssi = "B_Soldier_A_F";
local _at = "B_soldier_LAT_F";
local _pio = "B_engineer_F";
local _lmg = "B_Soldier_lite_F";
local _sniper = "B_Soldier_F";
local _sniperHelp = "B_Helipilot_F";

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
		
		_x addVest "TFA_PlateCarrier_WTE";
		_x forceAddUniform "TFA_white";
		if(_type == _medic || _type == _pio) then {
			_x addBackpack "TFA_assault_wte";
		};

		_x addHeadgear "TFA_H_HelmetIA_wte";
		_x addGoggles "G_Balaclava_combat";
		if(_type == _tf) then {
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
		
		if(_type == _tf) then {
			_x addItemToUniform "ACE_microDAGR";
			[_x,"ACE_GD300_b",0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 3 do {[_x,"ACE_CableTie",1] call Spec_fnc_addItemToContainer;};
			
			Spec_fnc_ammoBox = compile preprocessFileLineNumbers "scripts\ammoBox.sqf";
			_x addAction ["Fordere Nachschub an", Spec_fnc_ammoBox, [], -100, false, true, "", "true"];
		};
		
		[_x,"ACE_EarPlugs",0] call Spec_fnc_addItemToContainer;
		[_x,"ACE_MapTools",0] call Spec_fnc_addItemToContainer;
		
		for "_i" from 1 to 2 do {[_x,"ACE_IR_Strobe_Item",0] call Spec_fnc_addItemToContainer;};
		for "_i" from 1 to 2 do {[_x,"ACE_HandFlare_Green",0] call Spec_fnc_addItemToContainer;};

		for "_i" from 1 to 2 do {[_x,"SmokeShell",0] call Spec_fnc_addItemToContainer;};
		for "_i" from 1 to 2 do {[_x,"SmokeShellGreen",0] call Spec_fnc_addItemToContainer;};
		[_x,"SmokeShellPurple",0] call Spec_fnc_addItemToContainer;
		
		[_x,"ACE_Flashlight_MX991",0] call Spec_fnc_addItemToContainer;
		[_x,"ACE_NVG_Wide",0] call Spec_fnc_addItemToContainer;
		
		for "_i" from 1 to 2 do {[_x,"ACE_M84",0] call Spec_fnc_addItemToContainer;};

		switch _type do {
			case _medic : {
				for "_i" from 1 to 10 do {[_x,"ACE_fieldDressing",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 15 do {[_x,"ACE_elasticBandage",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 10 do {[_x,"ACE_quikclot",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 10 do {[_x,"ACE_packingBandage",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,"ACE_tourniquet",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 6 do {[_x,"ACE_salineIV_500",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 4 do {[_x,"ACE_salineIV",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 5 do {[_x,"ACE_atropine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 8 do {[_x,"ACE_epinephrine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 8 do {[_x,"ACE_morphine",2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,"ACE_surgicalKit",2] call Spec_fnc_addItemToContainer;};
				_x setVariable ["ace_medical_medicClass", 1];
			};
			default {
				for "_i" from 1 to 7 do {[_x,"ACE_fieldDressing",1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,"ACE_tourniquet",1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,"ACE_morphine",1] call Spec_fnc_addItemToContainer;};
			};
		};
		
		switch _type do {
			case _tf : {
				for "_i" from 1 to 6 do {[_x,"1Rnd_Smoke_Grenade_shell",1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 6 do {[_x,"1Rnd_SmokeRed_Grenade_shell",1] call Spec_fnc_addItemToContainer;};
			};
			case _gl : {
				for "_i" from 1 to 12 do {[_x,"1Rnd_HE_Grenade_shell",1] call Spec_fnc_addItemToContainer;};
			};
			case _pio : {
				for "_i" from 1 to 5 do {[_x,"DemoCharge_Remote_Mag",2] call Spec_fnc_addItemToContainer;};
				[_x,"ACE_Clacker",0] call Spec_fnc_addItemToContainer;
				[_x,"ACE_DefusalKit",0] call Spec_fnc_addItemToContainer;
				_x setVariable ["ACE_IsEngineer", 2];
			};
			case _mgAssi : {
				for "_i" from 1 to 2 do {[_x,"BWA3_120Rnd_762x51",1] call Spec_fnc_addItemToContainer;};
			};
			case _at : {
				_x addBackpack "TFA_assault_wte";
				_x addItemToBackpack "BWA3_Pzf3_IT";
				_x addWeapon "BWA3_Pzf3";
				removeBackpack _x;
			};
			case _sniperHelp : {
				for "_i" from 1 to 5 do {[_x,"rhsusf_20Rnd_762x51_m118_special_Mag",1] call Spec_fnc_addItemToContainer;};
			};
		};

		if(_type == _mg) then {
			for "_i" from 1 to 3 do {[_x,"BWA3_120Rnd_762x51",1] call Spec_fnc_addItemToContainer;};

			_x addWeapon "BWA3_MG5";
			_x addPrimaryWeaponItem "BWA3_muzzle_snds_G28";
			_x addPrimaryWeaponItem "acc_pointer_IR";
			_x addPrimaryWeaponItem "optic_MRCO";

			_x addItemToUniform "BWA3_optic_EOTech";
		} else {
			if(_type == _tf || _type == _gl) then {
				for "_i" from 1 to 10 do {[_x,"30Rnd_556x45_Stanag",1] call Spec_fnc_addItemToContainer;};

				_x addWeapon "rhs_weap_m4_m320";
				_x addPrimaryWeaponItem "rhsusf_acc_nt4_black";
				_x addPrimaryWeaponItem "acc_pointer_IR";
				_x addPrimaryWeaponItem "rhsusf_acc_ACOG";

				_x addItemToUniform "rhsusf_acc_eotech_552";
			} else {
				if (_type == _lmg) then {
					for "_i" from 1 to 3 do {[_x,"BWA3_120Rnd_762x51",1] call Spec_fnc_addItemToContainer;};
					
					_x addWeapon "BWA3_MG5";
					_x addPrimaryWeaponItem "BWA3_muzzle_snds_G28";
					_x addPrimaryWeaponItem "acc_pointer_IR";
					_x addPrimaryWeaponItem "optic_MRCO";

					_x addItemToUniform "BWA3_optic_EOTech";	
				} else {
					if(_type == _sniper) then {
						for "_i" from 1 to 11 do {[_x,"rhsusf_20Rnd_762x51_m118_special_Mag",1] call Spec_fnc_addItemToContainer;};
						_x addWeapon "rhs_weap_sr25";
						_x addPrimaryWeaponItem "rhsusf_acc_SR25S";
						_x addPrimaryWeaponItem "acc_pointer_IR";
						_x addPrimaryWeaponItem "optic_LRPS";
						_x addPrimaryWeaponItem "rhsusf_acc_harris_bipod";

						_x addItemToUniform "rhsusf_acc_eotech_552";
					} else {
						for "_i" from 1 to 10 do {[_x,"30Rnd_556x45_Stanag",1] call Spec_fnc_addItemToContainer;};
						for "_i" from 1 to 3 do { call Spec_fnc_addItemToContainer;};

						_x addWeapon "rhs_weap_m4_grip";
						_x addPrimaryWeaponItem "rhsusf_acc_nt4_black";
						_x addPrimaryWeaponItem "acc_pointer_IR";
						_x addPrimaryWeaponItem "rhsusf_acc_ACOG";
						_x addItemToUniform "rhsusf_acc_eotech_552";
					};
				};
			};
		};
	};
};