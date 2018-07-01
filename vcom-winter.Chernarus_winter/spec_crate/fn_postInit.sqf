#include "grenade.hpp"
#include "medic.hpp"
#include "launcher.hpp"
#include "standardAmmo.hpp"

if(isServer) then {
    {
        if(_x isKindOf "ReammoBox_F") then {
            switch (typeOf _x) do {
                case ("TTT_Crate_Medic_Doctor_BW") : {
                    [_x, CRATE_MEDIC_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Crate_Ammo_Standard_BW") : {
                    [_x, CRATE_STANDARD_AMMO_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Crate_Weapons_Launcher_BW") : {
                    [_x, CRATE_LAUNCHER_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Crate_Ammo_Grenade_BW") : {
                    [_x, CRATE_GRENADE_CONTENT] call Spec_crate_fnc_filler;
                };
                // small brown
                case ("rhs_3Ya40_1_single") : {
                    [_x, [
                        ["rhs_30Rnd_545x39_AK", 20 + random(15)]
                    ]] call Spec_crate_fnc_filler;
                };
                // medium green
                case ("Box_Syndicate_Ammo_F") : {
                    [_x, [
                        ["rhs_30Rnd_545x39_AK", 20 + random(15)],
                        ["rhs_10Rnd_762x54mmR_7N1", random(6)]
                    ]] call Spec_crate_fnc_filler;
                };
                // medium
                case ("Box_NATO_Ammo_F") : {
                    [_x, [
                        ["rhs_30Rnd_545x39_AK", 30 + random(15)],
                        ["APERSTripMine_Wire_Mag", random(6)]
                    ]] call Spec_crate_fnc_filler;
                };
                // big green
                case ("rhs_7ya37_1_single") : {
                    [_x, [
                        ["rhs_weap_ak74", 1 + random(1)],
                        ["rhs_30Rnd_545x39_AK", 20 + random(15)]
                    ]] call Spec_crate_fnc_filler;
                };
                // big white
                case ("Box_IND_Wps_F") : {
                    [_x, [
                        ["rhs_weap_ak74", 8]
                    ]] call Spec_crate_fnc_filler;
                };
                // explosive
                case ("Box_IND_AmmoOrd_F") : {
                    [_x, [
                        ["DemoCharge_Remote_Mag", 8],
                        ["APERSTripMine_Wire_Mag", 4],
                        ["ACE_Clacker", 2]
                    ]] call Spec_crate_fnc_filler;
                };
            };
        };
    } forEach vehicles;
};