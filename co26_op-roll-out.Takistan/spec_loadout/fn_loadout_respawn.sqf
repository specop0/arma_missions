waitUntil {!isNull player || isServer}; 
private _parameterCorrect = params [["_x",objNull,[objNull]]];

if(_parameterCorrect) then {
	switch (typeOf _x) do {
		comment "Officer - OPL";
		case ("O_officer_F"): {
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

			_x addWeapon "ACE_Vector";
			_x linkItem "ItemMap";
			_x linkItem "ItemCompass";
			_x linkItem "ItemWatch";
			_x linkItem "tf_fadak_1";

			for "_i" from 1 to 6 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			for "_i" from 1 to 6 do {[_x,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 6 do {[_x,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
		};
		comment "SquadlLeader - FTL";
		case ("O_Soldier_SL_F"): {
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
		};
		comment "TeamLeader - #1";
		case ("O_Soldier_TL_F"): {
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

			for "_i" from 1 to 6 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			for "_i" from 1 to 6 do {[_x,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 6 do {[_x,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
		};
		comment "Grenadier - #2 inkl 40mm";
		case ("O_Soldier_GL_F"):{
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

			for "_i" from 1 to 6 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			for "_i" from 1 to 4 do {[_x,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 4 do {[_x,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 8 do {[_x,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
		};
		comment "SQL #2 - Funker, weil wegen darum";
		case ("O_Soldier_lite_F"): {
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

			for "_i" from 1 to 15 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 12 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 5 do {[_x,  "ACE_epinephrine", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 5 do {[_x,  "ACE_morphine", 2] call Spec_fnc_addItemToContainer;};

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			
		};
		comment "Autorifleman - MG #3,#4";
		case ("O_Soldier_AR_F"): {
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

			for "_i" from 1 to 3 do {[_x,  "150Rnd_762x54_Box", 2] call Spec_fnc_addItemToContainer;};
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
		};
		comment "Rifleman AT - AT-Schuetze #5,#6";
		case ("O_Soldier_LAT_F"): {
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

			_x addWeapon "ACE_Yardage450";
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;


			for "_i" from 1 to 2 do {[_x,  "RPG32_F", 2] call Spec_fnc_addItemToContainer;};
			_x addWeapon "launch_RPG32_F";

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
		};
		comment "Engineer - Pioner #5,#6 (explosive, repair)";
		case ("O_engineer_F"): {
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			for "_i" from 1 to 3 do {[_x,  "DemoCharge_Remote_Mag", 2] call Spec_fnc_addItemToContainer;};

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Clacker", 2] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_DefusalKit", 2] call Spec_fnc_addItemToContainer;
			
			_x setVariable ["ACE_IsEngineer", 1];
		};
		comment "Repair Specialist - Logistic (inkl Repair)";
		case ("O_soldier_repair_F"): {
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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			[_x,  "ToolKit", 2] call Spec_fnc_addItemToContainer;

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
			_x setVariable ["ACE_IsEngineer", 2];
		};
		comment "Combat Life Saver) - MedEvac";
		case ("O_medic_F"): {
			removeAllWeapons _x;
			removeAllItems _x;
			removeAllAssignedItems _x;
			removeHeadgear _x;
			removeGoggles _x;

			_x addHeadgear "H_HelmetLeaderO_ocamo";
			[_x, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
			[_x, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
			[_x, "B_TacticalPack_ocamo", 2] call Spec_fnc_addContainer;
			_x addGoggles "G_Tactical_Clear";

			_x addWeapon "Binocular";
			_x linkItem "ItemMap";
			_x linkItem "ItemCompass";
			_x linkItem "ItemWatch";
			_x linkItem "tf_fadak_1";

			for "_i" from 1 to 5 do {[_x,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
			_x addWeapon "arifle_Katiba_ARCO_pointer_F";

			for "_i" from 1 to 1 do {[_x,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
			_x addWeapon "hgun_Rook40_F";

			for "_i" from 1 to 2 do {[_x,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_x,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_x,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
			[_x,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
			for "_i" from 1 to 2 do {[_x,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 2 do {[_x,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 2 do {[_x,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

			for "_i" from 1 to 15 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 8 do {[_x,  "ACE_elasticBandage", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 12 do {[_x,  "ACE_quikclot", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 10 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 4 do {[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 5 do {[_x,  "ACE_salineIV_500", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 5 do {[_x,  "ACE_salineIV", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 5 do {[_x,  "ACE_atropine", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 10 do {[_x,  "ACE_epinephrine", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 15 do {[_x,  "ACE_morphine", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_surgicalKit", 2] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_personalAidKit", 2] call Spec_fnc_addItemToContainer;

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
			
			_x setVariable ["ace_medical_medicClass", 2];
		};
		default {
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
			
			[_x,  "ACE_Banana", 0] call Spec_fnc_addItemToContainer;

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

			for "_i" from 1 to 7 do {[_x,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
			for "_i" from 1 to 3 do {[_x,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
			[_x,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

			[_x,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
			[_x,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
		};
	};
	[_x, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
};
