//@file Name: manualCleanup.sqf

if (isDedicated) exitWith {};

if ((getPlayerUID player) call isAdmin) then
{
	manualCleanup = {
    _cleanList = _this;
    systemChat "*** BEFORE CLEANUP ***";
    {
        systemChat str [_x, count allMissionObjects _x];
        {
            deleteVehicle _x;
            { deleteVehicle _x; } forEach (nearestObjects [getPosASL _x,[],3]);
        } forEach allMissionObjects _x;
    } forEach _cleanList;

    systemChat "*** AFTER CLEANUP ***";
    { systemChat str [_x, count allMissionObjects _x]; } forEach _cleanList;

    systemChat "*** CLEANUP COMPLETE ***";
};

[
    "GroundWeaponHolder",
    "WeaponHolderSimulated",
    "CraterLong",
   // "Default",
    "Ruins",
    //"EmptyDetector",
    "#smokesource",
    "#destructioneffects"
] spawn manualCleanUp;
};
