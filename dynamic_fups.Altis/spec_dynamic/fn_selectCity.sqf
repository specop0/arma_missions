#include "const.hpp"

private _scriptHandle = [] spawn {
if(isServer) then {
    if(count LOCATIONS_ARRAY > 0) then {
        private _location = selectRandom LOCATIONS_ARRAY;
        LOCATIONS_ARRAY deleteAt (LOCATIONS_ARRAY find _location);
        private _markerName = format [MARKER_BASENAME,MARKER_COUNTER];
        MARKER_COUNTER = MARKER_COUNTER + 1;
        private _marker = createMarker [_markerName, [0,0]];
        private _posLocation = locationPosition _location;
        private _textLocation = format [LOCATION_TEXT,text _location];
        _posLocation resize 2;
        _marker setMarkerPos _posLocation;
        _marker setMarkerShape "ICON";
        _marker setMarkerType LOCATION_ICON;
        _marker setMarkerText _textLocation;
        _marker setMarkerColor LOCATION_COLOR; 
        _marker setMarkerSize [1,1];
        
        private _locationSize = size _location;
        
        // marker for FUPS
        private _locationMarkerName = format [MARKER_BASENAME,MARKER_COUNTER];
        MARKER_COUNTER = MARKER_COUNTER + 1;
        private _locationMarker = createMarker [_locationMarkerName, [0,0]];
        _locationMarker setMarkerPos _posLocation;
        _locationMarker setMarkerSize _locationSize;
        _locationMarker setMarkerType "Empty";
        _locationMarker setMarkerShape "ELLIPSE";
        _locationMarker setMarkerAlpha 0;
        
        private _spawnedObjects = [];
        private _index = count SPAWNED_OBJECTS_ARRAY;
        SPAWNED_OBJECTS_ARRAY pushBack [];
        
        // spawn units in location
        private _noGroups = NUMBER_OF_GROUPS;
        private ["_unitsPerGroup","_unit","_group","_vehicle","_safePos"];
        for "_i" from 1 to _noGroups do {
            _group = createGroup ENEMY_SIDE;
            for "_j" from 1 to GROUP_SIZE do {
                _unit = _group createUnit [selectRandom UNITS_ENEMY, _posLocation, [], 0, "NONE"];
                [_unit] joinSilent _group;
                _spawnedObjects pushBack _unit;
                sleep SLEEP_TIME;
                // add to curator
                {
                    _x addCuratorEditableObjects [[_unit],false];
                } forEach allCurators;
            };
            // initialize FUPS (and wait for unit to move some distance)
            [leader _group, _locationMarker] call FUPS_fnc_main;
            sleep SLEEP_TIME_PER_GROUP;
        };
        
        // prepare for spawning vehicles
        private _noVehicles = NUMBER_OF_VEHICLES;
        private _noArmored = NUMBER_OF_ARMORED;
        private _vehiclePositions = _posLocation nearRoads 300;
        private _noAllVehicles = (_noVehicles + _noArmored) max 1;
        private _indexDiff = floor ((count _vehiclePositions) / _noAllVehicles);
        private _indexVehicle = 0;
        // TODO error count _vehiclePositions < (_noVehicles + _noArmored)
        
        // spawn vehicle (hmg or gmg)
        if(count _vehiclePositions > 0) then {
            for "_i" from 1 to _noVehicles do {
                _safePos = _vehiclePositions select (floor (_indexDiff * _indexVehicle + 1));
                _indexVehicle = _indexVehicle + 1;
                _vehicle = createVehicle [selectRandom VEHICLE_ENEMY, _safePos, [], 0, "NONE"];
                _spawnedObjects pushBack _vehicle;
                sleep SLEEP_TIME;
                // spawn crew
                createVehicleCrew _vehicle;
                {
                    _spawnedObjects pushBack _x;
                } forEach crew _vehicle;
                sleep SLEEP_TIME;
                // add to curator
                {
                    _x addCuratorEditableObjects [[_vehicle],true];
                } forEach allCurators;
                // initialize FUPS (and wait for unit to move some distance)
                [(crew _vehicle) select 0, _locationMarker] call FUPS_fnc_main;
                sleep SLEEP_TIME_PER_GROUP;
            };
            
            // spawn armored vehicle (tank or apc)
            for "_i" from 1 to _noArmored do {
                _safePos = _vehiclePositions select (floor (_indexDiff * _indexVehicle + 1));
                _indexVehicle = _indexVehicle + 1;
                _vehicle = createVehicle [selectRandom ARMOR_ENEMY, _safePos, [], 0, "NONE"];
                _spawnedObjects pushBack _vehicle;
                sleep SLEEP_TIME;
                // spawn crew
                createVehicleCrew _vehicle;
                {
                    _spawnedObjects pushBack _x;
                } forEach crew _vehicle;
                sleep SLEEP_TIME;
                // add to curator
                {
                    _x addCuratorEditableObjects [[_vehicle],true];
                } forEach allCurators;
                // initialize FUPS (and wait for unit to move some distance)
                [(crew _vehicle) select 0, _locationMarker] call FUPS_fnc_main;
                sleep SLEEP_TIME_PER_GROUP;
            };
        };
        // search for hills nearby
        private _hills = nearestLocations [_posLocation, ["Hill"],HILL_DISTANCE];
        private ["_hillMarkerName","_hillMarker","_posSentry"];
        if(count _hills > 0) then {
            {
                // create marker for usage with fups
                _posSentry = locationPosition _x;
                // create marker at hill
                _group = createGroup ENEMY_SIDE;
                _hillMarkerName = format [MARKER_BASENAME,MARKER_COUNTER];
                MARKER_COUNTER = MARKER_COUNTER + 1;
                _hillMarker = createMarker [_hillMarkerName, [0,0]];
                _hillMarker setMarkerPos _posSentry;
                _hillMarker setMarkerSize (size _x);
                _hillMarker setMarkerType "Empty";
                _hillMarker setMarkerShape "ELLIPSE";
                _hillMarker setMarkerAlpha 0;
                // create units
                for "_j" from 1 to 2 do {
                    _unit = _group createUnit [selectRandom UNITS_MARKSMAN, _posSentry, [], 0, "NONE"];
                    [_unit] joinSilent _group;
                    _spawnedObjects pushBack _unit;
                    sleep SLEEP_TIME;
                    // add to curator
                    {
                        _x addCuratorEditableObjects [[_unit],false];
                    } forEach allCurators;
                };
                // initialize FUPS (and wait for unit to move some distance)
                [leader _group, _hillMarker, "REINFORCEMENT:",[_index] ] call FUPS_fnc_main;
                sleep SLEEP_TIME_PER_GROUP;
            } forEach _hills;
        };
        /*
        // place some HMGs and bunker
        private ["_bunker","_posBunker","_dirBunker"];
        _posBunker = _posLocation;
        _bunker = createVehicle [BUNKER, _posBunker, [], 0, "NONE"];
        _posBunker = getPosASL _bunker;
        _posBunker set [2, (_posBunker select 2) + BUNKER_OFFSET_Z];
        _bunker setPosASL _posBunker;
        _bunker setDir 120;
        _dirBunker = direction _bunker;
        _vehicle = createVehicle [UNITS_HMG, _posBunker, [], 0, "NONE"];
        _vehicle setPos (_bunker modelToWorld HMG_IN_BUNKER_OFFSET);
        _vehicle setDir (_dirBunker + 180);
        */
        
        // place sentries
        private _placeSentries = true;
        private ["_sentryLocation","_sentryDirection","_sentryMarkerName","_sentryMarker"];
        for "_i" from 1 to _noGroups do {
            _group = createGroup ENEMY_SIDE;
            _sentryDirection = floor(random 360);
            _sentryLocation = [
                (_posLocation select 0) + sin(_sentryDirection) * SENTRY_DISTANCE,
                (_posLocation select 1) + cos(_sentryDirection) * SENTRY_DISTANCE,
                0
            ];
            // create marker for usage with fups
            private _sentryMarkerName = format [MARKER_BASENAME,MARKER_COUNTER];
            MARKER_COUNTER = MARKER_COUNTER + 1;
            _sentryMarker = createMarker [_sentryMarkerName, [0,0]];
            _sentryMarker setMarkerPos _sentryLocation;
            _sentryMarker setMarkerSize [SENTRY_DISTANCE/2,SENTRY_DISTANCE/2];
            _sentryMarker setMarkerType "Empty";
            _sentryMarker setMarkerShape "ELLIPSE";
            _sentryMarker setMarkerAlpha 0;

            //_sentryDirection
            for "_j" from 1 to SENTRY_SIZE do {
                _unit = _group createUnit [selectRandom UNITS_ENEMY, _sentryLocation, [], 0, "NONE"];
                [_unit] joinSilent _group;
                _spawnedObjects pushBack _unit;
                sleep SLEEP_TIME;
                // add to curator
                {
                    _x addCuratorEditableObjects [[_unit],false];
                } forEach allCurators;
            };
            [leader _group, _sentryMarker, "REINFORCEMENT:",[_index] ] call FUPS_fnc_main;
            sleep SLEEP_TIME_PER_GROUP;
        };
        
        // set trigger to activate reinforcement group
        private _trigger = createTrigger ["EmptyDetector",_posLocation,false];
        _trigger setTriggerArea [_locationSize select 0, _locationSize select 1, 0, false];
        _trigger setTriggerActivation ["WEST", "PRESENT", true];
        private _sideString = format ["%1",ENEMY_SIDE];
        if(ENEMY_SIDE isEqualTo INDEPENDENT) then {
            _sideString = "INDEPENDENT";
        };
        _trigger setTriggerStatements ["this",
            format ["['%1',[%2],%3,false,true] call FUPS_fnc_reinforcement;",_locationMarker,_index,_sideString],
            ""
        ];
        //_trigger setTriggerTimeout [60,180,300,false];
        
        // save all spawned objects for clean up
        SPAWNED_OBJECTS_ARRAY set [_index, _spawnedObjects];
        
        // addAction for clean up
        [CLEAN_UP_OBJECT,
            [
                format [CLEAN_UP_STRING,_textLocation],
                "_this remoteExec ['Spec_dynamic_fnc_cleanUp',2]",
                [_index],
                1.5,
                false,
                true,
                "",
                "_this distance _target <3"
            ]
        ] remoteExecCall ["addAction",0,true];
    } else {
        ["Script Error: No Locations (cities) found"] call BIS_fnc_error;
    };
};
};
true
