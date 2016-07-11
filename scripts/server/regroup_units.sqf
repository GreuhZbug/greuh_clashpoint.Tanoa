while { true } do {

	private _low_ai_groups = [ allGroups, { (count units _x > 0) && (count units _x < 4) && !(isPlayer (leader _x)) } ] call BIS_fnc_conditionalSelect;
	{
		private _nextgroup = _x;
		private _other_low_ai_groups = [ _low_ai_groups, { (side _x == side _nextgroup) && (_x != _nextgroup) } ] call BIS_fnc_conditionalSelect;
		if ( count _other_low_ai_groups > 0 ) exitWith {
			(units _nextgroup) join (_other_low_ai_groups select 0);
		};
		sleep 1;
	} foreach _low_ai_groups;

	sleep 10;
};