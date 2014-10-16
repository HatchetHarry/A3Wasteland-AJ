//	@file Version: 1.0
//	@file Name: customUniforms.sqf
//	@file Author: wiking.at
//	Allow custom uniforms for clan's regulary playing on our server

//if (isServer) exitWith{}; 

// Armajunkies Members
_ajUIDs =[
		// Put player UIDs here
//		"76561198058098139", //Moros
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
		"76561198004909636", //Lenion.at
		"76561198023341449" //Morli.at
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
			//backpackContainer player setObjectTextureGlobal [0,"#(rgb,8,8,3)color(0.16,0.16,0.16,1)"]; //change backpack color to dark black - disabled because there it is really black or nearly white with arma colors
			waitUntil {uniform player != "U_I_CombatUniform"};  //If player changes Uniform go to the top of the while loop
		};
	};
};


