waitUntil { !isNil "current_roundstate" && !isNil "base_is_ready" && !isNil "base_position_blufor" && !isNil "base_position_opfor" };

_trigger = objNull;
_base = objNull;
if ( isNil "force_respawn" ) then { force_respawn = false; };
if ( side player == WEST ) then {
	_base = blufor_base;
} else {
	_base = opfor_base;
};

while { true } do {
	waitUntil { ((!alive player || force_respawn) && current_roundstate == 1) };
	waitUntil { alive player && base_is_ready };
	if(force_respawn) then {
		sleep 1;
	};
	force_respawn = false;
	sleep 0.2;
	_basepos = base_position_blufor;
	if (playerside == EAST ) then {
		_basepos = base_position_opfor;
	};
	player setpos [((_basepos  select 0) + 4) - (random 8),((_basepos select 1) + 4) - (random 8),0];
	sleep 0.2;
	player setdamage 0;
	player setFatigue 0;
};