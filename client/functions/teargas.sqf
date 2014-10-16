////////////////////////////////////////////////////////////
// teargas.sqf
// call from units INIT with: _null = [this] execVM "teargas.sqf"
//Nutze SmokeShellBlue 1Rnd_SmokeBlue_Grenade_shell 3Rnd_SmokeBlue_Grenade_shell G_40mm_SmokeBlue  für Teargas
//G_40mm_SmokeYellow SmokeShellYellow
////////////////////////////////////////////////////////////

While{true} do {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal


waituntil{
(((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) 
and 
(getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 2))
or
(((nearestObject [getpos player, "G_40mm_SmokeYellow"]) distance player < 10) 
and 
(getpos (nearestObject [getpos player, "G_40mm_SmokeYellow"]) select 2 < 2))
};

    if ((headgear player != "H_CrewHelmetHeli_I") && 
		(headgear player != "H_CrewHelmetHeli_O") &&
		(headgear player != "H_CrewHelmetHeli_B") &&
		(headgear player != "H_PilotHelmetFighter_B") && 
		(headgear player != "H_PilotHelmetFighter_O") &&
		(headgear player != "H_PilotHelmetFighter_I")
		) then
    {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
enableCamShake true;	 // enables camera shake
addCamShake [10, 45, 10];	// sets shakevalues
player setFatigue 1; // sets the fatigue to 100%
5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds
    };

sleep 5;

};