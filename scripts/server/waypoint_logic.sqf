_grp = _this select 0;
_side = side leader _grp;
_basepos = base_position_blufor;
if(_side == EAST) then {
	_basepos = base_position_opfor;
};

sleep 5;

while { (leader _grp) distance _basepos < 60 } do {
	while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
	{_x doFollow leader _grp} foreach units _grp;
	_waypoint = _grp addWaypoint [getpos flashpoint, 200];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "AWARE";
	_waypoint setWaypointCombatMode "RED";
	_waypoint setWaypointCompletionRadius 10;
	_waypoint = _grp addWaypoint [getpos flashpoint, 5];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "AWARE";
	_waypoint setWaypointCombatMode "YELLOW";
	_waypoint setWaypointCompletionRadius 3;
	_waypoint = _grp addWaypoint [getpos flashpoint, 25];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "COMBAT";
	_waypoint setWaypointCombatMode "GREEN";
	_waypoint setWaypointCompletionRadius 3;
	_grp allowFleeing 0;
	sleep 60;
};