private _parameterCorrect = params [ ["_crate",objNull,[objNull]] ];

if(_parameterCorrect && hasInterface) then {
    _crate addAction ["<t color='#579D1C'>Munition (Hauptwaffe)</t>",{ _this call Spec_crates_fnc_addAmmo; }, [], 1.5, false, true, "", "true", 5];
    _crate addAction ["<t color='#579D1C'>Medizinisches Material</t>",{ _this call Spec_crates_fnc_medic; }, [], 1.5, false, true, "", "true", 5];
    _crate addAction ["<t color='#FF950E'>Kiste leeren",{
        params ["_target","_caller"];
        clearBackpackCargoGlobal _target;
        clearItemCargoGlobal _target;
        clearMagazineCargoGlobal _target;
        clearWeaponCargoGlobal _target;
    }, [], 1.5, false, true, "", "true", 5];
    _crate addAction ["<t color='#EE0000'>Kiste löschen</t>",{
        params ["_target","_caller"];
        deleteVehicle _target;
    }, [], 1.5, false, true, "", "true", 5];
    _crate addAction ["Granaten",{
        private _parameterCorrect = params [["_crate",objNull,[objNull]], ["_player",objNull,[objNull]] ];
        _crate addItemCargoGlobal ["SmokeShell",36];
        _crate addItemCargoGlobal ["SmokeShellRed",12];
        _crate addItemCargoGlobal ["SmokeShellGreen",12];
        _crate addItemCargoGlobal ["SmokeShellPurple",12];
        _crate addItemCargoGlobal ["ACE_M84",12];
    }, [], 1.5, false, true, "", "true", 5];
    private _cargoItems = [
        ["M136 (RHS)","rhs_weap_M136"],["AT4 (UK3CB AP)","UK3CB_BAF_AT4_CS_AP_Launcher"],
        ["Pzf3","BWA3_PzF3_Tandem_Loaded"],
        ["RPG7 (RHS)","rhs_weap_rpg7"],
        ["NLAW","launch_NLAW_F"],["SMAW (CUP)","CUP_launch_Mk153Mod0"],["SMAW (RHS)","rhs_weap_smaw"],["RGW90","BWA3_RGW90"],
        ["Javelin (CUP)","CUP_launch_Javelin"],["Javelin (RHS)","rhs_weap_fgm148"],
        ["Titan AT","launch_I_Titan_short_F"],
        ["Stinger (CUP)","CUP_launch_FIM92Stinger"],["Fliegerfaust","BWA3_Fliegerfaust"],["Titan AA","launch_B_Titan_F"]
    ];
    {
        _x params ["_displayName","_className"];
        _crate addAction [_displayName, {
            params ["_target"];
            (_this select 3) params ["_cargoItem"];
            _target addWeaponCargoGlobal [_cargoItem,2];
            // add magazines
            private _magazines = getArray (configFile >> "CfgWeapons" >> _cargoItem >> "Magazines");
            {
                _target addMagazineCargoGlobal [_x,3];
            } forEach _magazines;
        }, [_className], 1.5, false, true, "", "true", 5];
    } forEach _cargoItems;
};
true
