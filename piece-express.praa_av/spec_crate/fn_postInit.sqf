if(isServer) then {
    {
        if(_x isKindOf "NATO_Box_Base") then {
            switch (typeOf _x) do {
                case ("TTT_Crate_Medic_Doctor_US") : {
                    [_x] call Spec_crate_fnc_medic;
                };
                case ("TTT_Crate_Ammo_Standard_US") : {
                    [_x] call Spec_crate_fnc_standardAmmo;
                };
                case ("TTT_Crate_Ammo_Launcher_BW") : {
                    [_x] call Spec_crate_fnc_launcher;
                };
                case ("TTT_Crate_Ammo_Grenade_US") : {
                    [_x] call Spec_crate_fnc_grenade;
                };
            };
        };
    } forEach vehicles;
};