
#define PRICE_RELATIONSHIP 0.75

_vehicle = _this;
_driver = driver _vehicle;
_eng = isengineon _vehicle;
_vehicle setVelocity [0,0,0];
_displayNameVEH = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

if (_eng) then {
	_vehicle vehicleChat format ["Stop engine in 15s to sell %1. You will get 3/4 of the vehicle store price.",_displayNameVEH];
	sleep 15;
	_eng = isengineon _vehicle;
	if (_eng) exitWith {_vehicle vehicleChat format ["Engine still running. Deal CANCELED!"];};
};


if((player == driver _vehicle) && (!_eng))then {
	_type = typeOf _vehicle;
	_playerMoney = player getVariable "cmoney";

	_price = 300;
	
	//find price from vehicle store prices
	{	
	if (_type == _x select 1) then
		{	
			_price = _x select 2;
			_price = round (_price * PRICE_RELATIONSHIP);
		};
	} forEach (call allVehStoreVehicles);
	
		player setVariable["cmoney",(player getVariable "cmoney")+_price,true];
		[] call fn_savePlayerData;
		["Dismantling will take about 1 minute.", 10] call mf_notify_client;
		
		_vehicle setFuel 0;
		_vehicle setVelocity [0,0,0];
		_text = format ["Selling %1 for $%2. Removing Engine, emptying fluids, and removing ammo.", _displayNameVEH, _price];
		[_text, 5] call mf_notify_client;
		sleep 5;
		["Chopping up vehicle.", 5] call mf_notify_client;
		_this animate ["HideBackpacks", 1];
		sleep 1;
		_this animate ["HideBumper1", 1];
		sleep 1;
		_this animate ["HideBumper2", 1];
		sleep 1;
		_this animate ["HideDoor1", 1];
		sleep 1;		
		_this animate ["HideDoor2", 1];
		sleep 1;
		_this animate ["HideDoor3", 1];
		sleep 1;
		deleteVehicle _this;

		_text = format ["%1 has been chopped.", _displayNameVEH];
		[_text, 10] call mf_notify_client;
		if (true) exitWith {};
	};
