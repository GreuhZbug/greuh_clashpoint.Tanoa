// Conf
_zone_nb = 20;

_idx = 1;
_zone_valid = true;
_zones = [];
_testsmrk = ["_blufor","_opfor","_flash1","_flash2","_flash3"];
while { _zone_valid } do {
	_zone =  format ["zone%1",_idx];
	{
		if (((getmarkerpos (_zone + _x)) select 0 == 0 )) then {
			_zone_valid = false;
		};
	} foreach _testsmrk;
	
	if ( _zone_valid ) then {
		_idx = _idx + 1;
		_zones = _zones + [_zone];
	};
};

if ( isNil "debugzones" ) then { debugzones = false };
if (debugzones) then {
	hint format ["DEBUG : %1 valid zones loaded", count _zones];
};

_blufor = "_blufor";
_opfor = "_opfor";
_flashes = ["_flash1", "_flash2", "_flash3"];


_zone = "";
if (isNil "zonesDone") then { zonesDone = [] };
if (count zonesDone > (0.66 * (count _zones))) then { zonesDone = [] };
while { _zone == "" || _zone in zonesDone } do {
	_zone = _zones select (floor (random (count _zones)));
};
zonesDone = zonesDone + [_zone];
_blufor_base = _zone + _blufor;
_opfor_base = _zone + _opfor;
_flashpoint = _zone + (_flashes select (floor (random (count _flashes))));

if ( invertedspawns ) then { 
	_blufor_base = _zone + _opfor; 
	_opfor_base = _zone + _blufor;
};


_movex = (getpos flashpoint select 0) - (getmarkerpos _flashpoint select 0);
_movey = (getpos flashpoint select 1) - (getmarkerpos _flashpoint select 1);

{_x setpos [(getpos _x select 0) - _movex,(getpos _x select 1) - _movey,0]} foreach flashpoint_objs;

_movex = (getpos blufor_base select 0) - (getmarkerpos _blufor_base select 0);
_movey = (getpos blufor_base select 1) - (getmarkerpos _blufor_base select 1);

{_x setpos [(getpos _x select 0) - _movex,(getpos _x select 1) - _movey,0]} foreach blufor_base_objs;

_movex = (getpos opfor_base select 0) - (getmarkerpos _opfor_base select 0);
_movey = (getpos opfor_base select 1) - (getmarkerpos _opfor_base select 1);

{_x setpos [(getpos _x select 0) - _movex,(getpos _x select 1) - _movey,0]} foreach opfor_base_objs;

point_trigger setpos getpos flashpoint;

flag_blufor setpos getmarkerpos "flag_reset";
flag_opfor setpos getmarkerpos "flag_reset";
flag_resistance setpos getpos flashpoint;

indep_created = false;
[] spawn create_indep;
[] spawn create_civ;
waitUntil { indep_created };

base_position_blufor = getmarkerpos _blufor_base; publicVariable "base_position_blufor";
base_position_opfor = getmarkerpos _opfor_base; publicVariable "base_position_opfor";

sleep 0.2;
base_is_ready = true; publicVariable "base_is_ready";

waitUntil { !isNil "timeofdayvar" };

if(!(timeofdayvar > 6 && timeofdayvar < 18)) then {
	_light1 = "Chemlight_blue" createVehicle [(getMarkerPos _blufor_base select 0)+1,(getMarkerPos _blufor_base select 1)+1];
	_light2 = "Chemlight_red" createVehicle [(getMarkerPos _opfor_base select 0)+1,(getMarkerPos _opfor_base select 1)+1];
};
