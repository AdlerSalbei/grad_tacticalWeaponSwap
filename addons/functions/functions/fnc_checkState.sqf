#include "script_component.hpp"

params ["_player"];

if (((animationState _player) select [1,3]) in ["bdv","bsw","dve","sdv","ssw","swm"] || ((vehicle _player != _player))) exitWith {};

private _currentWeapon = currentWeapon (vehicle _player);
private _primaryWeapon = primaryWeapon _player;
private _handgunWeapon = handgunWeapon _player;

systemChat format ["%1 - %2", _primaryWeapon, _handgunWeapon];
systemChat format ["%1 - %2", (_currentWeapon != _primaryWeapon), (_currentWeapon != _handgunWeapon)];
if (_currentWeapon != _primaryWeapon && _currentWeapon != _handgunWeapon) exitWith {};

(_player call CBA_fnc_getUnitAnim) params ["_stance", "_speed"];
if (_stance == "prone") exitWith {};

if (_currentWeapon == _primaryWeapon) then {
   if (_stance == "kneel") then {
      _player playMoveNow "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon";
      [{
         _this params ["_player"];
         [_player] call FUNC(handleRifle);
         [_player, _handgunWeapon] call FUNC(changeAktivWeapon);
         //_player playMoveNow "AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon_end";
      },[_player],1] call CBA_fnc_waitAndExecute;
   }else{
      _player playMoveNow "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
      [{
         _this params ["_player"];
         [_player] call FUNC(handleRifle);
         [_player, _handgunWeapon] call FUNC(changeAktivWeapon);
         _player playMoveNow "AmovPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon";
      },[_player],0.1] call CBA_fnc_waitAndExecute;
   };
}else{
   if (_stance == "kneel") then {
      _player playMoveNow "AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon";
      [{
         _this params ["_player"];
         [_player] call FUNC(handlePistol);
         [_player, _primaryWeapon] call FUNC(changeAktivWeapon);
         _player playMoveNow "AmovPknlMstpSlowWrflDnon_AmovPknlMstpSrasWrflDnon";
      },[_player],0.1] call CBA_fnc_waitAndExecute;
   }else{
      if (_speed == "normal" || _speed == "fast") then {
         _player playMoveNow "AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthStart";
         [{
            _this params ["_player"];
            [_player] call FUNC(handlePistol);
            [_player, _primaryWeapon] call FUNC(changeAktivWeapon);
            _player playMoveNow "AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthEnd";
         },[_player],0.5] call CBA_fnc_waitAndExecute;
      }else{
         _player playMoveNow "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
         [_player] call FUNC(handlePistol);
         [{
            _this params ["_player"];
            [_player, _primaryWeapon] call FUNC(changeAktivWeapon);
            [{_this playMoveNow "AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon";},_player,1] call CBA_fnc_waitAndExecute;
         },[_player],1] call CBA_fnc_waitAndExecute;
      };
   };
};
