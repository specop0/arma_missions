/*
    Author: SpecOp0
    
    Description:
    Deletes group (and vehicle) of given unit.
    
    Parameter(s):
    0: OBJECT - unit to delte
    
    Returns:
    true
*/
private _parameterCorrect = params [ ["_unit",objNull,[objNull]] ];
if(_parameterCorrect && isServer) then {
    private _vehicle = vehicle _unit;
    {
        if(!isNull _x) then {
            deleteVehicle _x;
        };
    } forEach units (group _unit);
    if(!isNull _vehicle) then {
        deleteVehicle _vehicle;
    };
};