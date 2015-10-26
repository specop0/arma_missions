waitUntil {!isNull player || isServer}; 
local _parameterCorrect = params [["_x",objNull,[objNull]]];

if(_parameterCorrect) then {
	if(side _x == east) then {
		[_x] call Spec_fnc_loadout_respawn;
		comment "only some classes other loadout";
		comment "THIS STRUCTURE IMPORTANT!";
		if (!isNil "braun_1") then {
			comment "1 mag, some bandages missing";
			if (_x == braun_1) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "ACE_Vector";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";
				
				for "_i" from 1 to 5 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "arifle_Katiba_ARCO_pointer_F";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 2 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 4 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
				[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_GD300_b", 2] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			};
		};
		if (!isNil "braun_3") then {
			comment "medic stuff missing";
			if (_x == braun_3) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "tf_mr3000", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "Binocular";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 6 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "arifle_Katiba_ARCO_pointer_F";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 2 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 4 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,  "ACE_epinephrine", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,  "ACE_morphine", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;

			};
		};
		if (!isNil "rot_1") then {
			comment "mags, 40mm rounds, smoke rounds missing";
			if (_x == rot_1) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "ACE_Vector";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 3 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 2 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 4 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 6 do {[_x,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 4 do {[_x,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
				[_x,"ACE_GD300_b", 2] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			};
		};
		if (!isNil "rot_2") then {
			comment "main and sec mags, 40mm missing";
			if (_x == rot_2) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "Binocular";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 2 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

				for "_i" from 1 to 1 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 2 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 1 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
				[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

				for "_i" from 1 to 2 do {[_x,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			};
		};
		if (!isNil "rot_3") then {
			comment "mags missing";
			if (_x == rot_3) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "Binocular";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 1 do {[_x,  "150Rnd_762x54_Box", 2] call Spec_fnc_addItemToContainer;};
				_x addWeapon "LMG_Zafir_ARCO_F";
				_x addPrimaryWeaponItem "acc_pointer_IR";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 2 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 1 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			};
		};
		if (!isNil "rot_4") then {
			comment "mag, smokes missing";
			if (_x == rot_4) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "Binocular";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 1 do {[_x,  "150Rnd_762x54_Box", 2] call Spec_fnc_addItemToContainer;};
				_x addWeapon "LMG_Zafir_ARCO_F";
				_x addPrimaryWeaponItem "acc_pointer_IR";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 1 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
				[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			};
		};
		if (!isNil "violett_1") then {
			comment "mag, grenades, 40mm missing";
			if (_x == violett_1) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "ACE_Vector";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 3 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 1 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 1 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
				[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

				for "_i" from 1 to 6 do {[_x,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 6 do {[_x,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 3 do {[_x,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
				[_x,"ACE_GD300_b", 2] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			};
		};
		if (!isNil "violett_2") then {
			comment "only 1 secondary mag";
			if (_x == violett_2) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "Binocular";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";
				_x linkItem "ItemGPS";

				_x addWeapon "arifle_Katiba_GL_ARCO_pointer_F";

				for "_i" from 1 to 1 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 2 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 4 do {[_x,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 4 do {[_x,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 8 do {[_x,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
			};
		};
		if (!isNil "violett_5") then {
			comment "mags, smoke, explosive missing";
			if (_x == violett_5) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "Binocular";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 4 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "arifle_Katiba_ARCO_pointer_F";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 5 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
				[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

				for "_i" from 1 to 1 do {[_x,  "DemoCharge_Remote_Mag", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Clacker", 2] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_DefusalKit", 2] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
				_x setVariable ["ACE_IsEngineer", 1]; 
			};
		};
		if (!isNil "violett_6") then {
			if (_x == violett_6) then {
				removeAllWeapons _x;
				removeAllItems _x;
				removeAllAssignedItems _x;
				removeHeadgear _x;
				removeGoggles _x;

				_x addHeadgear "H_HelmetLeaderO_ocamo";
				[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
				[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
				[_x, "B_FieldPack_ocamo", 2] call Spec_fnc_addContainer;
				_x addGoggles "G_Tactical_Clear";

				_x addWeapon "Binocular";
				_x linkItem "ItemMap";
				_x linkItem "ItemCompass";
				_x linkItem "ItemWatch";
				_x linkItem "tf_fadak_1";

				for "_i" from 1 to 2 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "arifle_Katiba_ARCO_pointer_F";

				for "_i" from 1 to 2 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
				_x addWeapon "hgun_Rook40_F";

				for "_i" from 1 to 1 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
				[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
				for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 4 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
				for "_i" from 1 to 1 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};

				for "_i" from 1 to 3 do {[_x,  "DemoCharge_Remote_Mag", 2] call Spec_fnc_addItemToContainer;};
				
				[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_Clacker", 2] call Spec_fnc_addItemToContainer;
				[_x,  "ACE_DefusalKit", 2] call Spec_fnc_addItemToContainer;
				[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
				_x setVariable ["ACE_IsEngineer", 1]; 
			};
		};
	} else {
		_x removeMagazines "1Rnd_HE_Grenade_shell";
	};
};
