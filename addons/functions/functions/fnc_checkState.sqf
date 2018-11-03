#include "script_component.hpp"

params ["_player"];

if (((animationState _player) select [1,3]) in ["bdv","bsw","dve","sdv","ssw","swm"] || ((vehicle _player != _player))) exitWith {};

private _currentWeapon = currentWeapon (vehicle _player);
private _primaryWeapon = primaryWeapon _player;
private _secondaryWeapon = secondaryWeapon player;

if (_currentWeapon != _primaryWeapon && _currentWeapon != _secondaryWeapon) exitWith {};

{_player call CBA_fnc_getUnitAnim} params ["_stance", "_speed"];
if (_stance == "prone") exitWith {};

if (_currentWeapon == _primaryWeapon) then {
   if (_stance == "kneel") then {
      playMoveNow "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon";
      [{
         playMoveNow "AmovPknlMstpSlowWpstDnon_AmovPknlMstpSrasWpstDnon";
         [_player, _primaryWeapon, _secondaryWeapon] call FUNC(handleRifle);
      },[],1.5] call CBA_fnc_waitAndExecute;
   }else{
      playMoveNow "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
      [{
         playMoveNow "AmovPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon";
         [_player, _primaryWeapon, _secondaryWeapon] call FUNC(handleRifle);
      },[],0.1] call CBA_fnc_waitAndExecute;
   };
}else{
   if (_stance == "kneel") then {
      playMoveNow "AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon";
      [{
         playMoveNow "AmovPknlMstpSlowWrflDnon_AmovPknlMstpSrasWrflDnon";
         [_player] call FUNC(handlePistol);
      },[],0.1] call CBA_fnc_waitAndExecute;
   }else{
      if (_speed == "normal" || _speed == "fast") then {
         playMoveNow "AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthStart";
         [{
            playMoveNow "AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthEnd";
            [_player, _primaryWeapon, _secondaryWeapon] call FUNC(handlePistol);
         },[],0.5] call CBA_fnc_waitAndExecute;
      }else{
         playMoveNow "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
         [{
            playMoveNow "AmovPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon";
            [_player, _primaryWeapon, _secondaryWeapon] call FUNC(handlePistol);
         },[],0.5] call CBA_fnc_waitAndExecute;
      };
   };
};
