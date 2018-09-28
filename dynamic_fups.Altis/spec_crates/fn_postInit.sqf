/*
    Author: Spec

    Description:
    Runs at post init and fills the crates of given type with the content.
    For example, fills the NATO support with ACE medic stuff.

    Parameter(s):
    -

    Returns:
    true
*/

if(isServer) then {
    {
        if(typeof _x isEqualTo "Box_NATO_Support_F") then {
            [_x, []] call Spec_crates_fnc_filler;
            [_x] call Spec_crates_fnc_medic;
        };
    } forEach vehicles;
};