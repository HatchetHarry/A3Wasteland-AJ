//	@file Name: fn_fatigueReset.sqf
//	@file Author: wiking.at

_maxfatigue = (["A3W_maxFatigue", 1] call getPublicVar);

if (_maxfatigue != 1) then {
	while {true} do {
        if (_maxfatigue < getFatigue player) then {
            player setFatigue _maxfatigue;
        };
        sleep 1.5;
	};
 };