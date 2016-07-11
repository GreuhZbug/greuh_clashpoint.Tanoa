_idx = 0;
_nbcivs = (floor (random 8));
_posit = getpos flashpoint;
while { _idx < _nbcivs } do {
	_spawnpos = [(((_posit select 0) + 50) - (random 100)),(((_posit select 1) + 50) - (random 100)),0];
	_grp = createGroup CIVILIAN;
	(civilians select (floor (random (count civilians)))) createUnit [_spawnpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
	[_grp] call add_civ_waypoints;
	_idx = _idx + 1;
};
