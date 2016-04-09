#include "const.hpp"

if(isServer) then {
	if(isNil {LOCATIONS_ARRAY}) then {
		// init variables
		MARKER_COUNTER = 0;
		SPAWNED_OBJECTS_ARRAY = [];
		
		EXTRA_ARMOR_VAR = 0;
		EXTRA_VEHICLE_VAR = 0;
		EXTRA_GROUP_VAR = 0;
		
		// create center
		createCenter EAST;
		createCenter INDEPENDENT;
		createCenter WEST;
	
		// init city list
		LOCATIONS_ARRAY = [];
		private _allLocations = nearestLocations [MAP_CENTER, ["NameCityCapital","NameCity","NameVillage"],MAP_SIZE];
		private _basePos = getMarkerPos BASE_MARKER;
		if( (_basePos select 0) != 0 && (_basePos select 1) != 0) then {
			{
				if(locationPosition _x distance _basePos > BASE_RADIUS) then {
					LOCATIONS_ARRAY pushBack _x;
				};
			} forEach _allLocations;
		} else {
			LOCATIONS_ARRAY = _allLocations;
		};
	};
	if(count LOCATIONS_ARRAY == 0) then {
		["Script Error: No Locations (cities) found"] call BIS_fnc_error;
	};
};

true
