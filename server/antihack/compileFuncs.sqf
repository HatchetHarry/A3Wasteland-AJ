//	@file Version: 1.0
//	@file Name: compileFuncs.sqf
//	@file Author: AgentRev
//	@file Created: 04/01/2014 02:51

<<<<<<< HEAD
private ["_assignChecksum", "_assignPacketKey"];
=======
private ["_assignCompileKey", "_assignChecksum", "_assignPacketKey", "_compileKey", "_checksum", "_packetKey"];
>>>>>>> eda9f0a... Minor improvements to AH

_assignCompileKey = [_this, 0, "", [""]] call BIS_fnc_param;
_assignChecksum = [_this, 1, "", [""]] call BIS_fnc_param;
_assignPacketKey = [_this, 2, "", [""]] call BIS_fnc_param;

<<<<<<< HEAD
if (call compile (_assignChecksum + "isNil {missionNamespace getVariable _flagChecksum}")) then
=======
_compileKey = call compile (_assignCompileKey + "_compileKey");
_checksum = call compile (_assignChecksum + "_flagChecksum");
_packetKey = call compile (_assignPacketKey + "_mpPacketKey");

if (isNil {missionNamespace getVariable _compileKey}) then
>>>>>>> eda9f0a... Minor improvements to AH
{
	{
		_func = _x select 0;
		_assign = _x select 1;
		_path = _x select 2;

		_finalVal = compileFinal (_assign + (preprocessFile _path));

		missionNamespace setVariable [_func, _finalVal];

		// Kick back to lobby if assignment fails
		if (!isServer && {str (missionNamespace getVariable [_func, ""]) != str _finalVal}) then
		{
			uiNamespace setVariable ["BIS_fnc_guiMessage_status", false];
			_msgBox = ["The antihack failed to compile.<br/>Please restart the game."] spawn BIS_fnc_guiMessage;
			_time = diag_tickTime;
			waitUntil {scriptDone _msgBox || diag_tickTime - _time >= 5};
			endMission "LOSER";
			waitUntil {uiNamespace setVariable ["BIS_fnc_guiMessage_status", false]; closeDialog 0; false};
		};
	}
	forEach
	[
		["A3W_fnc_MPexec", _assignPacketKey, "server\functions\network\fn_MPexec.sqf"],
		["A3W_fnc_MP", _assignPacketKey, "server\functions\network\fn_MP.sqf"],
		//["TPG_fnc_MP", _assignPacketKey, "server\functions\network\fn_MP.sqf"],
		["A3W_fnc_flagHandler", _assignChecksum, "server\antihack\flagHandler.sqf"],
		["A3W_fnc_clientFlagHandler", _assignChecksum, "server\antihack\clientFlagHandler.sqf"],
		["A3W_fnc_chatBroadcast", _assignChecksum, "server\antihack\chatBroadcast.sqf"],
		["A3W_fnc_adminMenuLog", _assignChecksum, "server\antihack\adminMenuLog.sqf"],
		["notifyAdminMenu", _assignChecksum, "server\antihack\notifyAdminMenu.sqf"]
	];

	if (isServer) then
	{
		[] spawn compile (_assignChecksum + (preprocessFileLineNumbers "server\antihack\serverSide.sqf"));
	};

	if (!isDedicated) then
	{
		[] spawn compile (_assignChecksum + (preprocessFileLineNumbers "server\antihack\payload.sqf"));
	};

<<<<<<< HEAD
	//call compile (_assignChecksum + "call compile format ['%1 = compileFinal str true', _flagChecksum]");
	call compile (_assignChecksum + "missionNamespace setVariable [_flagChecksum, compileFinal 'true']");
=======
	missionNamespace setVariable [_compileKey, compileFinal "true"];
>>>>>>> eda9f0a... Minor improvements to AH
};

call compile (_assignPacketKey + "_mpPacketKey addPublicVariableEventHandler A3W_fnc_MPexec");
