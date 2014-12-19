//	@file Version: 0.900
//	@file Name: handleDisconnect.sqf
//	@file Author: Armajunkies - Hatchet Harry
//	@file Created: 18/12/2014 21:13
//	@file Description:
//	Listens to the MPMissionsevent Handledisconnect - > Server init.sqf
//  Some Players came around the Item drop by ALT + F4 quit. This file handles this unfair action. Player will be punished for this action in future. Planned Jail Functions.
//	TODO: UNFAIR Functions - Low Prrio Task
//	@file Args:
//	unit: Object - unit formerly occupied by player
//	id: Number - same as _id in onPlayerDisconnected
//	uid: String - same as _uid in onPlayerDisconnected
//	name: String - same as _name in onPlayerDisconnected
//	added unused parameters for clarification and future use
_debug =true;

_unithdc 	= _this select 0;
_idhdc 		= _this select 1;
_uidhdc 	= _this select 2;
_namehdc 	= _this select 3;

//Debug usage
if (_debug) then {
diag_log format ["Player disconnected - Event Handler is Starting"];
diag_log format ["Player disconnected handler: _unit_hc %1", _unithdc];
diag_log format ["Player disconnected handler: _id_hc %1", _idhdc];
diag_log format ["Player disconnected handler: _uid_hc %1", _uidhdc];
diag_log format ["Player disconnected handler: _name_hc %1", _namehdc];
};
//Is the player bleeding?
_unconscious = (_unithdc getVariable ["FAR_isUnconscious", 0] == 1);
if (_debug) then {diag_log format["INFO: Player bleeding state: %1",_unconscious];};
if (_debug) then {diag_log format["INFO: Player alive state: %1", alive _unithdc];};

//True ->  Logged out alive or is not bleeding
//True ->  Logged out is bleeding - Kill him
//False -> Let the garbage collector handles it

if (!_unconscious || alive _unithdc) then {
	//Clean Player
	deleteVehicle _unithdc;
	if (_debug) then {
		diag_log format["INFO: Player clean: %1 (%2)", _namehdc, _unithdc];
		diag_log format["INFO: Player _unconscious: %1",_unconscious];
	};
};
if (_unconscious) then {
	if (_debug) then {diag_log format["INFO: Player _unconscious: %1",_unconscious];};

	//TODO: Add to Database. New Table unfair players actions. Needs to be discussed firstly. -> Together with UNFAIR System.
	//TODO: Think about publishing unfair players on internal website. Admin Support.
	diag_log format["UNFAIR: Player _unconscious: Player is unsconscious. %1 is a pussy logger. ID: %2", _namehdc, _uidhdc];

	// Forced to use onKilled Script with Selfkill
	 [_unithdc,_unithdc,_unithdc] spawn onKilled;
};


