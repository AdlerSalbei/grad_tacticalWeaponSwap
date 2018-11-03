#include "script_component.hpp"
/*
 * Author: DerZade
 * Triggerd by Killed-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call GRAD_tacticalWeaponSwap_functions_fnc_EHKilled;
 *
 * Public: No
 */
params ["_player"];
private _helmet = [_player] call GRAD_slingHelmet_fnc_getSlungHelmet;

//spawns new weaponholder with helmet on players body
private _holder = createVehicle ["WeaponHolderSimulated", (getPos _player), [], 0, "CAN_COLLIDE"];
_holder addItemCargoGlobal [_helmet, 1];

//remove the helmet from the dead unit
[_player] call GRAD_slingHelmet_fnc_removeSlungHelmet;
