#include "grenade.hpp"
#include "medic.hpp"
#include "launcher.hpp"
#include "standardAmmo.hpp"

if(isServer) then {
    {
        if(_x isKindOf "ReammoBox_F") then {
            switch (typeOf _x) do {
                case ("TTT_Logistik_Medic_Bw") : {
                    [_x, CRATE_MEDIC_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Logistik_Standardmunition_Bw") : {
                    [_x, CRATE_STANDARD_AMMO_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Logistik_Werfer_Bw") : {
                    [_x, CRATE_LAUNCHER_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Logistik_Granaten_Bw") : {
                    [_x, CRATE_GRENADE_CONTENT] call Spec_crate_fnc_filler;
                };
                // enemy
                case ("TTT_Logistik_Standardmunition_Us") : {
                    [_x, [
                            ["30Rnd_556x45_Stanag",40],
                            ["200Rnd_65x39_cased_Box",6],
                            ["9Rnd_45ACP_Mag",8]
                    ]] call Spec_crate_fnc_filler;
                };
                case ("TTT_Logistik_Werfer_Us") : {
                    [_x, [
                        ["Titan_AT", 1],
                        ["Titan_AP", 1],
                        ["launch_NLAW_F", 1],
                        ["Titan_AA", 2]
                    ]] call Spec_crate_fnc_filler;
                };
            };
        };
    } forEach vehicles;
};