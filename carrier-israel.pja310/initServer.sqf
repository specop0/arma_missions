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
    } forEach nearestTerrainObjects [_pos ,["House"],_distance];
    {
        if(typeOf _x in ["Land_Terrace_K_1_EP1"]) then {
            hideObjectGlobal _x;
        };
    } forEach nearestTerrainObjects [_pos ,[],_distance];
} forEach [
    [[6656.33,17368.2,0],50],
    [[6541.25,17385.1,0],50]
];

private _scriptHandle = [] spawn {
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
