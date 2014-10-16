//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

//player createDiarySubject ["infos", "Infos and Help"];
player createDiarySubject ["credits", "Credits"];
player createDiarySubject ["infos-en", "Important Infos"];


player createDiaryRecord ["infos-en",
[
"ARMAJUNKIES",
"
Armajunkies is a german speaking Arma community consisting mainly of players from Germany, Austria and Switzerland. You can find additional information at http://www.armajunkies.de
"
]];

player createDiaryRecord ["infos-en",
[
"FEEDBACK",
"
Feedback  is always very welcome. The easiest way to reach us is through our forum at http://www.armajunkies.de<br /><br />We also run a teamspeak server at ts3.armajunkies.de. As we are a german speaking community there may be no english speaking people online in teamspeak.
"
]];

player createDiaryRecord ["infos-en",
[
"SERVER PERFORMANCE",
"
We are running the Server with the latest CHIMERA Server build (PERF) . We are using a RAM-Disk for the ARMA Files and a dedicated High-End-Server with 64GB RAM for optimal Performance.  Therefore we hope we can provide the best performance possible to our players.<br /><br />
 In the unlikely event ;-) that you still get bad server performance please let us know.
"
]];

player createDiaryRecord ["infos-en",
[
"ZEUS ENABLED",
"
We enabled the Zeus Feature on this server to allow selected Players to act as a Game-Master and create more diversity for our Players . If a Zeus is online you can Ping him by pressing the Zeus Key (default: Z). Zeus is controlling the OPFOR-Faction on this server if he creates custom missions.<br /><br />
Our Zeus Players can only use Zeus if they log in using dedicated Slots which are not saved and therefore gain no advantage if they play on non-Zeus slots.
"
]];

player createDiaryRecord ["infos-en",
[
"NO ADMIN/DONATOR PERKS",
"
On this server there are no features which help admins or donators at the gameplay. There is also currently no need for you to donate anything. Just play and have fun.<br /><br />Wait - there is one thing you could do - if you like our server tell your friends about the 'Armajunkies'-Server so we can get the player slots filled for maximum pvp action :)
"
]];

player createDiaryRecord ["infos-en",
[
"ALLOWED CLIENT MODS",
"
Advanced arma players will be glad to know that this server is supporting several client-side mods:<br /><br />Blastcore: A visual effects package for the A3 Platform. Better explosions and light effects.<br /><br />JSRS: Sound modification. Better distance feeling and nice alternative sound effects.<br /><br />Speed of Soundv2: Another Sound modification. Better distance feeling and nice alternative sound effects. Only use one of these.<br /><br />FSF Sac Ventral: Allows to put the backpack in a ventral position to realize a parachute jump. You can find parachutes in the inventory of helicopters on this server.<br /><br />MagRepack: Lets you consolidate your non-full magazines (Shortcut for Menu: CTRL+R).<br /><br />VTS_WeaponResting: Allows you to rest your weapon on objects and improve your shooting stability (Shortcut for resting CTRL+Space).
"
]];

player createDiaryRecord ["infos-en",
[
"PLAYER STATUS HUD",
"
In the below right corner there are Status Displays situated:<br /><br />Stamina, account balance, money, thirst, hunger and health.<br /><br />Stamina replenishes if you take a break or use an energy drink. Also the weight you are carring is influencing your stamina.<br />Account Balance shows your current account balance.<br />Money, well eh - buys things and is dropped if you get killed.<br />To get rid of low hunger and thirst levels you can buy food and water at the general store or loot other dead players.<br />Health: If you are below 100 health you are wounded somewhere which negativly influences your combat readiness.<br />If you are passed out another player can revive you. If this is not an option you can choose to respawn.
"
]];

player createDiaryRecord ["infos-en",
[
"SAVE-SYSTEM/BASEBUILDING",
"
When you log out your player is safed with all his inventory and his money.<br /> <br />Base building parts which are bought in General Store are saved for 15 days if they are locked.<br /><br />Vehicles are currently not saved for optimal performance and replay value ;-)
"
]];
player createDiaryRecord ["infos-en",
[
"SALVAGING",
"
You can gain money by salvaging vehicles or the equipment of dead men. Wrecks and bodies are removed if you salvage.
"
]];

player createDiaryRecord ["infos-en",
[
"ATM's",
"
ATM's allow you to withdraw and deposit your money. Money deposited at an ATM persists through player death.
"
]];

player createDiaryRecord ["infos-en",
[
"REARM/RESUPPLY",
"
You can use the 'AJ Resupply Truck' to Rearm/Repair/Refuel your vehicles. This truck can be bought at the vehicle store or found at the 'supply truck' mission. Alternatively there are Resupply-Points on the Map which cost money.
"
]];

