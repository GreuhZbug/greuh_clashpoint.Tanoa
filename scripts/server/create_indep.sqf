_grp = createGroup RESISTANCE;
{ deletevehicle _x } foreach units _grp;
_soldier = objNull;
waitUntil { !isNil "homemade_militias" };

_class = "";
_nb_soldiers = 20 * (param_ai_groups / 4);
if ( _nb_soldiers > 40 ) then {
	_nb_soldiers = 40;
};
_posit = getpos flashpoint;

_helmets = ["H_shemag_olive","H_shemag_khk","H_shemagopen_tan","H_milcap_ocamo"];
_loadouts = [["srifle_DMR_06_camo_F","20Rnd_762x51_Mag","V_bandollierB_khk"],["arifle_katiba_c_f","30Rnd_65x39_caseless_green","V_bandollierB_khk"],["arifle_katiba_c_f","30Rnd_65x39_caseless_green","V_bandollierB_khk"], ["arifle_trg20_f","30Rnd_556x45_Stanag_Tracer_Green","V_bandollierB_khk"],["arifle_trg20_f","30Rnd_556x45_Stanag_Tracer_Green","V_bandollierB_khk"],["arifle_mk20c_plain_F","30Rnd_556x45_Stanag_Tracer_Green","none"],["lmg_zafir_f","150rnd_762x51_box","V_HarnessO_brn"],["arifle_mk20c_plain_F","30Rnd_556x45_Stanag_Tracer_Green","none"],["smg_01_f","30rnd_45acp_mag_smg_01_tracer_green","none"]];

for [ {_idx=0},{_idx< _nb_soldiers},{_idx=_idx+1}] do {
	_class = militia call BIS_fnc_selectRandom;
	_class createUnit [_posit, _grp,"_soldier = this", 0.5, "private"];
	_soldier unlinkItem "NVGoggles_INDEP";
	_soldier unlinkItem "NVGoggles_OPFOR";
	_soldier addMPEventHandler ["MPKilled", {_this spawn kill_manager}];

	if ( homemade_militias ) then {

		removeAllWeapons _soldier;
		removeVest _soldier;
		removeHeadgear _soldier;

		if (random 100 < 80) then { _soldier addHeadgear (_helmets select (floor (random (count _helmets)))); };

		_loadout = (_loadouts select (floor (random (count _loadouts))));

		if ( (_loadout select 2) != "none" ) then { _soldier addVest (_loadout select 2) };

		_soldier addMagazine (_loadout select 1);
		_soldier addMagazine (_loadout select 1);
		_soldier addMagazine (_loadout select 1);
		_soldier addMagazine (_loadout select 1);
		_soldier addMagazine (_loadout select 1);
		_soldier addWeapon (_loadout select 0);

		removeAllPrimaryWeaponItems _soldier;
		if ((random 100) < 75) then { _soldier addPrimaryWeaponItem "acc_flashlight"; };
	};
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


