//	@file Version: 1.1
//	@file Name: x_reload.sqf
//	@file Author: Wiking, Lodac, unknown initial author

#define PRICE_RELATIONSHIP 0.25

_vehicle = _this;
_driver = driver _vehicle;
_eng = isengineon _vehicle;
_vehicle setVelocity [0,0,0];
_displayNameVEH = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

if (_eng) then {
	_vehicle vehicleChat format ["Stop engine in 15s to start resupply %1. Cost for service is 1/4 of vehicle store price. Service will take 2 minutes.",_displayNameVEH];
	sleep 15;
	_eng = isengineon _vehicle;
	if (_eng) exitWith {_vehicle vehicleChat format ["Engine still running. Service CANCELED!"];};
};


if (!isnull (gunner _vehicle)) then {
	_vehicle vehicleChat format ["Gunner must be out of seat for service! Get gunner out in 20s."];
	sleep 10;
	_vehicle vehicleChat format ["Gunner must be out of seat for service! Get gunner out in 10s."];
	sleep 10;
	if (!isnull (gunner _vehicle)) exitWith {_vehicle vehicleChat format ["Gunner still inside. Service CANCELED!"];};
};


if((player == driver _vehicle) && (!_eng))then {
	_type = typeOf _vehicle;
	_playerMoney = player getVariable "cmoney";

	_price = 500;
	
	//find price from vehicle store prices
	{	
	if (_type == _x select 1) then
	{	
	_price = _x select 2;
	_price = round (_price * PRICE_RELATIONSHIP);
	};
} forEach (call allVehStoreVehicles);
	

	if (_playerMoney < _price) then {
		_text = format ["Not enough money! You need $%1 to resupply %2. Service cancelled!",_price,_displayNameVEH];
		[_text, 10] call mf_notify_client;
	} else {
		player setVariable["cmoney",(player getVariable "cmoney")-_price,true];
		[] call fn_savePlayerData;
		
		_vehicle setFuel 0;
		_vehicle setVelocity [0,0,0];
		_text = format ["Servicing %1 for $%2. Please stand by...", _displayNameVEH, _price];
		[_text, 10] call mf_notify_client;
		sleep 10;
		["Repairing 1/3...", 15] call mf_notify_client;
		_this animate ["HideBackpacks", 1];
		_this animate ["HideBumper1", 1];
		_this animate ["HideBumper2", 1];
		_this animate ["HideDoor1", 1]; 
		_this animate ["HideDoor2", 1];
		_this animate ["HideDoor3", 1];
		sleep 15;
		_vehicle setFuel 0;
		["Repairing 2/3...", 15] call mf_notify_client;
		sleep 15;
		["Repairing 3/3...", 15] call mf_notify_client;
		_this animate ["HideBackpacks", 0];
		_this animate ["HideBumper1", 0];
		_this animate ["HideBumper2", 0];
		_this animate ["HideDoor1", 0]; 
		_this animate ["HideDoor2", 0];
		_this animate ["HideDoor3", 0];
		sleep 15;
		_vehicle setDamage 0;
		_vehicle setFuel 0;
		["Reloading ammo!", 7.5] call mf_notify_client;
		sleep 7.5;
		["Reloading ammo 1/3...", 7.5] call mf_notify_client;
		sleep 7.5;
		_vehicle setFuel 0;
		["Reloading ammo 2/3...", 7.5] call mf_notify_client;
		sleep 7.5;
		_vehicle setFuel 0;
		["Reloading ammo 3/3...", 7.5] call mf_notify_client;
		sleep 7.5;
		_vehicle setFuel 0;
		_vehicle setVehicleAmmo 1;
		["You can enter the gunner seat now but refueling will take another 30 seconds.", 7.5] call mf_notify_client;
		sleep 7.5;
		["Refueling 1/3...", 7.5] call mf_notify_client;
		sleep 7.5;
		["Refueling 2/3...", 7.5] call mf_notify_client;
		sleep 7.5;
		["Refueling 3/3...", 7.5] call mf_notify_client;
		sleep 7.5;
		_vehicle setFuel 1;
		_text = format ["%1 is ready.", _displayNameVEH];
		[_text, 15] call mf_notify_client;
		if (true) exitWith {};
	};
};