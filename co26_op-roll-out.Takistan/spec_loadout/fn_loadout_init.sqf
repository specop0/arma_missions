waitUntil {!isNull player || isServer}; 
private _parameterCorrect = params [["_unit",objNull,[objNull]]];

if(_parameterCorrect) then {
	[_unit] call Spec_fnc_loadout_respawn;
	comment "only some classes other loadout";
	comment "THIS STRUCTURE IMPORTANT!";
	if (!isNil "braun_1") then {
		comment "1 mag, some bandages missing";
		if (_unit == braun_1) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "ACE_Vector";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";
			
			for "_i" from 1 to 5 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "arifle_Katiba_ARCO_pointer_F";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 4 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
		};
	};
	if (!isNil "braun_3") then {
		comment "medic stuff missing";
		if (_unit == braun_3) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "tf_mr3000", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "Binocular";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 6 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "arifle_Katiba_ARCO_pointer_F";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 4 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_unit,  "ACE_epinephrine", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_unit,  "ACE_morphine", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;

		};
	};
	if (!isNil "rot_1") then {
		comment "mags, 40mm rounds, smoke rounds missing";
		if (_unit == rot_1) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "ACE_Vector";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 3 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 4 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 1 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 6 do {[_unit,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 4 do {[_unit,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
		};
	};
	if (!isNil "rot_2") then {
		comment "main and sec mags, 40mm missing";
		if (_unit == rot_2) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "Binocular";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 2 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

			for "_i" from 1 to 1 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 1 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			for "_i" from 1 to 2 do {[_unit,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_unit,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
		};
	};
	if (!isNil "rot_3") then {
		comment "mags missing";
		if (_unit == rot_3) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "Binocular";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 1 do {[_unit,  "150Rnd_762x54_Box", 2] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "LMG_Zafir_ARCO_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 1 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 1 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
		};
	};
	if (!isNil "rot_4") then {
		comment "mag, smokes missing";
		if (_unit == rot_4) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "Binocular";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 1 do {[_unit,  "150Rnd_762x54_Box", 2] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "LMG_Zafir_ARCO_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 1 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 1 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
		};
	};
	if (!isNil "violett_1") then {
		comment "mag, grenades, 40mm missing";
		if (_unit == violett_1) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "ACE_Vector";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 3 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 1 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 1 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 1 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			for "_i" from 1 to 6 do {[_unit,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 6 do {[_unit,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_unit,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
		};
	};
	if (!isNil "violett_2") then {
		comment "only 1 secondary mag";
		if (_unit == violett_2) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "Binocular";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";
			_unit linkItem "ItemGPS";

			_unit addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

			for "_i" from 1 to 1 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 4 do {[_unit,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 4 do {[_unit,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 8 do {[_unit,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
		};
	};
	if (!isNil "violett_5") then {
		comment "mags, smoke, explosive missing";
		if (_unit == violett_5) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "Binocular";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 4 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "arifle_Katiba_ARCO_pointer_F";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 1 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 5 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			for "_i" from 1 to 1 do {[_unit,  "DemoCharge_Remote_Mag", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Clacker", 2] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_DefusalKit", 2] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ACE_IsEngineer", true];
			_unit setVariable ["ACE_isEOD", true];			
		};
	};
	if (!isNil "violett_6") then {
		if (_unit == violett_6) then {
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			_unit addHeadgear "H_HelmetLeaderO_ocamo";
			[_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_unit, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
			_unit addGoggles "G_Tactical_Clear";

			_unit addWeapon "Binocular";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_fadak_1";

			for "_i" from 1 to 2 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "arifle_Katiba_ARCO_pointer_F";

			for "_i" from 1 to 2 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_unit addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 1 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 1 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 4 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 1 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 3 do {[_unit,  "DemoCharge_Remote_Mag", 2] call Spec_fnc_addItemToContainer;};
			
			[_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_Clacker", 2] call Spec_fnc_addItemToContainer;
			[_unit,  "ACE_DefusalKit", 2] call Spec_fnc_addItemToContainer;
			[_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			_unit setVariable ["ACE_IsEngineer", true];
			_unit setVariable ["ACE_isEOD", true];
		};
	};
};
