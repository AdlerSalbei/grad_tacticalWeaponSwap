#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "ace_tacticalWeaponSwap" };
        authors[] = { "Salbei", "chris579" };
        VERSION_CONFIG;
    };
};

#include <CfgSettings.hpp>
