while { true } do {
	if ( current_roundstate == 1 ) then {
		_thislist = list point_trigger;
		if ( ( RESISTANCE countside _thislist > ( ( WEST countside _thislist ) + ( EAST countside _thislist ) ) ) && flashpoint_side != "res" ) then {
			flashpoint_side = "res";
			publicVariable "flashpoint_side";
			flag_blufor setpos getmarkerpos "flag_reset";
			flag_opfor setpos getmarkerpos "flag_reset";
			flag_resistance setpos getpos flashpoint;
		};

		if ( ( WEST countside _thislist > ( ( RESISTANCE countside _thislist ) + ( EAST countside _thislist ) ) ) && flashpoint_side != "blufor" ) then {
			flashpoint_side = "blufor";
			publicVariable "flashpoint_side";
			flag_blufor setpos getpos flashpoint;
			flag_opfor setpos getmarkerpos "flag_reset";
			flag_resistance setpos getmarkerpos "flag_reset";
		};

		if ( ( EAST countside _thislist > ( ( WEST countside _thislist ) + ( RESISTANCE countside _thislist ) ) ) && flashpoint_side != "opfor" ) then {
			flashpoint_side = "opfor";
			publicVariable "flashpoint_side";
			flag_blufor setpos getmarkerpos "flag_reset";
			flag_opfor setpos getpos flashpoint;
			flag_resistance setpos getmarkerpos "flag_reset";
		};
	};
	sleep 1;
};