params [ ["_vehicle",objNull,[objNull]] ];

if(!isNull _vehicle && isServer) then {
    [_vehicle] call Spec_fnc_addDestroyOnGetIn;
    
    _vehicle setObjectTextureGlobal [0, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa"];
    _vehicle setObjectTextureGlobal [1, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa"];
    _vehicle setObjectTextureGlobal [2, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\rcws30_co.paa"];
    _vehicle setObjectTextureGlobal [3, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"];
};
true
