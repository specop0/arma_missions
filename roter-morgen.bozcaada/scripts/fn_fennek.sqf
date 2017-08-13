params [ ["_vehicle",objNull,[objNull]] ];

if(!isNull _vehicle && isServer) then {
    [_vehicle] call Spec_fnc_addDestroyOnGetIn;

    _vehicle setObjectTextureGlobal [0,'\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa'];
    _vehicle setObjectTextureGlobal [1,'\A3\data_f\vehicles\turret_co.paa'];
};
true
