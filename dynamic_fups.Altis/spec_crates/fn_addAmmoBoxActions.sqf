private _parameterCorrect = params [ ["_crate",objNull,[objNull]] ];

if(_parameterCorrect && hasInterface) then {
    private _conditionDistance = "_this distance _target < 5";
    _crate addAction ["<t color='#579D1C'>Munition (Hauptwaffe)</t>",{ _this call Spec_crates_fnc_addAmmo; }, [], 1.5, false, true, "", _conditionDistance];
    _crate addAction ["<t color='#579D1C'>Medizinisches Material</t>",{ _this call Spec_crates_fnc_medic; }, [], 1.5, false, true, "", _conditionDistance];
    _crate addAction ["<t color='#FF950E'>Kiste leeren",{
        params ["_target","_caller"];
        clearBackpackCargoGlobal _target;
        clearItemCargoGlobal _target;
        clearMagazineCargoGlobal _target;
        clearWeaponCargoGlobal _target;
    }, [], 1.5, false, true, "", _conditionDistance];
    _crate addAction ["<t color='#EE0000'>Kiste löschen</t>",{
        params ["_target","_caller"];
        deleteVehicle _target;
    }, [], 1.5, false, true, "", _conditionDistance];
    private _cargoItems = [
        "rhs_weap_M136","UK3CB_BAF_AT4_CS_AP_Launcher",
        "BWA3_Pzf3",
        "rhs_weap_rpg7",
        "launch_NLAW_F","rhs_weap_smaw","BWA3_RGW90","CUP_launch_Mk153Mod0",
        "CUP_launch_Javelin","rhs_weap_fgm148",
        "launch_I_Titan_short_F",
        "CUP_launch_FIM92Stinger","BWA3_Fliegerfaust","launch_B_Titan_F"
    ];
    {
        _crate addAction [_x, {
            params ["_target"];
            (_this select 3) params ["_cargoItem"];
            _target addWeaponCargoGlobal [_cargoItem,2];
            // add magazines
            private _magazines = getArray (configFile >> "CfgWeapons" >> _cargoItem >> "Magazines");
            {
                _target addMagazineCargoGlobal [_x,3];
            } forEach _magazines;
        }, [_x], 1.5, false, true, "", _conditionDistance];
    } forEach _cargoItems;
};
true
