params ["_player", "_weapon"];

if (isNil "_weapon") exitWith {};

// check for multiple muzzles (eg: GL)
private _muzzles = getArray(configFile >> "cfgWeapons" >> _weapon >> "muzzles");

if (count _muzzles > 1) then {
   _player selectWeapon (_muzzles select 0);
}else{
   _player selectWeapon _weapon;
};
