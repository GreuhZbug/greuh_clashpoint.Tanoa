params [ "_grp", "_reinforcements" ];

private _side = side _grp;
private _basepos = [];
private _pos = [];
private _squad = [];
private _units_to_spawn = 8;

if ((_side == WEST && flashpoint_side == "blufor") || (_side == EAST && flashpoint_side == "opfor")) then {
	_units_to_spawn = 5;
};

if ( _reinforcements ) then {
	player_count = 0;
} else {
	player_count = { isPlayer _x && side _x == _side } count allUnits;
};

if (_side == WEST) then {
	_basepos = getpos blufor_base;
	_squad = blufor_squad;
} else {
	_basepos = getpos opfor_base;
	_squad = opfor_squad;
};

_spawnangle = random 360;
_spawndistance = 18 + (random 6);
_pos = [(_basepos select 0) + (_spawndistance * (cos _spawnangle)), (_basepos select 1) + (_spawndistance * (sin _spawnangle))];
_pos = _pos findEmptyPosition [5, 150, "B_Heli_Light_01_F"];
if ( count _pos == 0 ) then {
	_pos = [(_basepos select 0) + (_spawndistance * (cos _spawnangle)), (_basepos select 1) + (_spawndistance * (sin _spawnangle))];
};

_units_to_spawn = _units_to_spawn - (floor (player_count / 2));

if ( _units_to_spawn > 0 ) then {

	_idx = 0;
	while { _idx < _units_to_spawn } do {
		_rank = "private";
		if ( _idx == 0 ) then { _rank = "lieutenant"; };
		if ( _idx == 1 ) then { _rank = "sergeant"; };
		(_squad select _idx) createUnit [_pos, _grp,"", 0.5, _rank];
		_idx = _idx + 1;
	};

	{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}] } foreach units _grp;
	{_x doFollow leader _grp} foreach units _grp;

	[_grp] call waypoint_logic;

};