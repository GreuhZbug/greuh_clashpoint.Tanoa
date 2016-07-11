waitUntil{ alive player };

["Preload"] call BIS_fnc_arsenal;

killspam = [];
while {count killspam < 20} do {
	killspam = killspam + [[0,"","","",CIVILIAN,CIVILIAN]];
};
killspam_add = compile preprocessFileLineNumbers "scripts\client\killspam_add.sqf";

[] spawn compile preprocessFileLineNumbers "scripts\client\ui_manager.sqf";
[] spawn compile preprocessFileLineNumbers "scripts\client\spawn_manager.sqf";
[] spawn compile preprocessFileLineNumbers "scripts\client\time_manager.sqf";
[] spawn compile preprocessFileLineNumbers "scripts\client\victory_camera.sqf";
[] spawn compile preprocessFileLineNumbers "scripts\client\far_kill_listener.sqf";
[] spawn compile preprocessFileLineNumbers "scripts\client\far_medic_listener.sqf";
[] spawn compile preprocessFileLineNumbers "scripts\client\arsenal_manager.sqf";
[] spawn compile preprocessFileLineNumbers "scripts\client\init_arsenal.sqf";

if ( !isMultiplayer ) then {
	[] spawn compile preprocessFileLineNumbers "scripts\client\gimme_a_group.sqf";
};

player addMPEventHandler ["MPKilled", {_this spawn kill_manager}];

[] execVM "onPlayerRespawn.sqf";
[] execVM "scripts\client\intro.sqf";
