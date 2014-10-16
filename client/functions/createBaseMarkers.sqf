//	@file Version: 1.0
//	@file Name: createBaseMarkers.sqf
//	@file Author: Wiking, based on Script by [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap
//	Basemarker have to be set on Map: _Base_100_Basename
// 	Replace 100 with the Radius. the Marker-Text from you Basemarker is used for naming

_radius = 75; //Default Radius - Set via Basemarker-Name
_status = [];
_bases = [];
_col_empty = "ColorWhite";
_col_enemy = "ColorRed";
_col_friendly = "ColorGreen";
_col_mixed = "ColorOrange";



//Based on Gunstore Markerscript- Only for Base Markers/activated/maintained the same way as for gunstores
{
	if (["_Base", _x] call fn_startsWith) then
	{
		_basePos = getMarkerPos _x;
	
		if (["A3W_showGunStoreStatus"] call isConfigOn) then
		{
			// Circle zone
			_markerName = format["marker_base_zone_%1",_x];
			deleteMarkerLocal _markerName;
			_marker = createMarkerLocal [_markerName, _basePos];
			_markerName setMarkerShapeLocal "ELLIPSE";
			_markerName setMarkerColorLocal _col_empty;
			_markerName setMarkerSizeLocal [_radius, _radius];
			_markerName setMarkerBrushLocal "Grid";
			_markerName setMarkerAlphaLocal 0.5;
		};

		/*
		// Gun store title
		_markerName = format["marker_shop_title_%1",_x];
		deleteMarkerLocal _markerName;
		_marker = createMarkerLocal [_markerName, _basePos];
		_markerName setMarkerShapeLocal "ICON";
		_markerName setMarkerTypeLocal "mil_dot";
		_markerName setMarkerColorLocal "ColorRed";
		_markerName setMarkerSizeLocal [1,1];
		_markerName setMarkerTextLocal "GUN STORE";
		*/

		// Gun store description
		_markerName = format["marker_base_desc_%1",_x];
		deleteMarkerLocal _markerName;
		// _basePos set [1, (_basePos select 1) - 100];
		_marker = createMarkerLocal [_markerName, _basePos];
		_markerName setMarkerShapeLocal "ICON";
		_markerName setMarkerTypeLocal "mil_dot";
		_markerName setMarkerColorLocal _col_empty;
		_markerName setMarkerSizeLocal [1,1];
		_markerName setMarkerTextLocal markerText _x;
		// _markerName setMarkerAlphaLocal 0.5;

		_status set [count _status, "EMPTY"];

		_bases set [count _bases, _x];
	};
} forEach allMapMarkers;

//Used to set the status of each store.
_setStatus =
{
	if(_status select (_this select 0) == (_this select 1)) exitWith {};

	_markerNameZone = format ["marker_base_zone_%1", _bases select (_this select 0)];
	_markerNameDescription = format ["marker_base_desc_%1", _bases select (_this select 0)];
	switch(_this select 1) do {
		case "EMPTY": {
			_markerNameZone setmarkerColorLocal _col_empty;
			_markerNameDescription setmarkerColorLocal _col_empty;
			_markerNameDescription setMarkerTextLocal markerText _x;
		};
		case "ENEMY": {
			_markerNameZone setmarkerColorLocal _col_enemy;
			_markerNameDescription setmarkerColorLocal _col_enemy;
			_markerNameDescription setMarkerTextLocal (markerText _x + " / Enemies");
		};
		case "FRIENDLY": {
			_markerNameZone setmarkerColorLocal _col_friendly;
			_markerNameDescription setmarkerColorLocal _col_friendly;
			_markerNameDescription setMarkerTextLocal (markerText _x + " / Allies");
		};
		case "MIXED": {
			_markerNameZone setmarkerColorLocal _col_mixed;
			_markerNameDescription setmarkerColorLocal _col_mixed;
			_markerNameDescription setMarkerTextLocal (markerText _x + " / Enemies and Allies");
		};
	};

	if (["A3W_gunStoreIntruderWarning"] call isConfigOn) then
	{
		if((_this select 2) && ((_this select 1) in ["ENEMY", "MIXED"])) then {
			hintSilent parseText format ["<t size='2' color='#ff0000'>%1</t><br/><br/>%2.","Warning!","Enemy player just entered the area"];
		};
	};

	_status set [_this select 0, _this select 1];
};

if (["A3W_showGunStoreStatus"] call isConfigOn) then
{
	//Check each base to see if their state has changed and then calls the update function to make the display the correct state.
	showmarkers = true;
	while {showmarkers} do
	{
		{
			_basecenter = getmarkerpos _x;
		
			_friendlyCount = 0;
			_enemyCount = 0;

			{
				if (isPlayer _x && alive _x && {_x distance _basecenter < _radius}) then
				{
					if ((playerSide in [BLUFOR,OPFOR] && {side _x == playerSide}) || {group _x == group player}) then
					{
						_friendlyCount = _friendlyCount + 1;
					}
					else
					{
						_enemyCount = _enemyCount + 1;
					};
				};
			} forEach playableUnits;

			if (player distance _basecenter < _radius) then
			{
				if(_enemyCount > 0) then
				{
					if (_friendlyCount > 0) then
					{
						[_forEachIndex, "MIXED", true] call _setStatus;
					}
					else
					{
						[_forEachIndex, "ENEMY", true] call _setStatus;
					};
				}
				else
				{
					[_forEachIndex, "FRIENDLY", true] call _setStatus;
				};
			}
			else
			{
				if (_enemyCount > 0) then
				{
					if (_friendlyCount > 0) then
					{
						[_forEachIndex, "MIXED", false] call _setStatus;
					}
					else
					{
						[_forEachIndex, "ENEMY", false] call _setStatus;
					};
				}
				else
				{
					if (_friendlyCount > 0) then
					{
						[_forEachIndex, "FRIENDLY", false] call _setStatus;
					}
					else
					{
						[_forEachIndex, "EMPTY", false] call _setStatus;
					};
				};
			};
		} forEach _bases;
		
		sleep 1;
	};
};
