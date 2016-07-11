if ( isNil "GRLIB_respawn_loadout" ) then {
	removeAllWeapons player;
	player linkItem "NVGoggles";
} else {
	sleep 1;
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};

player setCustomAimCoef 0.35;
player setUnitRecoilCoefficient 0.6;

if (!isNil "param_stamina") then {
	if ( param_stamina == 0 ) then {
		player enableStamina false;
	} else {
		player enableStamina true;
	};
};