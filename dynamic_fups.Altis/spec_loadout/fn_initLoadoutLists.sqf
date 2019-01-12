#include "classVariables.hpp"

private _loadoutFactionList = [];
_loadoutFactionList pushBack "NATO";
_loadoutFactionList pushBack "AAF";
_loadoutFactionList pushBack "CSAT";
_loadoutFactionList pushBack "NATO_PACIFIC";
_loadoutFactionList pushBack "CSAT_PACIFIC";
// CUP
if (["CUP_arifle_M16A4_Base"] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "CUP_USSOCOM";
};
if ([["CUP_arifle_M16A4_Base","MNP_CombatUniform_ROKMC"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "KOREA";
};
// RHS
if ([["rhs_m4a1_grip_acog","rhs_uniform_cu_ucp"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "USARMY";
};
if ([["rhs_m4a1_grip_acog","rhs_uniform_FROG01_d"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "USMC";
};
if ([["rhs_m4a1_grip_acog","rhs_uniform_FROG01_m81"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "USSOCOM";
};
if ([["rhs_m4a1_grip_acog","MNP_CombatUniform_USMC_arctic"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "US_WINTER";
};
if ([["rhs_weap_ak74m_camo","rhs_uniform_flora_patchless"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "RUS";
};
if ([["rhs_weap_ak74m_camo","rhs_uniform_flora_patchless_alt"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "RUS_ALT";
};
//3CB
if ([["UK3CB_BAF_L85A2","UK3CB_BAF_U_CombatUniform_MTP"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "UK";
};
if ([["UK3CB_BAF_L85A2","MNP_CombatUniform_USMC_arctic"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "UK_WINTER";
};
//BW
if ([["hlc_rifle_G36KE1","BWA3_Uniform_Fleck"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "BW_TROPEN";
};
if ([["hlc_rifle_G36KE1","BWA3_Uniform_Tropen"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "BW_FLECK";
};
//other / mixed
if ([["MNP_CombatUniform_NOR_A"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "NORWAY_WOOD";
};
if ([["MNP_CombatUniform_NOR_D_A"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "NORWAY_DESERT";
};
if ([["CUP_arifle_AK74","MNP_CombatUniform_Ukrainian","CFP_AssaultPack_M81"], true] call Spec_fnc_isClassNamePresent) then {
    _loadoutFactionList pushBack "UKRAINE";
};
// low tech
_loadoutFactionList pushBack "POLICE";
_loadoutFactionList pushBack "SYNDICAT";
Spec_var_loadoutFactionList = _loadoutFactionList;

private _loadoutClassList = [];
_loadoutClassList pushBack ["AT-Schuetze",CLASS_AT];
_loadoutClassList pushBack ["Feldarzt",CLASS_MEDEVAC];
_loadoutClassList pushBack ["Funker",CLASS_FUNKER];
_loadoutClassList pushBack ["Gefechtssanitaeter",CLASS_MEDIC];
_loadoutClassList pushBack ["Grenadier",CLASS_GL];
_loadoutClassList pushBack ["LMG-Schuetze",CLASS_LMG];
_loadoutClassList pushBack ["Logistik",CLASS_LOGISTIC];
_loadoutClassList pushBack ["MG-Assistent",CLASS_MG_ASSI];
_loadoutClassList pushBack ["MG-Schuetze",CLASS_MG];
_loadoutClassList pushBack ["OPL",CLASS_OPL];
_loadoutClassList pushBack ["Pilot",CLASS_PILOT];
_loadoutClassList pushBack ["Pionier",CLASS_PIO];
_loadoutClassList pushBack ["Truppfuehrer",CLASS_TF];
Spec_var_loadoutClassList = _loadoutClassList;
