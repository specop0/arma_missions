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

if(isServer) then {
    {
        if(_x isKindOf "ReammoBox_F") then {
            switch (typeOf _x) do {
                // at and aa launcher
                case ("TTT_Logistik_Werfer_Bw") : {
                    [_x,
                        [
                            ["BWA3_Pzf3", 2],
                            ["BWA3_Pzf3_IT", 2],
                            ["BWA3_Fliegerfaust", 2],
                            ["BWA3_Fliegerfaust_Mag", 2]
                        ]
                    ] call Spec_crate_fnc_filler;
                };
                // grenades
                case ("TTT_Logistik_Granaten_Bw") : {
                    [_x,
                        [
                            ["SmokeShell",36],
                            ["SmokeShellGreen",12],
                            ["SmokeShellGreen",12],
                            ["SmokeShellPurple",12],
                            ["ACE_M84",12],
                            ["ACE_IR_Strobe_Item",12]
                        ]
                    ] call Spec_crate_fnc_filler;
                };
                // enemy crate with some random values
                case ("I_CargoNet_01_ammo_F") : {
                    [_x, [
                        ["CUP_lmg_PKM",4],
                        ["CUP_arifle_M16A2",4],
                        ["CUP_arifle_AKM",4],
                        ["CUP_launch_RPG7V",2],
                        ["CUP_30Rnd_556x45_Stanag",24 + floor(random(8))],
                        ["CUP_30Rnd_762x39_AK47_M",24 + floor(random(8))],
                        ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",6 + floor(random(4))],
                        ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",3 + floor(random(2))],
                        ["CUP_PG7VL_M",4]
                    ]] call Spec_crate_fnc_filler;
                };
            };
        };
    } forEach vehicles;
};