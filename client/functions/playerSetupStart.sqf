//	@file Name: playerSetupStart.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private "_player";
_player = _this;

_player setSkill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];
_player allowDamage false;
//_player enableSimulation false;

if (["A3W_unlimitedStamina"] call isConfigOn) then
{
	_player enableFatigue false;
};

//AJ - Stamina reset function
[] spawn fn_fatigueReset;
//AJ- Spawn Script for Custom Player uniforms
[] spawn fn_customUniforms;

enableSentences false;

removeAllWeapons _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeGoggles _player;
removeHeadgear _player;
