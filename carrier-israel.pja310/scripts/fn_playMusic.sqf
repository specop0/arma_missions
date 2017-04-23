if(params [ ["_musicName","",[""]] ]) then {
    {
        deleteVehicle _x;
    } forEach allMissionObjects "#soundonvehicle";
    {
        _x say3D _musicName;
    } forEach [radioAhelper, radioBhelper];
};