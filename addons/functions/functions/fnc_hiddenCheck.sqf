#include "script_component.hpp"

/*
 * Author: DerZade
 *
 *
 * Arguments:
 * 0: _obj <OBJECT>
 * 1: _hide <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [_this,false] call GRAD_tacticalWeaponSwap_functions_fnc_hiddenCheck;
 *
 * Public: No
 */

if !(hasInterface) exitWith {};
params ["_obj", "_hide"];
private _isHidden = isObjectHidden _obj;

switch (true) do {
   case (_hide && !(_isHidden)) : {hideObject _obj;};
   case (!(_hide) && _isHidden) : {_obj hideObject false;};
};
