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
                case ("TTT_Crate_Weapons_Luncher_BW") : {
                    [_x, CRATE_LAUNCHER_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Crate_Ammo_Grenade_BW") : {
                    [_x, CRATE_GRENADE_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("CUP_TKBasicWeapons_EP1") : {
                    [_x, [
                        ["CUP_30Rnd_556x45_Stanag", floor(random(15)) + 60],
                        ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 14 + floor(random(4))]
                    ]] call Spec_crate_fnc_filler;
                };
            };
        };
    } forEach vehicles;
};