player createDiaryRecord ["infos-en",
[
"STORES",
"
With money you can buy weapons, ammo and scopes at the gun stores marked on the map. <br />The general stores offer uniforms, vests, backpacks and special items. They First Aid Kits which can be used to heal up to 100% health or energy drinks which allow you to sprint for 5 minutes straight.<br />Vehicle Stores offer all kinds of vehicles like cars, tanks, helicopters. You can also buy objects for building your own bases there.
"
]];

player createDiaryRecord ["infos-en",
[
"LOOT SPAWNS",
"
In spawn towns (blue circles on map) you can find vehicles containing loot.
"
]];

player createDiaryRecord ["infos-en",
[
"TERRITORY CAPTURE",
"
You can capture the territories marked A, B, C on the map for a large amount of money. If you are able to hold the territories you get lots of money in time intervals.<br /><br /> If you are BLUFOR everyone in your faction gets money if a territory is captured.<br /><br /> For the indpendent faction the territory system is working on a group level. So only everyone in your group gets the money.
"
]];
player createDiaryRecord ["infos-en",
[
"MISSIONS",
"
On the map there are several red markings which show the location's of active missions. You can complete this missions to get rewards like weapons, vehicles or money. This server is modded and prepared to allow lots of missions in parallel without impacting performance too much.
"
]];

helpTextBriefing_EN = player createDiaryRecord ["infos-en",
[
"GENERAL",
"
Welcome Soldier,<br /><br />Wasteland is an harsh environment where you can compete with other players and AI-controlled soldiers. For players there are 2 factions. BLUFOR players (Blue) fight together with other Bluefor players and against all others (no teamkilling).  Independent Players can kill everyone - even other Independent's. Independent's can form groups though and cooperate as a team against everyone else which makes this faction a popular choice.
"
]];

player createDiaryRecord ["credits",
[
"Credits",
"
<br/><font size='16' color='#BBBBBB'>Developed by Team Wasteland:</font>
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16' color='#BBBBBB'>Original Arma 2 Wasteland missions by:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16' color='#BBBBBB'>Improved and ported to Arma 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16' color='#BBBBBB'>Other contributors:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* Austerror (GitHub)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* Farooq (GitHub)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Krunch (GitHub)
<br/>	* madbull (R3F)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* Na_Palm (BIS forums)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* Shockwave (A3W forums)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>	* wiking.at (A3W forums)

<br/><font size='16' color='#BBBBBB'>Armajunkies-Extensions by:</font>
<br/>	* Moros
<br/>	* Wiking.at
<br/>	* Staynex
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"
]];


player createDiaryRecord ["infos",
[
"Hints and Tips",
"
<br/><font size='18'>A3Wasteland</font>
<br/>
<br/>* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.
<br/>
<br/>* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.
<br/>
<br/>* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.
<br/>
<br/>* Always be on the lookout for nightvision. they are located in the ammo crates, and there are pairs scattered throughout vehicles. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.
<br/>
<br/>* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.
<br/>
<br/>* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.
"
]];

player createDiaryRecord ["infos",
[
"About Wasteland",
"
<br/>Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress, please direct your reports to http://forums.a3wasteland.com/
<br/>
<br/>FAQ:
<br/>
<br/>Q. What am I supposed to do here?
<br/>A. See the above description
<br/>
<br/>Q. Where can I get a gun?
<br/>A. Weapons are found in one of three places, first in ammo crates that come as rewards from missions, inside and outside buildings, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
<br/>
<br/>Q. What are the grey circles on the map?
<br/>A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/>
<br/>Q. Why is it so dark, I cant see.
<br/>A. The server has a day/night cycle just like in the real world, and as such, night time is a factor in your survival. It is recommended that you find sources of light or use your Nightvision Goggles as the darkness sets in.
<br/>
<br/>Q. Is it ok for me to shoot my team mates?
<br/>A. If you are member of BLUFOR or OPFOR teams, then you are NOT allowed to shoot or steal items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
<br/>
<br/>Q. Whats with the canisters, baskets and big bags?
<br/>A. This game has a food and water system that you must stay on top of if you hope to survive. You can collect food and water from food sacks and wells, or baskets and plastic canisters dropped by dead players. Food and water will also randomly spawn around the map.
<br/>
<br/>Q. I saw someone breaking a rule, what do I do?
<br/>A. Simply go into global chat and get the attention of one of the admins or visit our forums, and make a report if the offense is serious.
"
]];
