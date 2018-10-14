#include "addItemToContainer.hpp"

private _parameterCorrect = params [ ["_object",objNull,[objNull]] ];
if(_parameterCorrect && hasInterface) then {
    Spec_var_loadoutFaction = "MAIN";
    if(isNil "Spec_var_loadoutFactionList") then {
        [] call Spec_fnc_initLoadoutLists;
    };

    // selection faction
    private _conditionString = "";
    private _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
    {
        _object addAction [_x, {
            (_this select 3) params ["_factionName"];
            Spec_var_loadoutFaction = _factionName;
        }, [_x], -2, false, false, "", _conditionString];
    } forEach Spec_var_loadoutFactionList;

    // for each faction add classes
    private _i = -4;
    private _factionName = "MAIN";
    {
        _factionName = _x;
        _i = -4;
        
        _conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
        _object addAction ["Benutze Slot",{
                params ["","_caller"];
                (_this select 3) params ["_factionName"];
                // set mission time to current -> TFAR frequencies will be set
                _caller setVariable ["Spec_var_timeAtInit", serverTime];
                [[_caller, typeOf _caller], _factionName] call Spec_fnc_loadoutFaction;
                Spec_var_loadoutFaction = "MAIN";
            }, [_factionName], _i, false, true, "", _conditionString];
        // for each class addAction
        {
            _object addAction [(_x select 0), {
                    params ["","_caller"];
                    (_this select 3) params ["_type","_factionName"];
                    // set mission time to current -> TFAR frequencies will be set
                    _caller setVariable ["Spec_var_timeAtInit", serverTime];
                    [[_caller, _type], _factionName] call Spec_fnc_loadoutFaction;
                    Spec_var_loadoutFaction = "MAIN";
                }, [_x select 1,_factionName], _i, false, true, "", _conditionString];
            _i = _i - 1;
        } forEach Spec_var_loadoutClassList;
    } forEach Spec_var_loadoutFactionList;
    private _minimumActionIndex = _i;
    
    // add scopes
    /*_factionName = "SCOPES";
    _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
    _object addAction [_factionName, {
        (_this select 3) params ["_factionName"];
        Spec_var_loadoutFaction = _factionName;
    }, [_factionName], -2, false, false, "", _conditionString];
    private _scopes = ["optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg",
        "optic_Hamr","optic_Arco","optic_MRCO",
        "optic_Holosight","optic_Holosight_smg","rhsusf_acc_eotech_552",
        "rhsusf_acc_ACOG","rhsusf_acc_ELCAN",
        "CUP_bipod_Harris_1A2_L","CUP_bipod_VLTOR_Modpod"
    ];
    _conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
    _i = -4;
    {
        _object addAction [_x, {
            params ["","_caller"];
            (_this select 3) params ["_item"];
            if !(_item in items _caller) then {
                [_caller,_item,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            };
            Spec_var_loadoutFaction = "MAIN";
        }, [_x], _i, false, true, "", _conditionString];
        _i = _i - 1;
    } forEach _scopes;
    if(_i < _minimumActionIndex) then {
        _minimumActionIndex = _i;
    };*/
    
    
    // change m4 variants
    _factionName = "M4_VARIANTS";
    _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
    _object addAction [_factionName, {
        (_this select 3) params ["_factionName"];
        Spec_var_loadoutFaction = _factionName;
    }, [_factionName], -2, false, false, "", _conditionString];
    private _weapons = ["rhs_weap_m16a4","rhs_weap_m16a4_grip","rhs_weap_m16a4_carryhandle_M203",
        "rhs_weap_m4","rhs_weap_m4_grip","rhs_weap_m4_m320",
        "rhs_weap_m4a1","rhs_weap_m4a1_grip","rhs_weap_m4a1_m320",
        "rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle_grip","rhs_weap_m4a1_carryhandle_m203S"
    ];
    _conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
    _i = -4;
    {
        _object addAction [_x, {
            params ["","_caller"];
            (_this select 3) params ["_weapon"];
            private _magazines = primaryWeaponMagazine _caller;
            private _items = primaryWeaponItems _caller;
            _caller removeWeapon primaryWeapon _caller;
            {
                [_caller,_x,ADD_ANYWHERE] call Spec_fnc_addItemToContainer;
            } forEach _magazines;
            _caller addWeapon _weapon;
            {
                _caller addPrimaryWeaponItem _x;
            } forEach _items;
            Spec_var_loadoutFaction = "MAIN";
        }, [_x], _i, false, true, "", _conditionString];
        _i = _i - 1;
    } forEach _weapons;
    if(_i < _minimumActionIndex) then {
        _minimumActionIndex = _i;
    };
    
    // add ace action for helicopter scripts
    _factionName = "HELI_SCRIPT";
    _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
    _object addAction [_factionName, {
        (_this select 3) params ["_factionName"];
        Spec_var_loadoutFaction = _factionName;
    }, [_factionName], -2, false, false, "", _conditionString];
    _conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
    _object addAction ["MedEvac/Weiss",{
        params ["_target","_caller"];
        private _actionMedevac = ["Spec_action_callMedevac", "Rufe Weiss", "", {_this remoteExec ["Spec_fnc_heli_medevac",2]}, {true}] call ace_interact_menu_fnc_createAction;
        [_caller,1, ["ACE_SelfActions"], _actionMedevac] call ace_interact_menu_fnc_addActionToObject;
        
        Spec_var_loadoutFaction = "MAIN";
    }, [], -4, false, true, "", _conditionString];
    _object addAction ["Logistik/Bussard",{
        params ["_target","_caller"];
        private _actionBussard = ["Spec_action_callBussard", "Rufe Bussard", "", {_this remoteExec ["Spec_fnc_heli_taxi",2]}, {true}] call ace_interact_menu_fnc_createAction;
        [_caller,1, ["ACE_SelfActions"], _actionBussard] call ace_interact_menu_fnc_addActionToObject;
        
        if !(_caller getVariable ["hasClickEvent",false]) then {
            [] call Spec_fnc_moveMarkerLZ;
            _caller setVariable ["hasClickEvent",true];
        } else {
            _action = ["Spec_action_moveMarkerLZ", "Bewege LZ", "", {(_this select 0) setVariable ["Spec_var_selectLZ", true]}, {true}] call ace_interact_menu_fnc_createAction;
            [_caller,1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
        };
        
        Spec_var_loadoutFaction = "MAIN";
    }, [], -5, false, true, "", _conditionString];
    _object addAction ["Nachschubkiste",{
        params ["_target","_caller"];
        private _actionAmmoBox = ["Spec_action_spawnAmmoBox", "Nachschubkiste", "", {_this remoteExec ["Spec_crates_fnc_spawnAmmoBox",2]}, {true}] call ace_interact_menu_fnc_createAction;
        [_caller,1, ["ACE_SelfActions"], _actionAmmoBox] call ace_interact_menu_fnc_addActionToObject;
        Spec_var_loadoutFaction = "MAIN";
    }, [], -6, false, true, "", _conditionString];
    _object addAction ["Entferne Actions",{
        params ["_target","_caller"];
        [_caller,1,["ACE_SelfActions", "Spec_action_moveMarkerLZ"]] call ace_interact_menu_fnc_removeActionFromObject; 
        [_caller,1,["ACE_SelfActions", "Spec_action_callMedevac"]] call ace_interact_menu_fnc_removeActionFromObject; 
        [_caller,1,["ACE_SelfActions", "Spec_action_callBussard"]] call ace_interact_menu_fnc_removeActionFromObject; 
        [_caller,1,["ACE_SelfActions", "Spec_action_spawnAmmoBox"]] call ace_interact_menu_fnc_removeActionFromObject; 
        
        Spec_var_loadoutFaction = "MAIN";
    }, [], -7, false, true, "", _conditionString];
    
    // add items to cargo (launcher / weapon only)
    _factionName = "ADD_LAUNCHER";
    _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
    _object addAction [_factionName, {
        (_this select 3) params ["_factionName"];
        Spec_var_loadoutFaction = _factionName;
    }, [_factionName], -2, false, false, "", _conditionString];
    private _cargoItems = [
        ["M136 (RHS)","rhs_weap_M136"],["AT4 (UK3CB AP)","UK3CB_BAF_AT4_CS_AP_Launcher"],
        ["Pzf3","BWA3_PzF3_Tandem_Loaded"],
        ["RPG7 (RHS)","rhs_weap_rpg7"],
        ["NLAW","launch_NLAW_F"],["SMAW (CUP)","CUP_launch_Mk153Mod0"],["SMAW (RHS)","rhs_weap_smaw"],["RGW90","BWA3_RGW90"],
        ["Javelin (CUP)","CUP_launch_Javelin"],["Javelin (RHS)","rhs_weap_fgm148"],
        ["Titan AT","launch_I_Titan_short_F"],
        ["Stinger (CUP)","CUP_launch_FIM92Stinger"],["Fliegerfaust","BWA3_Fliegerfaust"],["Titan AA","launch_B_Titan_F"]
    ];
    _conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
    _i = -4;
    {
        _x params ["_displayName","_className"];
        _object addAction [_displayName, {
            params ["_target"];
            (_this select 3) params ["_cargoItem"];
            _target addWeaponCargoGlobal [_cargoItem,2];
            // add magazines
            _magazines = getArray (configFile >> "CfgWeapons" >> _cargoItem >> "Magazines");
            {
                _target addMagazineCargoGlobal [_x,3];
            } forEach _magazines;
            Spec_var_loadoutFaction = "MAIN";
        }, [_className], _i, false, true, "", _conditionString];
        _i = _i - 1;
    } forEach _cargoItems;
    if(_i < _minimumActionIndex) then {
        _minimumActionIndex = _i;
    };
    
    // add other stuff to box (e.g. weapon with some scopes, toolkits)
    _factionName = "ADD_STUFF";
    _conditionString = "Spec_var_loadoutFaction isEqualTo ""MAIN"";";
    _object addAction [_factionName, {
        (_this select 3) params ["_factionName"];
        Spec_var_loadoutFaction = _factionName;
    }, [_factionName], -2, false, false, "", _conditionString];
#define MARKSMAN_DEFAULT_ITEMS ["optic_DMS",2],["optic_SOS",2],["ACE_RangeCard",2],
    private _itemsAndCount = [
        ["Toolkit", [["ToolKit",4]]],
        ["Wire Cutter",[["ACE_wirecutter",4]]],
        ["M6 60mm Mortar (UK3CB)", [
            ["UK3CB_BAF_M6",2],
            ["UK3CB_BAF_1Rnd_60mm_Mo_Shells",8],
            ["ACE_Vector",2]
        ]],
        ["Mk11 (RHS)", [
            MARKSMAN_DEFAULT_ITEMS
            ["rhs_weap_sr25_ec",2],
            ["rhsusf_acc_harris_bipod",2],
            ["rhsusf_20Rnd_762x51_m118_special_Mag",16]
        ]],
        ["Mk14 / DMR", [
            MARKSMAN_DEFAULT_ITEMS
            ["srifle_EBR_F",2],
            ["rhs_acc_harris_swivel",2],
            ["20Rnd_762x51_Mag",16]
        ]],
        ["G3", [
            ["hlc_rifle_g3sg1",2],
            ["hlc_optic_accupoint_g3",2],
            ["HLC_Optic_ZFSG1",2],
            ["ACE_RangeCard",2],
            ["hlc_20rnd_762x51_b_G3",16]
        ]],
        ["M16A4", [
            MARKSMAN_DEFAULT_ITEMS
            ["rhs_weap_m16a4_carryhandle_grip2",2],
            ["rhsusf_acc_harris_bipod",2],
            ["rhsusf_acc_M8541",2],
            ["30Rnd_556x45_Stanag",16]
        ]]
    ];
    _conditionString = format ["Spec_var_loadoutFaction isEqualTo ""%1"";", _factionName];
    _i = -4;
    {
        _x params ["_displayName","_itemsAndCount"];
        _object addAction [_displayName, {
            params ["_target"];
            [_target, (_this select 3), false] remoteExecCall ["Spec_crates_fnc_filler",2];
            Spec_var_loadoutFaction = "MAIN";
        }, _itemsAndCount, _i, false, true, "", _conditionString];
        _i = _i - 1;
    } forEach _itemsAndCount;
    if(_i < _minimumActionIndex) then {
        _minimumActionIndex = _i;
    };
    
    // clear cargo of loadoutBox
    _i = _minimumActionIndex - 1;
    _object addAction ["Leere Box", {
        params ["_target","_caller"];
        clearBackpackCargoGlobal _target;
        clearItemCargoGlobal _target;
        clearMagazineCargoGlobal _target;
        clearWeaponCargoGlobal _target;
    }, nil, _i, false, true, "", "Spec_var_loadoutFaction isEqualTo ""MAIN"";"];
    clearBackpackCargoGlobal _object;
    clearItemCargoGlobal _object;
    clearMagazineCargoGlobal _object;
    clearWeaponCargoGlobal _object;
    
    _object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_var_loadoutFaction = "MAIN";}, nil, -2, false, false, "", "!(Spec_var_loadoutFaction isEqualTo ""MAIN"")"];
    _object addAction ["<t color=""#A50000"">Zurueck</t>", {Spec_var_loadoutFaction = "MAIN";}, nil, _i, false, false, "", "!(Spec_var_loadoutFaction isEqualTo ""MAIN"")"];
};
