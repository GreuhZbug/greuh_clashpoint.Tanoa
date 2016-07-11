winner = ""; publicVariable "winner";
current_roundstate = 0;
invertedspawns = false; publicVariable "invertedspawns";
blufor_score = 0; publicVariable "blufor_score";
opfor_score = 0; publicVariable "opfor_score";

_firstround = true;

[] call init_bases;
[] spawn flag_manager;

if ( isNil "managed_vehicles" ) then { managed_vehicles = [] };

while { true } do {

	current_roundstate = 0; publicVariable "current_roundstate";
	sleep 1;
	if (random 100 < 50 ) then { invertedspawns = true } else { invertedspawns = false };
	publicVariable "invertedspawns";
	_hours = -1;
	if ( _firstround ) then {
		_hours = 7;
	} else {
		_hours = floor (random 24);
		if(param_day_or_night == 1) then {
			_hours = (floor (random 12)) + 6;
		};
		if(param_day_or_night == 2) then {
			_hours = (floor (random 2));
		};
	};
	_minutes = floor (random 60);
	timeofdayvar = _hours;
	server_date = [date select 0, date select 1, date select 2, _hours, _minutes]; publicVariable "server_date";
	winner = ""; publicVariable "winner";
	setDate server_date;

	if( _firstround ) then {
		_firstround = false;
	} else {
		_weather = (((random (100 + weather_offset)) - weather_offset) / 100.0);
		if ( _weather < 0 ) then { _weather = 0 };
		if ( param_weather == 1 ) then {
			_weather = 0.25;
		};
		server_weather = _weather; publicVariable "server_weather";

		if(isDedicated) then {
			0 setOvercast server_weather;
			_fog = 0;
			if(server_weather > 0.65) then {
				_fog = 0.2;
			};
			if(server_weather > 0.95) then {
				_fog = 0.7;
			};
			0 setFog _fog;
			forceWeatherChange;
		};
	};

	{
		if ( !isPlayer _x ) then {
			deletevehicle _x;
			_x removeAllEventHandlers "MPKilled";
		};
	} foreach allunits;
	{ deletevehicle _x; } foreach managed_vehicles;
	managed_vehicles = [];
	[] call setup_bases;
	sleep 2;

	current_roundstate = 1; publicVariable "current_roundstate";

	force_respawn = true; publicVariable "force_respawn";
	blufor_timer = param_round_duration; publicVariable "blufor_timer";
	opfor_timer = param_round_duration; publicVariable "opfor_timer";
	flashpoint_side = "res"; publicVariable "flashpoint_side";

	while { blufor_timer > 0 && opfor_timer > 0 } do {
		if ( flashpoint_side == "blufor" ) then { blufor_timer = blufor_timer - 1; publicVariable "blufor_timer"; };
		if ( flashpoint_side == "opfor" ) then { opfor_timer = opfor_timer - 1; publicVariable "opfor_timer"; };
		sleep 1;
	};

	current_roundstate = 2; publicVariable "current_roundstate";

	if ( blufor_timer < opfor_timer)
	then {
		winner = "blufor"; publicVariable "winner";
		blufor_score = blufor_score + 1; publicVariable "blufor_score";
	} else {
		winner = "opfor"; publicVariable "winner";
		opfor_score = opfor_score + 1; publicVariable "opfor_score";
	};

	{
		if ( !isPlayer _x ) then {
			_x removeAllEventHandlers "MPKilled";
			deletevehicle _x;
		};
	} foreach allunits;

	base_is_ready = false; publicVariable "base_is_ready";

	sleep 13;
};