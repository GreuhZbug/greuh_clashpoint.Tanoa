_cleanup_delay = 600;

_unit = _this select 0;
_killer = _this select 1;
_side = side _killer;
_nameKiller = name _killer;

if ( !isDedicated ) then {
	if ( isPlayer _unit || isPlayer _killer || (!isMultiplayer && ((_unit in (units group player)) || (_killer in (units group player)) ))) then {
		[_unit,_killer] call killspam_add;
	};
};

sleep 1;

if( isServer && !isplayer _unit) then {
	sleep 3;
	if ( isNil "west_dumpgroup" ) then { west_dumpgroup = createGroup WEST; };
	if ( isNil "east_dumpgroup" ) then { east_dumpgroup = createGroup EAST; };
	if ( side (group _unit) == WEST ) then { [_unit] join west_dumpgroup };
	if ( side (group _unit) == EAST ) then { [_unit] join east_dumpgroup };
	sleep _cleanup_delay;
	hidebody _unit;
	sleep 10;
	deleteVehicle _unit;
};