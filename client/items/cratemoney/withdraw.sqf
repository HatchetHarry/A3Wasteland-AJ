//	@file Name: withdraw.sqf
//	@file Author: AgentRev, MercifulFate
//	@file Function: mf_items_cratemoney_withdraw

#include "defines.sqf"

#define ERR_NOT_ENOUGH_FUNDS "There are not enough funds in the crate."
#define ERR_LESS_THAN_ONE "The amount must be at least $1"

disableSerialization;
private ["_crate", "_dialog", "_input", "_amount", "_money"];

_crate = call mf_items_cratemoney_nearest;
_dialog = findDisplay IDD_WARCHEST;

if (isNull _dialog) exitWith {};
if (isNull _crate) exitWith { closeDialog IDD_WARCHEST };

_input = _dialog displayCtrl IDC_AMOUNT;
_amount = floor parseNumber ctrlText _input;

if (_amount < 1) then
{
	[ERR_LESS_THAN_ONE, 5] call mf_notify_client;
	playSound "FD_CP_Not_Clear_F";
}
else
{
	_crateMoney = _crate getVariable ["cmoney", 0];

	if (_crateMoney < _amount) exitWith
	{
		[ERR_NOT_ENOUGH_FUNDS, 5] call mf_notify_client;
		playSound "FD_CP_Not_Clear_F";
	};

	_crate setVariable ["cmoney", _crateMoney - _amount, true];
	player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _amount, true];

	playSound "defaultNotification";

	if (["A3W_playerSaving"] call isConfigOn) then
	{
		[] spawn fn_savePlayerData;
	};
};

call mf_items_cratemoney_refresh;
