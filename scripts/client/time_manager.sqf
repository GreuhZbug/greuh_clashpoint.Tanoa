waitUntil { !isNil "server_date" && !isNil "current_roundstate" && !isNil "server_weather" };

while { true } do {
	waitUntil { current_roundstate == 0 };
	sleep 1.5;
	setDate server_date;
	0 setOvercast server_weather;
	_fog = 0;
	if(server_weather > 0.65) then {
		_fog = 0.2;
	};
	if(server_weather > 0.95) then {
		_fog = 0.7;
	};
	0 setFog _fog;
	sleep 0.5;
	forceWeatherChange;
	waitUntil { current_roundstate == 1};
}