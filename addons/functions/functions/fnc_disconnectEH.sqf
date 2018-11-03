#include "script_component.hpp"
/*
 * Author: DerZade
 * Triggered by HandleDisconnect-Eventhandler on Server.
 * Handles deleting the slung helmet of old units form disconnected players.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call GRAD_tacticalWeaponSwap_functions_fnc_EHHandleDisconnect;
 *
 * Public: Yes
 */
params ["_player"];

if !([_player] call GRAD_slingHelmet_fnc_getSlungHelmet isEqualTo "") then {
     [[_player] call GRAD_slingHelmet_fnc_weaponHolder, _player] spawn {
          params ["_weaponHolder","_player"];
          sleep 1.5;
          if !(alive _player) then {
               deleteVehicle _weaponHolder;
          };
     };
};
