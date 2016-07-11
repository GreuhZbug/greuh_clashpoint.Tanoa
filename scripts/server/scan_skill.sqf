while { true } do {
	{
		if ( !isPlayer _x && local _x ) then {
			[_x] call setskills;
		};
		sleep 0.1;
	} foreach allUnits;
	sleep 0.2;
};