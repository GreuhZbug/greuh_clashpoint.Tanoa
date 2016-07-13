_grp = createGroup RESISTANCE;
{ deletevehicle _x } foreach units _grp;
_soldier = objNull;
waitUntil { !isNil "homemade_militias" };

_class = "";
_nb_soldiers = 15 * (param_ai_groups / 3);
if ( _nb_soldiers > 30 ) then {
	_nb_soldiers = 30;
};
_posit = getpos flashpoint;

for [ {_idx=0},{_idx< _nb_soldiers},{_idx=_idx+1}] do {
	_class = militia call BIS_fnc_selectRandom;
	_class createUnit [_posit, _grp,"_soldier = this", 0.5, "private"];
	_soldier unlinkItem "NVGoggles_INDEP";
	_soldier unlinkItem "NVGoggles_OPFOR";
	_soldier addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
};

_allbuildings = nearestObjects [_posit, [], 40 ];
_buildingpositions = [];
{
	_buildingpositions = _buildingpositions + ( [_x] call BIS_fnc_buildingPositions );
} foreach _allbuildings;

if ( count _buildingpositions > 0 ) then {
	_usedposits = [];
	_nextposit = -1;
	_remainingposits = count _buildingpositions;
	{
		if ( ( random 100 ) > 50 ) then {
			if ( _remainingposits > 2 ) then {
				_nextposit = (floor (random (count _buildingpositions)));
				while { _nextposit in _usedposits } do {
					_nextposit = (floor (random (count _buildingpositions)));
				};
				_usedposits = _usedposits + [_nextposit];
				_x setdir (random 360);
				_x setpos (_buildingpositions select _nextposit);
				[_x] spawn building_defence_ai;
				_x setUnitPos "UP";
				_remainingposits = _remainingposits - 1;
			};
		};
	} foreach (units _grp);
};

indep_created = true;

sleep 5;

while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
{_x doFollow leader _grp} foreach units _grp;
_waypoint = _grp addWaypoint [getpos flashpoint, 4];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointCompletionRadius 0;