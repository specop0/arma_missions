/*
    Author: SpecOp0

    Description:
    Adds a killed event handler to all units to remove loot.
    Should be executed on all clients, because the unit could be local (e.g. RemoteControl via Zeus).

    Known limitaition: Spawned units via Zeus are missing the killed event handler.

    Parameter(s):
    -

    Example:
    Add to CfgFunctions of description.ext:
    #include "spec_noLoot\CfgFunctions.hpp"

    Returns:
    true
*/

{
    [_x] call Spec_noLoot_fnc_addKilledEventHandler;
} forEach allUnits - allPlayers;