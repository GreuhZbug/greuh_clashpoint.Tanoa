_protection_distance = 20;
player_spawn_protected = false;
_protected_units = [];

waitUntil { !isNil "current_roundstate" };
while { true } do {
	waitUntil { current_roundstate == 1 };
		{
			if ( ((side _x == WEST) && (_x distance blufor_base <= _protection_distance)) || ((side _x == EAST) && (_x distance opfor_base <= _protection_distance))) then {
				if (!(_x in _protected_units)) then {
					_x allowDamage false;
					_protected_units = _protected_units + [_x];
					if (_x == player) then {
						player_spawn_protected = true;
						player setdamage 0;
						player setfatigue 0;
					};
				};
			} else {
				if (_x in _protected_units) then {
					_x allowDamage true;
					_protected_units = _protected_units - [_x];
					if (_x == player) then { player_spawn_protected = false; };
				};
			};
		} foreach allUnits;
	sleep 0.2;
};