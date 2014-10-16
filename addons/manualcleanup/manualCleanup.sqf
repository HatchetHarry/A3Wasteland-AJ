//@file Name: manualCleanup.sqf

if (!isServer) exitWith{};

	manualCleanup = {
    _cleanList = _this;
	_logmessage ="";
	_logmessage = _logmessage + "*** BEFORE CLEANUP ***";
    {
        _logmessage = _logmessage + str [_x, count allMissionObjects _x];
        {
            deleteVehicle _x;
            { deleteVehicle _x; } forEach (nearestObjects [getPosASL _x,[],3]);
        } forEach allMissionObjects _x;
    } forEach _cleanList;

   	_logmessage = _logmessage + "*** AFTER CLEANUP ***";
    { 	_logmessage = _logmessage + str [_x, count allMissionObjects _x]; } forEach _cleanList;

	_logmessage = _logmessage + "*** CLEANUP COMPLETE ***";
    diag_log _logmessage;
};


while {true} do {
sleep 600;
[
  //  "GroundWeaponHolder", //Weapons dropped to ground / Waffen die am Boden liegen, keine physik- fallen nicht zu boden, weniger netzwerksyncs
  //  "WeaponHolderSimulated", //Weapons dropped to ground /Waffen die am Boden Liegen
    "CraterLong",		// craters created by air crashes
  //  "Default",			
      "Ruins",			//ruinen
 //   "EmptyDetector",  //Triggers which stay in mission space - Clear manually - needed for territory system
    "#smokesource",
    "#destructioneffects"
] spawn manualCleanUp;

};