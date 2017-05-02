// base parameter
#define BASE_MARKER "respawn"
#define BASE_RADIUS 1500
#define MAP_SIZE getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize")
#define MAP_CENTER getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition")

#define CLEAN_UP_OBJECT laptop
#define CLEAN_UP_STRING "Clean Up %1"

// parameter for cities / enemy locations
#define LOCATIONS_ARRAY Spec_var_locations
#define LOCATION_ICON "hd_objective"
//"ColorUNKNOWN"
#define LOCATION_COLOR "ColorEAST"
#define LOCATION_COLOR_DONE "ColorWEST"
#define LOCATION_TEXT "OBJ %1"

#define MARKER_BASENAME "Spec_marker_%1"
#define MARKER_COUNTER Spec_var_markerCounter
#define MARKER_CLEANUP_AVAILABLE "%1_cleanupAvailable"

#define SPAWNED_OBJECTS_ARRAY Spec_var_spawnedObjects

// parameter for spawning enemies
#define SLEEP_TIME 1
#define SLEEP_TIME_PER_GROUP 1

// group size (in city)
#define EXTRA_GROUP_VAR Spec_dynamic_extraGroup
#define GROUP_SIZE round( random [2,4,6] )
#define GROUP_PER_PLAYER_MULTI 0.21
#define NUMBER_OF_GROUPS EXTRA_GROUP_VAR + 1 + round( random [0, (count allPlayers) * GROUP_PER_PLAYER_MULTI, ceil( (count allPlayers) * GROUP_PER_PLAYER_MULTI)] )

// sentry size (distance from city)
#define SENTRY_SIZE round( random [2,2.4,2.9] )
#define SENTRY_DISTANCE 800

// extra marksman sentry for hill locations
#define HILL_DISTANCE 1000

// vehicle (in city)
#define EXTRA_VEHICLE_VAR Spec_dynamic_extraVehicle
#define VEHICLE_PER_PLAYER_MULTI 0.11
#define NUMBER_OF_VEHICLES EXTRA_VEHICLE_VAR + round( random [0, (count allPlayers) * VEHICLE_PER_PLAYER_MULTI, ceil( (count allPlayers) * VEHICLE_PER_PLAYER_MULTI)] )
#define VEHICLE_SPAWN_RADIUS 100

// armored vehicle (in city)
#define EXTRA_ARMOR_VAR Spec_dynamic_extraArmor
#define ARMOR_PER_PLAYER_MULTI 0.051
#define NUMBER_OF_ARMORED EXTRA_ARMOR_VAR + round( random [0, (count allPlayers) * ARMOR_PER_PLAYER_MULTI, ceil( (count allPlayers) * ARMOR_PER_PLAYER_MULTI)] )

// enemy unit types
#define ENEMY_SIDE Spec_dynamic_side
#define UNITS_ENEMY Spec_dynamic_unitsEnemy
#define VEHICLE_ENEMY Spec_dynamic_vehicleEnemy
#define ARMOR_ENEMY Spec_dynamic_armorEnemy
#define UNITS_MARKSMAN Spec_dynamic_marksmanEnemy

#define VEHICLE_LARGE_TYPE "CUP_B_C130J_USMC"
#define ENEMY_SIDE_ARRAY Spec_dynamic_sideArray

// static weapons (currently not supported)
#define BUNKER "Land_BagBunker_Small_F"
#define BUNKER_OFFSET_Z -0.15
// "I_HMG_01_high_F"
#define UNITS_HMG "rhs_KORD_high_MSV"
#define HMG_IN_BUNKER_OFFSET [-0.4,0,-0.8]

// functions
#define FNC_ADD_CONTROL_ACTIONS Spec_dynamic_fnc_addControlActions
#define FNC_INIT_LOCATIONS_ARRAY Spec_dynamic_fnc_initCityList
#define FNC_SELECT_LOCATION Spec_dynamic_fnc_selectCity
#define FNC_CLEAN_UP Spec_dynamic_fnc_cleanUp
#define FNC_SELECT_ENEMY Spec_dynamic_selectEnemy