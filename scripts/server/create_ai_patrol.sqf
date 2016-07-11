_grp = _this select 0;
_posit = getpos (leader _grp);

while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
{_x doFollow leader _grp} foreach units _grp;
_waypoint = _grp addWaypoint [_posit, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointCombatMode "YELLOW"; 
_waypoint setWaypointCompletionRadius 5;
_waypoint setWaypointSpeed "LIMITED";
_waypoint = _grp addWaypoint [_posit, 80];
_waypoint = _grp addWaypoint [_posit, 60];
_waypoint = _grp addWaypoint [_posit, 40];
_waypoint setWaypointType "CYCLE";
_grp setCurrentWaypoint [_grp, 0];
