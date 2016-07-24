{
    [_x,"Land_fortified_nest_small","Bunker (klein)",3,6] call Spec_construct_fnc_objectAddConstructionStation;
    [_x,"Land_fortified_nest_big","Bunker (gross)",5,2] call Spec_construct_fnc_objectAddConstructionStation;
    [_x,"Land_BagFence_Long_F","Sandsackwall (lang)",2,20] call Spec_construct_fnc_objectAddConstructionStation;
    [_x,"Land_BagFence_Round_F","Sandsackwall (rund)",2,10] call Spec_construct_fnc_objectAddConstructionStation;
    [_x,"Land_BagFence_Corner_F","Sandsackwall (Ecke)",1,10] call Spec_construct_fnc_objectAddConstructionStation;
    [_x,"Land_Razorwire_F","Stacheldraht",2,15] call Spec_construct_fnc_objectAddConstructionStation;
} forEach [construct_station1,construct_station2]