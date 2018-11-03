#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[QUOTE(ADDON), QGVAR(diveComputer), "$STR_GRAD_tacicalWeaponSwap_Key", {
   [player] call FUNC(checkState);
}, {false}, [DIK_3, [true, false, false]], false] call CBA_fnc_addKeybind;
