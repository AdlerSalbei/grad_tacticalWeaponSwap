#include "script_component.hpp"

/*
 * Author: DerZade
 * Triggered by GetInMan-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: position <STRING>
 * 2: vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call GRAD_tacticalWeaponSwap_functions_fnc_EHGetIn;
 *
 * Public: No
 */
params ["_player","","_veh"];

if (isNil "_player" or isNil "_veh") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _weaponHolder = [_player] call FUNC(weaponHolder);

//detach and hide the weaponholder
_weaponHolder remoteExec ["detach", 0];
_weaponHolder hideObjectGlobal true;
[_weaponHolder, true] remoteExec [QFUNC(hiddenCheck), 0];
[_weaponHolder, [-10000,-10000,-100]] remoteExec ["setPos", 0];
