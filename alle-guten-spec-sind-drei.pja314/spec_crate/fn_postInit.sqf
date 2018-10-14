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

#define PRIMARY_AMMO "UK3CB_BAF_556_30Rnd"
#define MG_AMMO "UK3CB_BAF_762_100Rnd_T"
#define LMG_AMMO "UK3CB_BAF_762_100Rnd_T"
#define SECONDARY_AMMO "UK3CB_BAF_9_17Rnd"

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
                            ["ACE_fieldDressing", 125],
                            ["ACE_packingBandage", 50],
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
                            [PRIMARY_AMMO,56],
                            [MG_AMMO,6],
                            [UGL_HE,12]
                        ]
                    ] call Spec_crate_fnc_filler;
                    _x setVariable ["ace_cargo_displayName", "Munition", true];
                };
                // at and aa launcher
                case ("Box_NATO_WpsLaunch_F") : {
                    [_x,
                        [
                            ["UK3CB_BAF_Javelin_Slung_Tube", 2],
                            ["rhs_fim92_mag", 2],
                            ["UK3CB_BAF_AT4_CS_AP_Launcher", 2]
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
                            ["ACE_M84",12],
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
                            ["SLAMDirectionalMine_Wire_Mag",4],
                            ["ACE_M26_Clacker",1],
                            ["ACE_DefusalKit",2],
                            ["ACE_wirecutter",2],
                            ["ToolKit",2]
                        ]
                    ] call Spec_crate_fnc_filler;
                    _x setVariable ["ace_cargo_displayName", "Pionierausrüstung", true];
                };
                // enemy crates
                case ("CUP_GuerillaCacheBox") : {
                    [_x, [
                        ["hlc_rifle_G36KE1", 20],
                        ["HLC_Optic_G36dualoptic35x", 20],
                        ["BWA3_P8", 20],
                        ["hlc_30rnd_556x45_EPR_G36", 80],
                        ["BWA3_15Rnd_9x19_P8", 80]
                    ]] call Spec_crate_fnc_filler;
                };
                case ("Box_IED_Exp_F") : {
                    [_x, [
                        ["hlc_30rnd_556x45_EPR_G36", 60],
                        ["BWA3_15Rnd_9x19_P8", 40]
                    ]] call Spec_crate_fnc_filler;
                };
                case ("Box_Syndicate_Wps_F") : {
                    [_x, [
                        ["SmokeShell", 36],
                        ["SmokeShellGreen", 12],
                        ["SmokeShellRed", 12]
                    ]] call Spec_crate_fnc_filler;
                };
                case ("Box_Syndicate_WpsLaunch_F") : {
                    [_x, [
                        ["BWA3_PzF3_Tandem_Loaded", 4]
                    ]] call Spec_crate_fnc_filler;
                };
            };
    } forEach vehicles;
};