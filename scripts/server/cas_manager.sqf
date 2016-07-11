sleep 5;
waitUntil { !isNil "param_round_duration" && !isNil "current_roundstate" && !isNil "blufor_timer" && !isNil "opfor_timer" };

_spread = 40;

while { true } do {

	while { current_roundstate != 1 } do {
		sleep 0.97;
	};
	
	blufor_used = 0;
	opfor_used = 0;
	cas_timer_blufor= (param_round_duration * 0.75) - ((random param_round_duration) * 0.3) ;
	cas_timer_opfor	= (param_round_duration * 0.75) - ((random param_round_duration) * 0.3) ;
	emergency_timer = (param_round_duration * 0.12);
	emergency_run = 0;
	if ( random 100 < 33 ) then {
		emergency_run = 1;
	};
	
	while { current_roundstate == 1 } do {
	
		blufor_cas_possible = false;
		if( (({ side _x == EAST } count ( (getpos flashpoint) nearObjects ["Man", 100])) > 5) && flashpoint_side == "opfor" ) then { blufor_cas_possible = true };
		
		opfor_cas_possible = false;
		if( (({ side _x == WEST } count ( (getpos flashpoint) nearObjects ["Man", 100])) > 5) && flashpoint_side == "blufor" ) then { opfor_cas_possible = true };
	
		if ( (((opfor_timer < cas_timer_blufor) && blufor_used == 0) || ((opfor_timer < emergency_timer) && emergency_run == 1)) && blufor_cas_possible ) then {
			blufor_used = 1;
			if ((opfor_timer < emergency_timer) && emergency_run == 1) then {
				emergency_run = 0;
			};
			blufor_weapons = floor (random 3);
			_pos = getpos flashpoint; 
			_pos1 = [((_pos select 0) + (_spread / 2)) - (random _spread),((_pos select 1) + (_spread / 2)) - (random _spread), 0];
			_pos2 = [((_pos select 0) + (_spread / 2)) - (random _spread),((_pos select 1) + (_spread / 2)) - (random _spread), 0];
			
			_center = createCenter sideLogic;    
			_group = createGroup _center;    
			_cas = _group createUnit ["ModuleCAS_F",_pos1 , [], 0, ""];   
			_cas setDir (20 - (random 40));
			_cas setVariable ["vehicle",blufor_plane]; 
			_cas setVariable ["type", blufor_weapons];  
			
			sleep 5;
			
			_center = createCenter sideLogic;    
			_group = createGroup _center;   
			_cas = _group createUnit ["ModuleCAS_F",_pos2 , [], 0, ""];   
			_cas setDir (20 - (random 40));
			_cas setVariable ["vehicle",blufor_plane]; 
			_cas setVariable ["type", blufor_weapons];  
		};
		
		sleep 5;
		
		if ( (((blufor_timer < cas_timer_opfor) && opfor_used == 0) || ((blufor_timer < emergency_timer) && emergency_run == 1)) && opfor_cas_possible ) then {
			opfor_used = 1;
			if ((blufor_timer < emergency_timer) && emergency_run == 1) then {
				emergency_run = 0;
			};
			opfor_weapons = floor (random 3);
			_pos = getpos flashpoint; 
			_pos1 = [((_pos select 0) + (_spread / 2)) - (random _spread),((_pos select 1) + (_spread / 2)) - (random _spread), 0];
			_pos2 = [((_pos select 0) + (_spread / 2)) - (random _spread),((_pos select 1) + (_spread / 2)) - (random _spread), 0];
			
			_center = createCenter sideLogic;    
			_group = createGroup _center;    
			_cas = _group createUnit ["ModuleCAS_F",_pos1 , [], 0, ""];   
			_cas setDir (200 - (random 40));
			_cas setVariable ["vehicle",opfor_plane]; 
			_cas setVariable ["type", opfor_weapons];  
			
			sleep 5;
			
			_center = createCenter sideLogic;    
			_group = createGroup _center;    
			_cas = _group createUnit ["ModuleCAS_F",_pos2 , [], 0, ""];   
			_cas setDir (200 - (random 40));
			_cas setVariable ["vehicle",opfor_plane]; 
			_cas setVariable ["type", opfor_weapons];  

		};
		sleep 5;
	};
	sleep 0.5;
};

