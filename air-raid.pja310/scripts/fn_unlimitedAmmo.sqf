if(isServer) then {
    {
        if(typeOf _x isEqualTo "UK3CB_BAF_Static_L111A1_Deployed_High") then {
            _x addEventHandler ["Fired",{
                params ["_vehicle"];
                if (_vehicle ammo "UK3CB_BAF_L111A1_veh" <= 0) then {
                    if(local _vehicle) then {
                        if(_vehicle getVariable ["Spec_unlimitedAmmo",0] < 5) then {
                            //[_vehicle, "UK3CB_BAF_100Rnd_127x99_Box"] call UK3CB_BAF_Equipment_Static_Weapons_fnc_addMagazine;
                            _vehicle setVehicleAmmoDef 1;
                            _vehicle setVariable ["Spec_unlimitedAmmo", (_vehicle getVariable ["Spec_unlimitedAmmo",0]) + 1];
                        } else {
                            doGetOut crew _vehicle;
                        };
                    };
                };
            }];
        };
    } forEach vehicles;
};