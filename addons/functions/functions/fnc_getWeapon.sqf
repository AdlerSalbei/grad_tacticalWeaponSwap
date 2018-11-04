#include "script_component.hpp"
/*
 * Author: DerZade
 * Returns the classname of a unit's slung weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Classname <STRING>
 *
 * Example:
 * [player] call GRAD_tacticalWeaponSwap_functions_fnc_getWeapon;
 *
 * Public: No
 */
params ["_unit"];

private _var = _unit getVariable [QGVAR(variable),nil];

//no slung helmet; return ""
if (isNil "_var") exitWith {""};

//return classname
((_var select 0)select 0)
