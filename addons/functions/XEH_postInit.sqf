#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[QUOTE(GRAD_tacticalWeaponSwap), QGVAR(tacticalWeaponSwitch), "$STR_GRAD_tacicalWeaponSwap_Key", {
   if !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call ace_common_canInteractWith) exitWith {false};
   [player] call FUNC(checkState);
   true
}, {false}, [DIK_3, [false, true, false]], false] call CBA_fnc_addKeybind;
