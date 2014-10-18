//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Description: The main init.

#define DEBUG false

enableSaving [false, false];

currMissionDir = compileFinal str call
{
	private "_arr";
	_arr = toArray str missionConfigFile;
	_arr resize (count _arr - 15);
	toString _arr
};

X_Server = false;
X_Client = false;
X_JIP = false;

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";
[] execVM "addons\atm\bank_init.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		9999 cutRsc ["loadingscreen", "BLACK"]; //custom loading screen

		waitUntil {!isNull player};
		removeAllWeapons player;
		client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

		// Reset group & side
		[player] joinSilent createGroup playerSide;
		player setVariable ["playerSpawning", true, true];

		[] execVM "client\init.sqf";
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_ground\init.sqf";
[] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "addons\zlt_fastrope\zlt_fastrope.sqf";
[] execVM "addons\JumpMF\init.sqf";
[] execVM "addons\EtV\init.sqf";

//AJ Addons
[] execVM "addons\scripts\intro.sqf";
[] execVM "addons\outlw_magRepack\MagRepack_init_sv.sqf";

//ZBE Caching 
//[cache dist,debug,vehicle cache distance (enablesimulation)]
//@moros - debug sinnvoll zu aktivieren wenn du dir den effekt anschauen willst
//muss auf server und jedem client laufen
//[2000,false,500]execvm "addons\ZBE_Caching\main.sqf";

if (isServer) then
{
//müssen nur am server laufen
[] execVM "addons\manualcleanup\manualCleanup.sqf";
//init Zeus Server Scripts
//[] execVM "addons\zeus\zeus.sqf";
};

/*
if (str(side player) == "LOGIC") then
{
//init für Zeus - Admin Menü, ...
[] execVM "addons\zeus\zeus-init.sqf";
};
*/
