/*
    Author: Spec

    Description:
    Runs at post init and fills the crates of given type with the content.
    For example, fills the TTT default ammunition box (BW) with the defined types.

    Parameter(s):
    -

    Returns:
    true
*/

#define PRIMARY_AMMO "30Rnd_556x45_Stanag"
#define LMG_AMMO "100Rnd_580x42_Mag_F"
#define SECONDARY_AMMO "CUP_15Rnd_9x19_M9"

#define UGL_SMOKE_WHITE "1Rnd_Smoke_Grenade_shell"
#define UGL_SMOKE_RED "1Rnd_SmokeRed_Grenade_shell"
#define UGL_HE "1Rnd_HE_Grenade_shell"

if(isServer) then {
    {
        switch (typeOf _x) do {
            // medic
            case ("ACE_medicalSupplyCrate") : {
                [_x,
                    [
                        ["ACE_fieldDressing", 250],
                        ["ACE_packingBandage", 100],
                        ["ACE_elasticBandage", 25],
                        ["ACE_quikclot", 25],
                        ["ACE_tourniquet", 10],
                        ["ACE_salineIV", 25],
                        ["ACE_salineIV_500", 20],
                        ["ACE_morphine", 15],
                        ["ACE_epinephrine", 15],
                        ["ACE_atropine", 10],
                        ["ACE_personalAidKit", 15],
                        ["ACE_surgicalKit", 15],
                        ["ACE_bodyBag", 10]
                    ]
                ] call Spec_crate_fnc_filler;
                _x setVariable ["ace_cargo_displayName", "Verbandsmaterial", true];
            };
            // ammunition
            case ("Box_NATO_Ammo_F") : {
                [_x,
                    [
                        [PRIMARY_AMMO,50],
                        [LMG_AMMO,9],
                        [UGL_HE,18]
                    ]
                ] call Spec_crate_fnc_filler;
                _x setVariable ["ace_cargo_displayName", "Munition", true];
            };
            // at and aa launcher
            case ("Box_NATO_WpsLaunch_F") : {
                [_x,
                    [
                        ["Titan_AT", 2],
                        ["Titan_AA", 2],
                        ["CUP_launch_M136", 2]
                    ]
                ] call Spec_crate_fnc_filler;
                _x setVariable ["ace_cargo_displayName", "Werfermunition", true];
            };
            // grenades
            case ("Box_NATO_Grenades_F") : {
                [_x,
                    [
                        ["SmokeShell",36],
                        ["SmokeShellGreen",12],
                        ["SmokeShellRed",12],
                        ["SmokeShellPurple",12],
                        ["HandGrenade",12],
                        ["ACE_IR_Strobe_Item",12],
                        [UGL_SMOKE_WHITE,6],
                        [UGL_SMOKE_RED,6]
                    ]
                ] call Spec_crate_fnc_filler;
                _x setVariable ["ace_cargo_displayName", "Granaten", true];
            };
            // explosives
            case ("Box_NATO_AmmoOrd_F") : {
                [_x,
                    [
                        ["ACE_VMH3",1],
                        ["DemoCharge_Remote_Mag",8],
                        ["ACE_M26_Clacker",1],
                        ["ACE_DefusalKit",2],
                        ["ACE_wirecutter",2],
                        ["ToolKit",2]
                    ]
                ] call Spec_crate_fnc_filler;
                _x setVariable ["ace_cargo_displayName", "Pionierausrüstung", true];
            };
        };
    } forEach vehicles;
};