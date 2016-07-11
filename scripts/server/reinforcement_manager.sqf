sleep 5;
waitUntil { !isNil "param_round_duration" && !isNil "blufor_timer" && !isNil "opfor_timer" };

while { true } do {

	waitUntil { current_roundstate == 1 };
	
	blufor_used_reinforcement = 0;
	opfor_used_reinforcement = 0;
	reinforcement_timer = (param_round_duration * 0.8) - (floor (random (param_round_duration * 0.35)));
	
	while { current_roundstate == 1 } do {
	
		if ( (opfor_timer < reinforcement_timer) && blufor_used_reinforcement == 0 ) then {
			blufor_used_reinforcement = 1;
			[WEST] spawn create_ai_vehicle; 
			sleep 5;
			[createGroup WEST, true] spawn create_ai_group; 
			sleep 5;
			if (random 100 < 50 ) then {
				[createGroup WEST, true] spawn create_ai_group; 
			} else {
				[WEST] spawn create_ai_vehicle; 
			};
		};
		
		sleep 3;
		
		if ( (blufor_timer < reinforcement_timer) && opfor_used_reinforcement == 0 ) then {
			opfor_used_reinforcement = 1;
			[EAST] spawn create_ai_vehicle; 
			sleep 5;
			[createGroup EAST, true] spawn create_ai_group; 
			sleep 5;
			if (random 100 < 50 ) then {
				[createGroup EAST, true] spawn create_ai_group; 
			} else {
				[EAST] spawn create_ai_vehicle; 
			};
		};
		sleep 3;
	};
	sleep 1;
};

