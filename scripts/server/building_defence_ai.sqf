_unit = _this select 0;
_unit disableAI "MOVE";
_move_is_disabled = true;

while { alive _unit && !(captive _unit) } do {
	_unit = _this select 0;
	_nearunits = nearestObjects [_unit, ["Man"], 30];
	_nearunitsfiltered = [];
	{
		if ( ( side _x == WEST ) || ( side _x == EAST )  ) then {
			_nearunitsfiltered = _nearunitsfiltered + [_x];
		};
	} foreach _nearunits;

	if ( count _nearunitsfiltered > 0 || ( damage _unit > 0.1 ) ) then {
		if ( _move_is_disabled ) then {
			_move_is_disabled = false;
			_unit enableAI "MOVE";
		};
		_unit doWatch (getpos (_nearunitsfiltered select 0));
	};

	if ( _move_is_disabled ) then {
		_targett = assignedTarget _unit;
		if(!(isnull _targett)) then {
			_vd2 = (getPosASL _targett) vectorDiff (getpos _unit);
			_newdir2 = (_vd2 select 0) atan2 (_vd2 select 1);
			if (_newdir2 < 0) then {_dir = 360 + _newdir2 };
			_unit setdir (_newdir2);
		};
	};

	sleep 1;

};