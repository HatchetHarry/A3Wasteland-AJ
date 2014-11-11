//   @file Version: 1.0
//   @file Name: midGroup.sqf
//   @file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//   @file Created: 08/12/2012 21:58
//   @file Args:

if (!isServer) exitWith {};

private ["_group", "_pos", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6", "_man7"];

_group = _this select 0;
_pos = _this select 1;

// Leader
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 1, "Form"];
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
_man3 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man4 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
_man5 = _group createUnit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
_man6 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
_man7 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];

//let units initialize to get rid of the headgear randomizer init script
sleep 2;

removeAllAssignedItems _leader;
_leader addUniform "U_C_WorkerCoveralls";
_leader addGoggles "G_Lady_Mirror";
_leader addHeadGear "H_Beret_blk";
_leader addVest "V_PlateCarrier1_rgr";
_leader addBackpack "B_AssaultPack_rgr";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addWeapon "arifle_TRG21_F";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "RPG32_F";
_leader addWeapon "launch_RPG32_F";
_leader addMagazine "RPG32_HE_F";
_leader addMagazines ["SmokeShell", 2]; 
_leader addItemCargo["FirstAidKit",1];
_leader addPrimaryWeaponItem "acc_flashlight";
_leader linkItem "ItemRadio";

// Rifleman

removeAllAssignedItems _man2;
_man2 addUniform "U_C_WorkerCoveralls";
_man2 addGoggles "G_Lady_Mirror";
_man2 addHeadGear "H_HelmetB_paint";
_man2 addVest "V_PlateCarrier1_rgr";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addWeapon "arifle_TRG20_F";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addItemCargo["FirstAidKit",1];
_man2 addPrimaryWeaponItem "acc_flashlight";
_man2 linkItem "ItemRadio";
// Rifleman

removeAllAssignedItems _man3;
_man3 addUniform "U_C_WorkerCoveralls";
_man3 addGoggles "G_Lady_Mirror";
_man3 addHeadGear "H_HelmetB_paint";
_man3 addVest "V_PlateCarrier1_rgr";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addWeapon "arifle_TRG20_F";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addItemCargo["FirstAidKit",1];
_man3 addPrimaryWeaponItem "acc_flashlight";
_man3 linkItem "ItemRadio";

// Rifleman

removeAllAssignedItems _man4;
_man4 addUniform "U_C_WorkerCoveralls";
_man4 addGoggles "G_Lady_Mirror";
_man4 addHeadGear "H_HelmetB_paint";
_man4 addVest "V_PlateCarrier1_rgr";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "arifle_TRG20_F";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addItemCargo["FirstAidKit",1];
_man4 addPrimaryWeaponItem "acc_flashlight";
_man4 linkItem "ItemRadio";

// Rifleman

removeAllAssignedItems _man5;
_man5 addUniform "U_C_WorkerCoveralls";
_man5 addGoggles "G_Lady_Mirror";
_man5 addHeadGear "H_HelmetB_paint";
_man5 addVest "V_PlateCarrier1_rgr";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addWeapon "arifle_TRG20_F";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addItemCargo["FirstAidKit",1];
_man5 addPrimaryWeaponItem "acc_flashlight";
_man5 linkItem "ItemRadio";

// Rifleman

removeAllAssignedItems _man6;
_man6 addUniform "U_C_WorkerCoveralls";
_man6 addGoggles "G_Lady_Mirror";
_man6 addHeadGear "H_HelmetB_paint";
_man6 addVest "V_PlateCarrier1_rgr";
_man6 addMagazine "150Rnd_762x51_Box";
_man6 addWeapon "LMG_Zafir_F";
_man6 addMagazine "150Rnd_762x51_Box";
_man6 addMagazine "150Rnd_762x51_Box";
_man6 addPrimaryWeaponItem "acc_flashlight";
_man6 linkItem "ItemRadio";

// Grenadier

removeAllAssignedItems _man7;
_man7 addUniform "U_C_WorkerCoveralls";
_man7 addGoggles "G_Lady_Mirror";
_man7 addHeadGear "H_HelmetB_paint";
_man7 addVest "V_PlateCarrier1_rgr";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addWeapon "arifle_TRG21_GL_F";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazines ["SmokeShell", 2]; 
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addPrimaryWeaponItem "acc_flashlight";
_man7 linkItem "ItemRadio";

_leader = leader _group;

{
   _x spawn refillPrimaryAmmo;
 //  _x spawn addMilCap;  //removed
   _x call setMissionSkill;
   _x addRating 9999999;
   _x addEventHandler ["Killed", {_this call server_playerDied; (_this select 1) call removeNegativeScore}];
} forEach units _group;

[_group, _pos] call defendArea;