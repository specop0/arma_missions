dockBottom setObjectTextureGlobal [0, "pictures\up.paa"];
dockTop setObjectTextureGlobal [0, "pictures\down.paa"];

{
    _x setFlagTexture "pictures\flag_israel.paa";
} forEach [flagA, flagB];

// hide some buildings in Mansoura
{
    _x params ["_pos","_distance"];
    {
        hideObjectGlobal _x;
        _x allowDamage false;
    } forEach nearestTerrainObjects [_pos ,["House"],_distance];
    {
        if(typeOf _x in ["Land_Terrace_K_1_EP1"]) then {
            hideObjectGlobal _x;
            _x allowDamage false;
        };
    } forEach nearestTerrainObjects [_pos ,[],_distance];
} forEach [
    [[6656.33,17368.2,0],50],
    [[6541.25,17385.1,0],50]
];

private _scriptHandle = [] spawn {
    // ramp in carrier for HEMTT
    ramp attachTo [LHD, [4.6,-35.0898,-12.4]];
    ramp setVectorDirAndUp [[0,0.962128,0.272599],[0,-0.272599,0.962128]];
    sleep 1;
    detach ramp;
    while { true } do {
        {
            _x params ["_musicName", "_duration"];
            [_musicName] remoteExecCall ["Spec_fnc_playMusic"];
            sleep _duration;
        } forEach [
            ["musicA", 190],
            ["musicB", 209],
            ["musicC", 231],
            ["musicD", 221],
            ["musicE", 277],
            ["musicF", 221]
        ];
    };
};
