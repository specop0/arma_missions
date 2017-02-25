waitUntil {!isNull player || isServer}; 
private _parameterCorrect = params [["_unit",objNull,[objNull]]];

if(_parameterCorrect) then {
    switch (typeOf _unit) do {
        comment "Officer - OPL";
        case ("O_officer_F"): {
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

            _unit addWeapon "ACE_Vector";
            _unit linkItem "ItemMap";
            _unit linkItem "ItemCompass";
            _unit linkItem "ItemWatch";
            _unit linkItem "tf_fadak_1";

            for "_i" from 1 to 6 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            for "_i" from 1 to 6 do {[_unit,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 6 do {[_unit,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
        };
        comment "SquadlLeader - FTL";
        case ("O_Soldier_SL_F"): {
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
        };
        comment "TeamLeader - #1";
        case ("O_Soldier_TL_F"): {
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

            for "_i" from 1 to 6 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            for "_i" from 1 to 6 do {[_unit,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 6 do {[_unit,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
        };
        comment "Grenadier - #2 inkl 40mm";
        case ("O_Soldier_GL_F"):{
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

            for "_i" from 1 to 6 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            for "_i" from 1 to 4 do {[_unit,  "1Rnd_Smoke_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 4 do {[_unit,  "1Rnd_SmokeRed_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 8 do {[_unit,  "1Rnd_HE_Grenade_shell", 2] call Spec_fnc_addItemToContainer;};

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
        };
        comment "SQL #2 - Funker, weil wegen darum";
        case ("O_Soldier_lite_F"): {
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

            for "_i" from 1 to 15 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 12 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 2 do {[_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 5 do {[_unit,  "ACE_epinephrine", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 5 do {[_unit,  "ACE_morphine", 2] call Spec_fnc_addItemToContainer;};

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
            
        };
        comment "Autorifleman - MG #3,#4";
        case ("O_Soldier_AR_F"): {
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

            for "_i" from 1 to 3 do {[_unit,  "150Rnd_762x54_Box", 2] call Spec_fnc_addItemToContainer;};
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
        };
        comment "Rifleman AT - AT-Schuetze #5,#6";
        case ("O_Soldier_LAT_F"): {
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

            _unit addWeapon "ACE_Yardage450";
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;


            for "_i" from 1 to 2 do {[_unit,  "RPG32_F", 2] call Spec_fnc_addItemToContainer;};
            _unit addWeapon "launch_RPG32_F";

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
        };
        comment "Engineer - Pioner #5,#6 (explosive, repair)";
        case ("O_engineer_F"): {
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            for "_i" from 1 to 3 do {[_unit,  "DemoCharge_Remote_Mag", 2] call Spec_fnc_addItemToContainer;};

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Clacker", 2] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_DefusalKit", 2] call Spec_fnc_addItemToContainer;
            
            _unit setVariable ["ACE_IsEngineer", true, true];
            _unit setVariable ["ACE_isEOD", true, true];
        };
        comment "Repair Specialist - Logistic (inkl Repair)";
        case ("O_soldier_repair_F"): {
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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            [_unit,  "ToolKit", 2] call Spec_fnc_addItemToContainer;

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
            _unit setVariable ["ACE_IsEngineer", true, true];
        };
        comment "Combat Life Saver) - MedEvac";
        case ("O_medic_F"): {
            removeAllWeapons _unit;
            removeAllItems _unit;
            removeAllAssignedItems _unit;
            removeHeadgear _unit;
            removeGoggles _unit;

            _unit addHeadgear "H_HelmetLeaderO_ocamo";
            [_unit, "U_O_CombatUniform_ocamo", 0] call Spec_fnc_addContainer;
            [_unit, "V_TacVest_khk", 1] call Spec_fnc_addContainer;
            [_unit, "B_TacticalPack_ocamo", 2] call Spec_fnc_addContainer;
            _unit addGoggles "G_Tactical_Clear";

            _unit addWeapon "Binocular";
            _unit linkItem "ItemMap";
            _unit linkItem "ItemCompass";
            _unit linkItem "ItemWatch";
            _unit linkItem "tf_fadak_1";

            for "_i" from 1 to 5 do {[_unit,  "30Rnd_65x39_caseless_green", 1] call Spec_fnc_addItemToContainer;};
            _unit addWeapon "arifle_Katiba_ARCO_pointer_F";

            for "_i" from 1 to 1 do {[_unit,  "16Rnd_9x21_Mag", 1] call Spec_fnc_addItemToContainer;};
            _unit addWeapon "hgun_Rook40_F";

            for "_i" from 1 to 2 do {[_unit,  "SmokeShell", 0] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 2 do {[_unit,  "SmokeShellRed", 0] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 2 do {[_unit,  "SmokeShellGreen", 0] call Spec_fnc_addItemToContainer;};
            [_unit,  "SmokeShellPurple", 0] call Spec_fnc_addItemToContainer;
            for "_i" from 1 to 2 do {[_unit,  "Chemlight_red", 0] call Spec_fnc_addItemToContainer;};

            for "_i" from 1 to 2 do {[_unit,  "ACE_M84", 1] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 2 do {[_unit,  "ACE_IR_Strobe_Item", 1] call Spec_fnc_addItemToContainer;};

            for "_i" from 1 to 15 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 8 do {[_unit,  "ACE_elasticBandage", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 12 do {[_unit,  "ACE_quikclot", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 10 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 4 do {[_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 5 do {[_unit,  "ACE_salineIV_500", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 5 do {[_unit,  "ACE_salineIV", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 5 do {[_unit,  "ACE_atropine", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 10 do {[_unit,  "ACE_epinephrine", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 15 do {[_unit,  "ACE_morphine", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_surgicalKit", 2] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_personalAidKit", 2] call Spec_fnc_addItemToContainer;

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_microDAGR", 0] call Spec_fnc_addItemToContainer;
            
            _unit setVariable ["ace_medical_medicClass", 2, true];
        };
        default {
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
            
            [_unit,  "ACE_Banana", 0] call Spec_fnc_addItemToContainer;

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

            for "_i" from 1 to 7 do {[_unit,  "ACE_fieldDressing", 2] call Spec_fnc_addItemToContainer;};
            for "_i" from 1 to 3 do {[_unit,  "ACE_packingBandage", 2] call Spec_fnc_addItemToContainer;};
            [_unit,  "ACE_tourniquet", 2] call Spec_fnc_addItemToContainer;

            [_unit,  "ACE_EarPlugs", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_MapTools", 0] call Spec_fnc_addItemToContainer;
            [_unit,  "ACE_Flashlight_MX991", 0] call Spec_fnc_addItemToContainer;
        };
    };
    [_unit, "ACE_NVG_Wide", 3] call Spec_fnc_addItemToContainer;
};
