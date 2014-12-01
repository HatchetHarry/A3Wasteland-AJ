//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19

{ [player, _x] call fn_addManagedAction } forEach
[
//AJ Additions
//Help Texts
	[format ["<img image='client\icons\r3f_contents.paa' color='%1'/> <t color='%1'>[</t>Help<t color='%1'>]</t>", "#50FF00"], "processDiaryLink (createDiaryLink ['infos-en', helpTextBriefing_EN, ''])", [], -9, false], //, false, "", ""],
	
	//Add Salvage Feature, Add Resupply Script
	//["Salvage","client\actions\salvage.sqf",0,1,false,false,"","!alive cursortarget and ((cursortarget iskindof 'Land')||(cursortarget iskindof 'Air')) and (player distance cursortarget) < 15"],
	["Remove Ruins", "client\actions\removeRuins.sqf", [], 1, false, false, "", "count nearestObjects [player, ['Ruins'], 5] > 0"],
		
	//player addAction ["Resupply", "_nearestTargets = nearestObjects [player, ['Car','Tank','Truck','Air','Autonomous','Support','StaticWeapon'], 100]; {_x setDamage 0; _x setFuel 1; _x setVehicleAmmo 1;} forEach _nearestTargets; hint 'resupplied';", [5,1], 50, false, false, "", "vehicle player isKindOf 'O_Truck_03_device_F';"],
	["Resupply", "client\functions\fn_resupplytruck.sqf", [], 5, false, false, "", "!(vehicle player == player) and (cursortarget iskindof 'O_Truck_03_device_F') and (player distance cursortarget) < 15"], //vehicle player isKindOf 'O_Truck_03_device_F'
	["Resupply", "client\functions\fn_resupplytruck.sqf", [], 5, false, false, "", "!(vehicle player == player) and (cursortarget iskindof 'O_Heli_Transport_04_ammo_F') and (player distance cursortarget) < 15"], //vehicle player isKindOf 'O_Heli_Transport_04_ammo_F'
	["Heal self", "client\healSelf.sqf",0,2,false,false,"","((damage player)>0.01 && (damage player)<0.25499) && (('Medikit' in (items player)) or ('FirstAidKit' in (items player)))"],
	["Track Beacons", "addons\beacondetector\beacondetector.sqf",0,-10,false,false,"","('ToolKit' in (items player)) && !BeaconScanInProgress"],
	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel tracking.</t>", "Beaconscanstop = true",0,-10,false,false,"","BeaconScanInProgress"],

	//Lock Copilot
	["Lock Turret", "vehicle player lockTurret [[0],true];", [5,1], -6, false, false, "", "(vehicle player isKindOf 'Air') && !(vehicle player lockedTurret [0])"],
	["Unlock Turret", "vehicle player lockTurret [[0],false];", [5,1], -6, false, false, "", "(vehicle player isKindOf 'Air') && (vehicle player lockedTurret [0])"],
	
	//Holster+Unholster
	["Holster Weapon", "player action ['SwitchWeapon', player, player, 100];", [], -11, false, false, "", "currentWeapon player != '' && vehicle player == player"],
	["Unholster Weapon", "player action ['SwitchWeapon', player, player, 0];", [], -11, false, false, "", "currentWeapon player == '' && vehicle player == player"],			
	
	//["Install countermeasures", "vehicle player addweapon 'CMFlareLauncher'; 
	//												vehicle player addmagazine '60Rnd_CMFlareMagazine';", [5,1], -7, false, false, "", "(vehicle player isKindOf 'Air') && ( getPos vehicle player select 2) < 1"],
//End AJ Additions	
	[format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Player Menu<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -10, false], //, false, "", ""],
	["<img image='client\icons\money.paa'/> Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", "{_x getVariable ['owner', ''] != 'mission'} count (player nearEntities ['Land_Money_F', 5]) > 0"],

	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel Action</t>", "noscript.sqf", "doCancelAction = true", 1, false, false, "", "mutexScriptInProgress"],

	["<img image='client\icons\repair.paa'/> Salvage", "client\actions\salvage.sqf", [], 1.1, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && player distance cursorTarget <= (sizeOf typeOf cursorTarget) max 2}"],

	["[0]"] call getPushPlaneAction,
	["Push vehicle", "server\functions\pushVehicle.sqf", [2.5, true], 1, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	["Push vehicle forward", "server\functions\pushVehicle.sqf", [2.5], 1, false, false, "", "[2.5] call canPushWatercraft"],
	["Push vehicle backward", "server\functions\pushVehicle.sqf", [-2.5], 1, false, false, "", "[-2.5] call canPushWatercraft"],

	["<t color='#FF0000'>Emergency eject</t>", "client\actions\forceEject.sqf", [], 19, false, true, "", "(vehicle player) isKindOf 'Air'"],
	["<t color='#FF00FF'>Open magic parachute</t>", "client\actions\openParachute.sqf", [], 20, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"]
];


// Hehehe...
if !(288520 in getDLCs 1) then
{
	[player, ["<t color='#00FFFF'>Get in as Driver</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
};
