if(!isNil "gruen_3") then {
	if(player == gruen_3) then {
		player setVariable ["ace_medical_medicClass", 1];
	};
};
if(!isNil "braun_3") then {
	if(player == braun_3) then {
		player setVariable ["ace_medical_medicClass", 1];
	};
};
if(!isNil "weiss_1") then {
	if(player == weiss_1) then {
		player setVariable ["ace_medical_medicClass", 2];
	};
};
if(!isNil "weiss_3") then {
	if(player == weiss_3) then {
		player setVariable ["ace_medical_medicClass", 2];
	};
};
if(!isNil "z1") then {
	if(player == z1) then {
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;

		player forceAddUniform "MNP_CombatUniform_Police";
		player addVest "V_TacVest_blk_POLICE";
		player addBackpack "tf_rt1523g_black";
		player addHeadgear "MNP_Helmet_UN";

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
	};
};