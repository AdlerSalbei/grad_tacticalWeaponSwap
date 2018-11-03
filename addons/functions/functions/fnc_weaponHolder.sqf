#include "script_component.hpp"
/*
 * Author: DerZade
 * Returns the slung helmet's weaponholder
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Weaponholder <OBJECT>
 *
 * Example:
 * [player] call GRAD_tacticalWeaponSwap_functions_fnc_weaponHolder;
 *
 * Public: No
 */
params ["_player"];

private _var = _player getVariable [QGVAR(variable),nil];

//return ""
if (isNil "_var") exitWith {""};

//return weaponholder
(_var select 1)
