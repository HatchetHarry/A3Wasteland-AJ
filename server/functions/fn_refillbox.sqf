//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box allowDamage false; // No more fucking busted crates

// Clear pre-existing cargo first
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{

	case "mission_aj_custom0":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["wep", "arifle_MX_F", 2, 4],
			["wep", "arifle_MXC_F", 2],
			["wep", "arifle_MX_GL_F", 2],
			["wep", "arifle_MXM_F", 2],
			["wep", "LMG_Mk200_F", 1, 2],
			["wep", "arifle_MX_SW_F", 1, 3],
			["wep", "hgun_Pistol_heavy_01_F", 2, 4],
			["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(0,6)],
			["mag", "SmokeShellYellow", RANDOM_BETWEEN(0,6)],
			["mag", "HandGrenade", RANDOM_BETWEEN(0,6)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)]
		];
    };
	case "mission_aj_custom1":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["wep", "launch_NLAW_F", 2, 2],
			["wep", "launch_RPG32_F", 2, 1],
			["wep", "launch_Titan_F", 1, 2],
			["wep", "launch_Titan_short_F", 1, 1],
			["mag", "Titan_AP", 2],
			["mag", "RPG32_HE_F", 2],
			["mag", "SmokeShellYellow", RANDOM_BETWEEN(0,6)],
			["mag", "HandGrenade", RANDOM_BETWEEN(0,6)]
		];
    };
	case "mission_aj_custom2":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["wep", "arifle_Katiba_F", 2, 4],
			["wep", "arifle_Katiba_C_F", 2],
			["wep", "arifle_Katiba_GL_F", 2],
			["wep", "LMG_Zafir_F", 1, 3],
			["wep", "srifle_DMR_01_F", 2, 3],
			["wep", "hgun_Pistol_heavy_02_F", 2, 2],
			["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(0,6)],
			["mag", "SmokeShellYellow", RANDOM_BETWEEN(0,6)],
			["mag", "HandGrenade", RANDOM_BETWEEN(0,6)],
			["itm", "optic_Aco", RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(0,2)]
		];
    };
	case "mission_aj_custom3":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["itm", "optic_Arco", RANDOM_BETWEEN(0,1)],
			["itm", "optic_Hamr", RANDOM_BETWEEN(0,1)],
			["itm", "optic_ACO_grn", RANDOM_BETWEEN(0,2)],
			["itm", "optic_Holosight", RANDOM_BETWEEN(0,2)],
			["itm", "optic_SOS", RANDOM_BETWEEN(0,1)],
			["itm", "itemGPS", RANDOM_BETWEEN(0,3)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(0,6)],
			["wep", "Laserdesignator", RANDOM_BETWEEN(0,3)],
			["itm", "muzzle_snds_B", RANDOM_BETWEEN(0,2)],
			["itm", "muzzle_snds_H_MG", RANDOM_BETWEEN(0,2)],
			["mag", "SmokeShell", RANDOM_BETWEEN(0,2)],
			["mag", "SmokeShellRed", RANDOM_BETWEEN(0,2)],
			["mag", "SmokeShellGreen", RANDOM_BETWEEN(0,2)],
			["mag", "SmokeShellPurple", RANDOM_BETWEEN(0,2)],
			["mag", "SmokeShellBlue", RANDOM_BETWEEN(0,2)],
			["mag", "SmokeShellOrange", RANDOM_BETWEEN(0,2)],
			["mag", "HandGrenade", RANDOM_BETWEEN(0,10)],
			["itm", "Medikit", RANDOM_BETWEEN(0,3)]
		];
    };
	case "mission_aj_custom4":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["wep", "launch_NLAW_F", 2, 2],
			["wep", "launch_RPG32_F", 2, 1],
			["wep", "launch_Titan_F", 1, 2],
			["wep", "launch_Titan_short_F", 2, 1],
			["mag", "Titan_AP", 2],
			["mag", "RPG32_HE_F", 2]
		];
    };
	case "mission_aj_custom5":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["wep", "arifle_MX_Black_F", 3, 3],
			["wep", "arifle_MXC_Black_F", 3],
			["wep", "arifle_MX_GL_Black_F", 3],
			["wep", "arifle_MXM_Black_F", 2],
			["wep", "arifle_MX_SW_Black_F", 2, 3],
			["wep", "srifle_EBR_F", 2, 3],
			["itm", "optic_Aco", RANDOM_BETWEEN(0,3)],
			["itm", "MiniGrenade", RANDOM_BETWEEN(0,6)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(0,6)],
			["itm", "Medikit", RANDOM_BETWEEN(0,3)]
		];
    };
	case "mission_aj_custom6":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["wep", "srifle_GM6_F", 1, RANDOM_BETWEEN(0,3)],
			["wep", "arifle_Katiba_F", 3, 3],
			["wep", "hgun_Pistol_heavy_02_F", 3, 2],
			["wep", "Rangefinder", 2],
			["itm", "optic_SOS", RANDOM_BETWEEN(0,1)],
			["itm", "optic_ACO_grn", RANDOM_BETWEEN(0,3)],
			["mag", "SmokeShellYellow", RANDOM_BETWEEN(0,6)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(0,6)],
			["itm", "Medikit", RANDOM_BETWEEN(0,2)]
		];
    };
	case "mission_aj_custom7":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["wep", "srifle_LRR_F", 1, RANDOM_BETWEEN(0,3)],
			["wep", "arifle_MXC_Black_F", 3, 3],
			["wep", "hgun_Pistol_heavy_01_F", 3, 6],
			["wep", "Rangefinder", 2],
			["itm", "optic_SOS", RANDOM_BETWEEN(0,1)],
			["itm", "optic_ACO_grn", RANDOM_BETWEEN(0,3)],
			["mag", "SmokeShellYellow", RANDOM_BETWEEN(0,6)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(0,6)],
			["itm", "Medikit", RANDOM_BETWEEN(0,2)]
		];
    };
	case "mission_aj_custom8":
	{
    	_boxItems =
		[
			//Author: Master / Staynex
			// Item type, Item class, # of items, # of magazines per weapon
			["mag", "APERSTripMine_Wire_Mag", 6],
			["mag", "ATMine_Range_Mag", 2],
			["mag", "APERSMine_Range_Mag", 3],
			["mag", "APERSBoundingMine_Range_Mag", 3],
			["mag", "SLAMDirectionalMine_Wire_Mag", 3],
			["mag", "Claymore Charge", 3],
			["mag", "DemoCharge_Remote_Mag", 3],
			["mag", "SatchelCharge_Remote_Mag", 2],
			["itm", "MineDetector", RANDOM_BETWEEN(0,3)],
			["mag", "HandGrenade", RANDOM_BETWEEN(0,10)]
		];
    };
    case "mission_USLaunchers":
	{
    	_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["launch_RPG32_F", "launch_NLAW_F", "launch_Titan_short_F"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(1,2)],
			["wep", "launch_Titan_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(5,10)]
		];
    };
    case "mission_USSpecial":
	{
    	_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["itm", "NVGoggles", 5],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,5)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
			["itm", ["optic_MRCO", "optic_Arco", "optic_Hamr", "optic_SOS"], RANDOM_BETWEEN(0,2)],
			["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp"], RANDOM_BETWEEN(0,3)],
			["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
			["wep", ["arifle_MXM_F", "srifle_EBR_F", "srifle_DMR_01_DMS_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["LMG_Mk200_F", "LMG_Zafir_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["mag", "30Rnd_556x45_Stanag", RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(4,8)],
			["mag", "9Rnd_45ACP_Mag", RANDOM_BETWEEN(1,5)]
		];
    };
	case "mission_Main_A3snipers":
	{
    	_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["wep", ["srifle_LRR_SOS_F", "srifle_LRR_camo_SOS_F", "srifle_GM6_SOS_F", "srifle_GM6_camo_SOS_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,3)],
			["itm", "optic_DMS", RANDOM_BETWEEN(1,2)]
		];
    };
};

[_box, _boxItems] call processItems;

  
  