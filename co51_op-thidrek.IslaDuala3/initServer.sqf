// add allUnits to allCurators
{
	_x addCuratorEditableObjects [allUnits, false];
	_x addCuratorEditableObjects [vehicles, false];
} forEach allCurators;