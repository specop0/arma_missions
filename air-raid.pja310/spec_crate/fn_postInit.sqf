if(isServer) then {
    {
        if(_x isKindOf "NATO_Box_Base") then {
            switch (typeOf _x) do {
                case ("TTT_Logistik_Medic_Us") : {
                    [_x] call Spec_crate_fnc_medic;
                };
                case ("TTT_Logistik_Standardmunition_Us") : {
                    [_x] call Spec_crate_fnc_standardAmmo;
                };
                case ("TTT_Logistik_Werfer_Us") : {
                    [_x] call Spec_crate_fnc_launcher;
                };
                case ("TTT_Logistik_Granaten_Us") : {
                    [_x] call Spec_crate_fnc_grenade;
                };
            };
        };
    } forEach vehicles;
};