_side = _this select 0;
_basepos = [];
_pos = [];
_vehicles = [];

if ( isNil "managed_vehicles" ) then { managed_vehicles = [] };

if (_side == WEST) then {
	_basepos = getpos blufor_base;
	_vehicles = blufor_vehicles;
} else {
	_basepos = getpos opfor_base;
	_vehicles = opfor_vehicles;
};

_spawnangle = random 360;
_spawndistance = 18 + (random 6);
_vehicleclass = _vehicles call BIS_fnc_selectRandom;
_pos = [(_basepos select 0) + (_spawndistance * (cos _spawnangle)), (_basepos select 1) + (_spawndistance * (sin _spawnangle))];
_pos = _pos findEmptyPosition [5, 150, "B_Heli_Light_01_F"];
if ( count _pos == 0 ) then {
	_pos = [(_basepos select 0) + (_spawndistance * (cos _spawnangle)), (_basepos select 1) + (_spawndistance * (sin _spawnangle))];
};

_veh = _vehicleclass createVehicle _pos;
_veh setpos _pos;
_veh setVectorUp surfaceNormal position _veh;
createVehicleCrew _veh;
sleep 0.1;
_grp = (group ((crew _veh) select 0));
_veh setVehicleLock "LOCKEDPLAYER";
managed_vehicles = managed_vehicles + [_veh];

{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}] } foreach units _grp;

[_grp] call waypoint_logic;