#include "script_component.hpp"

params ["_player"];

private _class = [_player] call FUNC(getWeapon);
private _weaponHolder = [_player] call FUNC(weaponHolder);

if (_class isEqualTo "") exitWith {};

//delete weaponholder and therefore the attched helmet
deleteVehicle _weaponHolder;

//remove EHs
((_player getVariable QGVAR(variable)) select 2) params ["_getInID","_getOutID","_killedID"];
_player removeEventHandler ["GetInMan",_getInID];
_player removeEventHandler ["GetOutMan",_getOutID];
_player removeEventHandler ["Killed",_killedID];


//update unit's variable
_player setVariable [QGVAR(variable),nil, true];
