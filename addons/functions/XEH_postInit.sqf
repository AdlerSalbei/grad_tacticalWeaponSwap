#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[QUOTE(GRAD_tacticalWeaponSwap), QGVAR(tacticalWeaponSwitch), "$STR_GRAD_tacicalWeaponSwap_Key", {
   [player] call FUNC(checkState);
}, {false}, [DIK_3, [false, true, false]], false] call CBA_fnc_addKeybind;
