#include "script_component.hpp"

params ["_player"];

//Get all attachments & amunition from the rifle
private _loadout = getUnitLoadout _player;
(_loadout select 0) params ["_weapon", "_muzzle", "_pointer", "_optics", "_magazine", "_underbarrelMagazine", "_underbarrel"];

//remove the rifle
private _result = [_player, _weapon] call CBA_fnc_removeWeapon;

//create weaponholder
private _weaponHolder = "GRAD_tacticalWeaponSwap_WeaponHolder" createVehicle (getPos _player);
_weaponHolder addWeaponCargoGlobal [_weapon, 1];
test_wh = _weaponHolder;

//add EHs to unit
private _getInID = _player addEventHandler ["GetInMan",FUNC(getInEH)];
private _getOutID = _player addEventHandler ["GetOutMan",FUNC(getOutEH)];
private _killedID = _player addEventHandler ["Killed",FUNC(killedEH)];

_player setVariable [QGVAR(variable),[[_weapon, _muzzle, _pointer, _optics, _magazine, _underbarrelMagazine, _underbarrel], _weaponHolder, [_getInID,_getOutID,_killedID]], true];

//add HandleDisconnect-EH on server if not done yet
if !(missionNamespace getVariable [QGVAR(addedHDCEH),false]) then {
    ["HandleDisconnect", FUNC(disconnectEH)] remoteExec ["addMissionEventHandler", 2];
    GVAR(addedHDCEH) = true;
    publicVariable QGVAR(addedHDCEH);
};

//attach weaponHolder
[_player,"",objNull] call FUNC(getOutEH);
