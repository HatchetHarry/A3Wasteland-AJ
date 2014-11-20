//	@file Version: 1.0
//	@file Name: customUniforms.sqf
//	@file Author: wiking.at
//	Allow custom uniforms for clan's regulary playing on our server

if (isServer) exitWith{}; 

// Armajunkies Members
_ajUIDs =[
		// Put player UIDs here
		"76561197960315007", //JOe
		"76561197970396192", //Wiking
		"76561197969673156", //Xerxio
		"76561198054115496", //Staynex	
		"76561198085527385", //Master
		"76561197961882491", //Werwolf
		"76561197960625215", //Krayzie
		"76561198107220085", //RambosBro
		"76561198068898395", //ElSchnecko
		"76561198049986499", //Doppelnull
		"76561198028742047", //Fokker
		"76561198013876877", //Skalpi
		"76561197994865910", //SirRender
		"76561198004909636", //Lenion.at
		"76561198022550759", //Stalkersrb
		"76561198023341449" //Morli.at
		];
		
_norUIDs =[
		// Put player UIDs here
		"76561198014462128", //RookieMacG
		"76561198053524122", //EjaculaTor
		"76561197973416867", //VibraTor
		"76561197990355187", //Vingebil
		"76561198014452546" //SabotageJensen
		];
		
_odsUIDs =[
		// Put player UIDs here
		"76561197984762977", //MaxBooZe
		"76561198017330990", //Steeps
		"76561197972453056", //Munchy
		"76561197961140210", //Hammell
		"76561198055334494", //Murphy
		"76561197961010009", //Zrix
		"76561197978166339", //Jedimushroom
		"76561197988554739", //Manibou
		"76561197973503004", //Adam
		"76561197988432394", //Napalm
		"76561197989313757", //Rick Bazooka
		"76561198012140148", //Rambro
		"76561197999924036", //Fizzco
		"76561198003525693", //L4gi
		"76561197993877610", //Deviant
        "76561198074661089", //Apples
		"76561197984580114", //C.Project
		"76561197986345212"  //Cyres
		];
		
		

// Check if Player is in Indi and AJ
if (playerSide == independent && (getPlayerUID player in _ajUIDs))  then
 { 
	[] spawn  // Uniform
	{
		while {true} do
		{
			waitUntil {uniform player == "U_I_CombatUniform"}; 
			player setObjectTextureGlobal [0,"addons\customuniforms\textures\u_armajunkies.jpg"];
			//If player is wearing Carryall (Urban) use the black texture hidden in A3Default PBO instead
			if ((backpack player) == "B_Carryall_oucamo") then
			{
			backpackContainer player setObjectTextureGlobal [0,"\A3\weapons_f\ammoboxes\bags\Data\backpack_tortila_blk_co.paa"];
			};
			if ((headgear player) == "H_MilCap_dgtl") then
			{
			sleep 1;
			player addHeadgear "H_Watchcap_blk";
			};			
			//backpackContainer player setObjectTextureGlobal [0,"#(rgb,8,8,3)color(0.16,0.16,0.16,1)"]; //change backpack color to dark black - disabled because there it is really black or nearly white with arma colors
			waitUntil {uniform player != "U_I_CombatUniform"};  //If player changes Uniform go to the top of the while loop
		};
	};
};

if (playerSide == independent && (getPlayerUID player in _norUIDs))  then
 { 
	[] spawn  // Uniform
	{
		while {true} do
		{
			waitUntil {uniform player == "U_I_CombatUniform"}; 
			player setObjectTextureGlobal [0,"addons\customuniforms\textures\nor_indep_uniform_wood_co.jpg"];
			waitUntil {uniform player != "U_I_CombatUniform"};  //If player changes Uniform go to the top of the while loop
		};
	};
};

if (playerSide == independent && (getPlayerUID player in _odsUIDs))  then
 { 
	[] spawn  // Uniform
	{
		while {true} do
		{
			waitUntil {uniform player == "U_I_CombatUniform"}; 
			player setObjectTextureGlobal [0,"addons\customuniforms\textures\u_ods.jpg"];
			waitUntil {uniform player != "U_I_CombatUniform"};  //If player changes Uniform go to the top of the while loop
		};
	};
};


