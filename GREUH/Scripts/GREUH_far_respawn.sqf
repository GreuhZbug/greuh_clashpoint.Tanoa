if ( isMultiplayer ) then {
	player setDamage 1;
} else {
	player setVariable [ "FAR_isUnconscious", 0, true];
	force_respawn = true;
	singleplayer_respawn = true;
	uiSleep 0.2;
	player setDamage 0;
	[] execVM "onPlayerRespawn.sqf";
};