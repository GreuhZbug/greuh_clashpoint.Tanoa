private [ "_arsenal_classname", "_near_arsenal", "_idact_arsenal", "_dist_arsenal" ];

_arsenal_classname = "Land_Pallet_MilBoxes_F";
_dist_arsenal = 10;
_idact_arsenal = -1;

while { true } do {

	_near_arsenal = [ ( (getpos player) nearobjects [ _arsenal_classname, _dist_arsenal ]), { getObjectType _x >= 8 } ] call BIS_fnc_conditionalSelect;

	if ( ( count _near_arsenal != 0 ) && alive player && vehicle player == player ) then {
		if (_idact_arsenal == -1) then {
			_idact_arsenal = player addAction ["<t color='#FFFF00'>" + "-- ARSENAL --" + "</t> <img size='2' image='res\ui_arsenal.paa'/>","scripts\client\open_arsenal.sqf","",-980,true,true,"",""];
		};
	} else {
		if ( _idact_arsenal != -1 ) then {
			player removeAction _idact_arsenal;
			_idact_arsenal = -1;
		};
	};
	sleep 1;
};