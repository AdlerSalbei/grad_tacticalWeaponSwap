#include "script_component.hpp"

params ["_player"];

private _class = [_player] call FUNC(getWeapon);
private _weaponHolder = [_player] call FUNC(weaponHolder);

if (_class isEqualTo "") exitWith {};

private _value = _player getVariable QGVAR(variable);

//delete weaponholder and therefore the attched helmet
deleteVehicle _weaponHolder;
private _loadout = getUnitLoadout _player;
_loadout set [0, (_value select 0)];
_player setUnitLoadout _loadout;

//remove EHs
(_value select 2) params ["_getInID","_getOutID","_killedID"];
_player removeEventHandler ["GetInMan",_getInID];
_player removeEventHandler ["GetOutMan",_getOutID];
_player removeEventHandler ["Killed",_killedID];


//update unit's variable
_player setVariable [QGVAR(variable),nil, true];
