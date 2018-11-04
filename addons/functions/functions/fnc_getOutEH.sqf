#include "script_component.hpp"
/*
 * Author: DerZade
 * Triggered by GetOutMan-Eventhandler
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
 * _this call GRAD_tacticalWeaponSwap_functions_fnc_EHGetOut;
 *
 * Public: No
 */
params ["_player","","_veh"];

if (isNil "_player" or isNil "_veh") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _weaponHolder = [_player] call FUNC(weaponHolder);

//attach and unhide the weaponholder
[_weaponHolder, [_player,[0.1,0.1,0],"Spine3"]] remoteExec ["attachTo", 0];
[_weaponHolder, [[0,0,1],[0,0,0]]] remoteExec ["setVectorDirAndUp", 0];
_weaponHolder hideObjectGlobal false;
[_weaponHolder, false] remoteExec [QFUNC(hiddenCheck), 0];
