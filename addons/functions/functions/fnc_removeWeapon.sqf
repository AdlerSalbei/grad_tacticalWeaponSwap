#include "script_component.hpp"
/*
 * Author: DerZade
 * Removes the slung helmet from given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call GRAD_tacticalWeaponSwap_functions_fnc_removeWeapon;
 *
 * Public: No
 */

params ["_unit"];

private _class = [_unit] call FUNC(getSlungHelmet);
private _weaponHolder = [_unit] call FUNC(weaponHolder);

if (_class isEqualTo "") exitWith {};

//delete weaponholder and therefore the attched helmet
deleteVehicle _weaponHolder;

//remove EHs
((_unit getVariable QGVAR(variable)) select 2) params ["_getInID","_getOutID","_killedID"];
_unit removeEventHandler ["GetInMan",_getInID];
_unit removeEventHandler ["GetOutMan",_getOutID];
_unit removeEventHandler ["Killed",_killedID];


//update unit's variable
_unit setVariable [QGVAR(variable),nil, true];
