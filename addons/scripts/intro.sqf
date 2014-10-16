//	@file Version: 1.0
//	@file Name: intro.sqf
//	@file Author: wiking.at, original files by Cael1817, HellsGateGaming.com and IT07

_onScreenTime = 8;

sleep 40;

_role1 = "Welcome to Armajunkies A3Wasteland";
_role1names = ["This server restarts at", "9:00 and 18:00 CEST/GMT +1"];
_role2 = "Willkommen bei Armajunkies A3Wasteland";
_role2names = ["Der Server restartet um", "9:00 and 18:00 CEST/GMT +1"];
_role3 = "Improved Territory System";
_role3names = ["There are 3 Flags (A,B,C) on the map marking randomized capture areas. If you manage to capture them you get $5000 (stay in territory for 3 minutes). For every 15 mins you hold them you get $2500."];
_role4 = "Verbessertes Gebietssystem";
_role4names = ["Auf der Karte sind 3 Flaggen (A,B,C) eingezeichnet die einzunehmende Gebiete markieren. Beim Einnehmen erhältst du $5000 (3 Minuten in Gebiet bleiben). Für alle 15 Minuten die du das Gebiet hältst $2500. "];
_role5 = "Feedback";
_role5names = ["Feedback is always welcome. Visit www.armajunkies.de or our teamspeak (ts3.armajunkies.de). "];
_role6 = "Feedback";
_role6names = ["Wir freuen uns über euer Feedback. Besuche www.armajunkies.de oder unser Teamspeak (ts3.armajunkies.de)."];
_role7 = "Help System";
_role7names = ["Use your mousewheel to access the help menu. Some questions about special features are answered there. "];
_role8 = "Hilfesystem";
_role8names = ["Benutze das Mausrad um auf das Hilfesystem zuzugreifen. Einige Fragen über unsere Features werden dort beantwortet. Das Hilfesystem steht derzeit nur auf Englisch zur Verfügung. "];
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.50' color='#f2532f' align='left'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='left'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5  + 2);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [

[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names]
]