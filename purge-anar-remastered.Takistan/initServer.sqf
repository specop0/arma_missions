{
    if(side _x == CIVILIAN) then {
        _x setVariable ["acex_headless_blacklist", true];
        _x forceSpeed 0;
    };
} forEach allUnits;