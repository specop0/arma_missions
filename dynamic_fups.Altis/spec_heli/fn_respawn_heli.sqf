#include "const.hpp"

if(isServer) then {
    params [ ["_respawnMedic",true,[true]] ];
    if(_respawnMedic) then {
        {
            deleteVehicle _x;
        } forEach crew MEDEVAC_ID;
        deleteVehicle MEDEVAC_ID;
        MEDEVAC_ID = "CUP_B_UH60L_Unarmed_FFV_MEV_US" createVehicle getPos MEDEVAC_HELIPAD_BASE_ID;
        MEDEVAC_ID setPos getPos MEDEVAC_HELIPAD_BASE_ID;
        MEDEVAC_ID setDir direction MEDEVAC_HELIPAD_BASE_ID;
        createVehicleCrew MEDEVAC_ID;
        {
            _x addCuratorEditableObjects [[MEDEVAC_ID],true];
        } forEach allCurators;
        publicVariable "weiss";
    } else {
        {
            deleteVehicle _x;
        } forEach crew HELI_TAXI_ID;
        deleteVehicle HELI_TAXI_ID;
        HELI_TAXI_ID = "TTT_Logistikhelikopter_Us_Woodland" createVehicle getPos HELI_TAXI_HELIPAD_BASE_ID;
        HELI_TAXI_ID setPos getPos HELI_TAXI_HELIPAD_BASE_ID;
        HELI_TAXI_ID setDir direction HELI_TAXI_HELIPAD_BASE_ID;
        createVehicleCrew HELI_TAXI_ID;
        {
            _x addCuratorEditableObjects [[HELI_TAXI_ID],true];
        } forEach allCurators;
        publicVariable "bussard";
    };
} else {
    _this remoteExec ["Spec_fnc_respawn_heli",2];
};