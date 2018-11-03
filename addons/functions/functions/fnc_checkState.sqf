#include "script_component.hpp"

params ["_player"];

if (((animationState _player) select [1,3]) in ["bdv","bsw","dve","sdv","ssw","swm"] || ((vehicle _player != _player))) exitWith {};

private _currentWeapon = currentWeapon (vehicle _player);
private _primaryWeapon = primaryWeapon _player;
private _secondaryWeapon = secondaryWeapon player;

if (_currentWeapon != _primaryWeapon && _currentWeapon != _secondaryWeapon) exitWith {};

(_player call CBA_fnc_getUnitAnim) params ["_stance", "_speed"];
if (_stance == "prone") exitWith {};

if (_currentWeapon == _primaryWeapon) then {
   if (_stance == "kneel") then {
      _player playMoveNow "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon";
      [{
         _this params [_player];
         [_player, _secondaryWeapon] call FUNC(changeAktivWeapon);
         [_player] call FUNC(handleRifle);
         _player playMoveNow "AmovPknlMstpSlowWpstDnon_AmovPknlMstpSrasWpstDnon";
      },[_player],1.5] call CBA_fnc_waitAndExecute;
   }else{
      _player playMoveNow "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
      [{
         _this params [_player];
         [_player, _secondaryWeapon] call FUNC(changeAktivWeapon);
         [_player] call FUNC(handleRifle);
         _player playMoveNow "AmovPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon";
      },[_player],0.1] call CBA_fnc_waitAndExecute;
   };
}else{
   if (_stance == "kneel") then {
      _player playMoveNow "AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon";
      [{
         _this params [_player];
         [_player, _primaryWeapon] call FUNC(changeAktivWeapon);
         [_player] call FUNC(handlePistol);
         _player playMoveNow "AmovPknlMstpSlowWrflDnon_AmovPknlMstpSrasWrflDnon";
      },[_player],0.1] call CBA_fnc_waitAndExecute;
   }else{
      if (_speed == "normal" || _speed == "fast") then {
         _player playMoveNow "AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthStart";
         [{
            _this params [_player];
            [_player, _primaryWeapon] call FUNC(changeAktivWeapon);
            [_player] call FUNC(handlePistol);
            _player playMoveNow "AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthEnd";
         },[_player],0.5] call CBA_fnc_waitAndExecute;
      }else{
         _player playMoveNow "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
         [{
            _this params [_player];
            [_player, _primaryWeapon] call FUNC(changeAktivWeapon);
            [_player] call FUNC(handlePistol);
            _player playMoveNow "AmovPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon";
         },[_player],0.5] call CBA_fnc_waitAndExecute;
      };
   };
};
