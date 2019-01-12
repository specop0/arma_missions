#include "const.hpp"
private _parameterCorrect = params [ ["_enemy","",[""]] ];

if(isNil {ENEMY_SIDE_ARRAY}) then {
    private _rhsLoaded = isClass (configFile >> "CfgPatches" >> "rhs_main");
    private _cupLoaded = { isClass (configFile >> "CfgPatches" >> _x) } count ["CUP_Creatures_People_Core","CUP_Vehicles_Core","CUP_Weapons_WeaponsCore"] == 3;
    ENEMY_SIDE_ARRAY = ["AAF","CSAT","CSAT_PACIFIC","SYNDICAT"];
    if (_cupLoaded) then {
        ENEMY_SIDE_ARRAY append ["CHERNARUS", "NAPA", "RACS", "TAKISTAN"];
    };
    if (_rhsLoaded) then {
        ENEMY_SIDE_ARRAY append ["EAST_MILITIA", "RUS_MSV","RUS_VDV", "SAF"];
    };
};

if(_parameterCorrect) then {
    switch (_enemy) do {
        case "AAF": {
            ENEMY_SIDE = INDEPENDENT;
            UNITS_ENEMY = [
                "I_Soldier_A_F",
                "I_Soldier_AAR_F",
                "I_Soldier_AAA_F",
                "I_Soldier_AAT_F",
                "I_Soldier_AR_F",
                "I_medic_F",
                "I_engineer_F",
                "I_Soldier_exp_F",
                "I_soldier_F",
                "I_Soldier_LAT_F",
                "I_Soldier_lite_F",
                "I_Soldier_SL_F",
                "I_Soldier_AR_F",
                "I_Soldier_AR_F"
            ];
            UNITS_MARKSMAN = ["I_Soldier_M_F"];
            VEHICLE_ENEMY = ["I_MRAP_03_hmg_F"];
            ARMOR_ENEMY = ["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MBT_03_cannon_F"];
        };
        case "RACS": {
            ENEMY_SIDE = INDEPENDENT;
            UNITS_ENEMY = [
                "CUP_I_RACS_Soldier_AA",
                "CUP_I_RACS_Soldier_MAT",
                "CUP_I_RACS_Crew",
                "CUP_I_RACS_Engineer",
                "CUP_I_RACS_Soldier_HAT",
                "CUP_I_RACS_MMG",
                "CUP_I_RACS_Medic",
                "CUP_I_RACS_Soldier",
                "CUP_I_RACS_SL",
                "CUP_I_RACS_MMG",
                "CUP_I_RACS_MMG"
            ];
            UNITS_MARKSMAN = ["CUP_I_RACS_Sniper"];
            VEHICLE_ENEMY = ["CUP_I_LR_MG_RACS"];
            ARMOR_ENEMY = ["CUP_I_M113_RACS","CUP_I_T72_RACS","CUP_I_M163_RACS"];
        };
        case "SAF": {
            ENEMY_SIDE = INDEPENDENT;
            UNITS_ENEMY = [
                "rhssaf_army_m10_digital_asst_mgun",
                "rhssaf_army_m10_digital_asst_spec_aa",
                "rhssaf_army_m10_digital_asst_spec_at",
                "rhssaf_army_m10_digital_engineer",
                "rhssaf_army_m10_digital_exp",
                "rhssaf_army_m10_digital_medic",
                "rhssaf_army_m10_digital_ft_lead",
                "rhssaf_army_m10_digital_mgun_m84",
                "rhssaf_army_m10_digital_spec_aa",
                "rhssaf_army_m10_digital_spec_at",
                "rhssaf_army_m10_digital_repair",
                "rhssaf_army_m10_digital_rifleman_ammo",
                "rhssaf_army_m10_digital_rifleman_at",
                "rhssaf_army_m10_digital_rifleman_m21",
                "rhssaf_army_m10_digital_rifleman_m70",
                "rhssaf_army_m10_digital_sq_lead",
                "rhssaf_army_m10_digital_gl"
            ];
            VEHICLE_ENEMY = ["rhssaf_m1025_olive_m2"];
            ARMOR_ENEMY = ["rhssaf_army_t72s"];
            UNITS_MARKSMAN = ["rhssaf_army_m10_digital_sniper_m76"];
        };
        case "NAPA": {
            ENEMY_SIDE = INDEPENDENT;
            UNITS_ENEMY = [
                "CUP_I_GUE_Ammobearer",
                "CUP_I_GUE_Soldier_AR",
                "CUP_I_GUE_Officer",
                "CUP_I_GUE_Crew",
                "CUP_I_GUE_Soldier_MG",
                "CUP_I_GUE_Engineer",
                "CUP_I_GUE_Medic",
                "CUP_I_GUE_Soldier_AKS74",
                "CUP_I_GUE_Soldier_AKM",
                "CUP_I_GUE_Soldier_AKSU",
                "CUP_I_GUE_Soldier_AT",
                "CUP_I_GUE_Soldier_AA",
                "CUP_I_GUE_Soldier_AA2",
                "CUP_I_GUE_Saboteur",
                "CUP_I_GUE_Soldier_AR",
                "CUP_I_GUE_Soldier_AR",
                "CUP_I_GUE_Soldier_MG"
            ];
            UNITS_MARKSMAN = ["CUP_I_GUE_Soldier_Scout","CUP_I_GUE_Sniper"];
            VEHICLE_ENEMY = ["CUP_I_Datsun_PK_Random"];
            ARMOR_ENEMY = ["CUP_I_T72_NAPA"];
        };
        case "EAST_MILITIA": {
            ENEMY_SIDE = INDEPENDENT;
            UNITS_ENEMY = [
                "rhs_g_Soldier_AA_F",
                "rhs_g_Soldier_exp_F",
                "rhs_g_engineer_F",
                "rhs_g_Soldier_AAT_F",
                "rhs_g_Soldier_AR_F",
                "rhs_g_Soldier_AAR_F",
                "rhs_g_medic_F",
                "rhs_g_Soldier_F2",
                "rhs_g_Soldier_F3",
                "rhs_g_Soldier_F",
                "rhs_g_Soldier_AT_F",
                "rhs_g_Soldier_GL_F",
                "rhs_g_Soldier_SL_F",
                "rhs_g_Soldier_AR_F",
                "rhs_g_Soldier_AR_F",
                "rhs_g_Soldier_AR_F"
            ];
            UNITS_MARKSMAN = ["rhs_g_Soldier_M_F"];
            VEHICLE_ENEMY = ["rhs_uaz_dshkm_chdkz","rhs_btr60_chdkz"];
            ARMOR_ENEMY = ["rhs_bmp1_chdkz","rhs_bmp2_chdkz","rhs_t72bb_chdkz"];
        };
        case "CHERNARUS": {
            ENEMY_SIDE = EAST;
            UNITS_ENEMY = [
                "CUP_O_INS_Soldier_AA",
                "CUP_O_INS_Soldier_Ammo",
                "CUP_O_INS_Soldier_AT",
                "CUP_O_INS_Soldier_AR",
                "CUP_O_INS_Soldier_Engineer",
                "CUP_O_INS_Soldier_MG",
                "CUP_O_INS_Medic",
                "CUP_O_INS_Officer",
                "CUP_O_INS_Soldier",
                "CUP_O_INS_Soldier_AK74",
                "CUP_O_INS_Saboteur",
                "CUP_O_INS_Soldier_Exp"
            ];
            UNITS_MARKSMAN = ["CUP_O_INS_Sniper"];
            VEHICLE_ENEMY = ["CUP_O_UAZ_MG_CHDKZ","CUP_O_BRDM2_CHDKZ"];
            ARMOR_ENEMY = ["CUP_O_BMP2_CHDKZ"];
        };
        case "RUS_MSV": {
            ENEMY_SIDE = EAST;
            UNITS_ENEMY = [
                "rhs_msv_at",
                "rhs_msv_arifleman",
                "rhs_msv_efreitor",
                "rhs_msv_engineer",
                "rhs_msv_aa",
                "rhs_msv_grenadier_rpg",
                "rhs_msv_strelok_rpg_assist",
                "rhs_msv_machinegunner",
                "rhs_msv_machinegunner_assistant",
                "rhs_msv_medic",
                "rhs_msv_rifleman",
                "rhs_msv_grenadier",
                "rhs_msv_LAT",
                "rhs_msv_RShG2",
                "rhs_msv_arifleman",
                "rhs_msv_arifleman",
                "rhs_msv_machinegunner"
            ];
            VEHICLE_ENEMY = ["rhs_tigr_sts_msv","rhs_btr60_msv"];
            ARMOR_ENEMY = ["rhs_bmp1_msv","rhs_btr80a_msv","rhs_bmp2_msv","rhs_bmp3_msv"];
            UNITS_MARKSMAN = ["rhs_msv_marksman"];
        };
        case "RUS_VDV":{
            ENEMY_SIDE = EAST;
            UNITS_ENEMY = [
                "rhs_vdv_mflora_aa",
                "rhs_vdv_mflora_at",
                "rhs_vdv_mflora_efreitor",
                "rhs_vdv_mflora_engineer",
                "rhs_vdv_mflora_grenadier_rpg",
                "rhs_vdv_mflora_strelok_rpg_assist",
                "rhs_vdv_mflora_junior_sergeant",
                "rhs_vdv_mflora_machinegunner",
                "rhs_vdv_mflora_machinegunner_assistant",
                "rhs_vdv_mflora_medic",
                "rhs_vdv_mflora_rifleman",
                "rhs_vdv_mflora_LAT",
                "rhs_vdv_mflora_sergeant",
                "rhs_vdv_mflora_machinegunner",
                "rhs_vdv_mflora_machinegunner",
                "rhs_vdv_mflora_machinegunner"
            ];
            VEHICLE_ENEMY = ["rhs_tigr_sts_vdv","rhs_btr60_vdv"];
            ARMOR_ENEMY = ["rhs_bmd1","rhs_bmp1_vdv","rhs_bmp2_vdv","rhs_sprut_vdv"];
            UNITS_MARKSMAN = ["rhs_vdv_mflora_marksman"];
        };
        case "TAKISTAN": {
            ENEMY_SIDE = EAST;
            UNITS_ENEMY = [
                "CUP_O_TK_Soldier_AA",
                "CUP_O_TK_Soldier_AAT",
                "CUP_O_TK_Soldier_AMG",
                "CUP_O_TK_Soldier_HAT",
                "CUP_O_TK_Soldier_AR",
                "CUP_O_TK_Engineer",
                "CUP_O_TK_Soldier_MG",
                "CUP_O_TK_Medic",
                "CUP_O_TK_Soldier",
                "CUP_O_TK_Soldier_Backpack",
                "CUP_O_TK_Soldier_LAT",
                "CUP_O_TK_Soldier_AT",
                "CUP_O_TK_Soldier_SL",
                "CUP_O_TK_Soldier_AR",
                "CUP_O_TK_Soldier_AR",
                "CUP_O_TK_Soldier_MG"
            ];
            UNITS_MARKSMAN = ["CUP_O_TK_Sniper","CUP_O_TK_Sniper_KSVK"];
            VEHICLE_ENEMY = ["CUP_O_LR_MG_TKA","CUP_O_UAZ_MG_TKA"];
            ARMOR_ENEMY = ["CUP_O_M113_TKA","CUP_O_T72_TKA","CUP_O_BMP1_TKA","CUP_O_BMP2_TKA","CUP_O_BRDM2_TKA","CUP_O_BTR60_TK"];
        };
        case "CSAT_PACIFIC" : {
            ENEMY_SIDE = EAST;
            UNITS_ENEMY = [
                "O_T_Soldier_A_F",
                "O_T_Soldier_AAR_F",
                "O_T_Soldier_AAA_F",
                "O_T_Soldier_AAT_F",
                "O_T_Soldier_AR_F",
                "O_T_medic_F",
                "O_T_crew_F",
                "O_T_engineer_F",
                "O_T_soldier_exp_F",
                "O_T_Soldier_AA_F",
                "O_T_Soldier_AT_F",
                "O_T_Soldier_LAT_F",
                "O_T_Soldier_F",
                "O_T_Soldier_TL_F",
                "O_T_Soldier_AR_F",
                "O_T_Soldier_AR_F"
            ];
            VEHICLE_ENEMY = ["O_T_MRAP_02_hmg_ghex_F", "O_T_LSV_02_armed_F"];
            ARMOR_ENEMY = ["O_T_APC_Tracked_02_cannon_ghex_F", "O_T_APC_Wheeled_02_rcws_ghex_F", "O_T_MBT_02_cannon_ghex_F"];
            UNITS_MARKSMAN = ["O_T_soldier_M_F","O_T_Recon_M_F","O_T_sniper_F"];
        };
        case "SYNDICAT" : {
            ENEMY_SIDE = INDEPENDENT;
            UNITS_ENEMY = [
                "I_C_Soldier_Bandit_7_F",
                "I_C_Soldier_Bandit_2_F",
                "I_C_Pilot_F",
                "I_C_Soldier_Bandit_5_F",
                "I_C_Soldier_Bandit_1_F",
                "I_C_Soldier_Bandit_8_F",
                "I_C_Soldier_Bandit_4_F",
                "I_C_Soldier_Para_7_F",
                "I_C_Soldier_Para_2_F",
                "I_C_Helipilot_F",
                "I_C_Soldier_Para_3_F",
                "I_C_Soldier_Para_8_F",
                "I_C_Soldier_Para_1_F",
                "I_C_Soldier_Para_5_F",
                "I_C_Soldier_Bandit_3_F",
                "I_C_Soldier_Para_4_F",
                "I_C_Soldier_Bandit_3_F",
                "I_C_Soldier_Para_4_F"
            ];
            UNITS_MARKSMAN = ["I_C_Soldier_Bandit_6_F","I_C_Soldier_Para_6_F"];
            VEHICLE_ENEMY = ["I_MRAP_03_hmg_F"];
            ARMOR_ENEMY = ["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MBT_03_cannon_F"];
        };
        default {
            // CSAT
            ENEMY_SIDE = EAST;
            UNITS_ENEMY = [
                "O_Soldier_A_F",
                "O_Soldier_AAR_F",
                "O_Soldier_AAA_F",
                "O_Soldier_AAT_F",
                "O_Soldier_AR_F",
                "O_medic_F",
                "O_crew_F",
                "O_engineer_F",
                "O_soldier_exp_F",
                "O_HeavyGunner_F",
                "O_Soldier_AA_F",
                "O_Soldier_AT_F",
                "O_Soldier_LAT_F",
                "O_Soldier_F",
                "O_Soldier_TL_F",
                "O_Soldier_AR_F",
                "O_Soldier_AR_F",
                "O_HeavyGunner_F"
            ];
            VEHICLE_ENEMY = ["O_MRAP_02_hmg_F"];
            ARMOR_ENEMY = ["O_MBT_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"];
            UNITS_MARKSMAN = ["O_soldier_M_F","O_Sharpshooter_F","O_sniper_F"];
        };
    };
};
true
