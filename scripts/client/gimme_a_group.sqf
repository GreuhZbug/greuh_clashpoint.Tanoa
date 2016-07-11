sleep 15;

while { true } do {

	if ( count (units group player ) == 1 ) then {
		_bestgrp = grpNull;
		_bestgrpnumber = -1;
		{
			if ( side _x == playerSide ) then {
				_hasvehicle = false;
				{
					if ( vehicle _x != _x ) then { _hasvehicle = true };
				} foreach units _x;

				if (!_hasvehicle) then {
					if ( count units _x >_bestgrpnumber ) then {
						_bestgrpnumber = count units _x;
						_bestgrp = _x;
					};
				};
			};
		} foreach allGroups;
		if ( _bestgrp != group player ) then {
			[player] join _bestgrp;
		};
	};

	sleep 1;
};