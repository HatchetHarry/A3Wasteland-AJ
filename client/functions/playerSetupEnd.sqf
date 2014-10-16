//	@file Name: playerSetupEnd.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private "_player";
_player = _this;

_player addRating 9999999;

thirstLevel = 100;
hungerLevel = 100;

[objNull, _player] call mf_player_actions_refresh;
[] execVM "client\functions\playerActions.sqf";

//AJ +1 - Add Teargas feature
_null = [player] execVM "client\functions\teargas.sqf";

_player groupChat "Wasteland - Initialization Complete";
playerSetupComplete = true;
