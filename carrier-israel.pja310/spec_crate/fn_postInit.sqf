#include "grenade.hpp"
#include "launcher.hpp"
#include "standardAmmo.hpp"

if(isServer) then {
    {
        if(_x isKindOf "ReammoBox_F") then {
            switch (typeOf _x) do {
                case ("TTT_Logistik_Standardmunition_Us") : {
                    [_x, CRATE_STANDARD_AMMO_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Logistik_Werfer_Us") : {
                    [_x, CRATE_LAUNCHER_CONTENT] call Spec_crate_fnc_filler;
                };
                case ("TTT_Logistik_Granaten_Us") : {
                    [_x, CRATE_GRENADE_CONTENT] call Spec_crate_fnc_filler;
                };
            };
        };
    } forEach vehicles;
};