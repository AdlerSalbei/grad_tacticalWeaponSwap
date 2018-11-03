#include "script_component.hpp"

params ["_player"];

//Get all attachments & amunition from the rifle
private _loadout = getUnitLoadout _player;
(_loadout select 0) param ["_weapon", "_muzzle", "_pointer", "_optics", "_magazine", "_underbarrelMagazine", "_underbarrel"];

//remove the rifle
[_player, _weapon] call CBA_fnc_removeWeapon;

//create weaponholder
private _weaponHolder = createVehicle ["GRAD_tacticalWeaponSwap_WeaponHolder", getPos _player, [], 0, "CAN_COLLIDE"];
_weaponHolder addItemCargoGlobal [_weapon, 1];

//add EHs to unit
private _getInID = _unit addEventHandler ["GetInMan",FUNC(EHGetIn)];
private _getOutID = _unit addEventHandler ["GetOutMan",FUNC(EHGetOut)];
private _killedID = _unit addEventHandler ["Killed",FUNC(EHKilled)];

_unit setVariable [QGVAR(variable),[_helmetClass, _weaponHolder, [_getInID,_getOutID,_killedID]], true];

//add HandleDisconnect-EH on server if not done yet
if !(missionNamespace getVariable [QGVAR(HDCEHadded),false]) then {
    ["HandleDisconnect", FUNC(EHHandleDisconnect)] remoteExec ["addMissionEventHandler", 2];
    GVAR(HDCEHadded) = true;
    publicVariable QGVAR(HDCEHadded);
};

//execute vehicle shit
if !(vehicle _unit isEqualTo _unit) then {
	[_unit, "", vehicle _unit] call FUNC(EHGetIn);
} else {
	[_unit, "", objNull] call FUNC(EHGetOut);
};
