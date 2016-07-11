params [ "_unit" ];
private _inVehicle = false;
if ( vehicle _unit != _unit ) then {
	_inVehicle = true;
};

if ( damage _unit > 0.35 ) then {
	_unit setSkill ["aimingspeed", 0.2];
	_unit setSkill ["aimingaccuracy", 0.05];
	_unit setSkill ["aimingshake", 0.35];
	_unit setSkill ["spottime", 0.3];
	_unit setSkill ["spotdistance", 0.3];
	_unit setSkill ["commanding", 0.5];
	_unit setSkill ["general", 0.5];
} else {
	_unit setSkill ["aimingspeed", 0.35];
	if ( _inVehicle ) then {
		_unit setSkill ["aimingaccuracy", 0.65];
	} else {
		_unit setSkill ["aimingaccuracy", 0.35];
	};
	_unit setSkill ["aimingshake", 0.35];
	_unit setSkill ["spottime", 0.5];
	_unit setSkill ["spotdistance", 0.5];
	_unit setSkill ["commanding", 0.5];
	_unit setSkill ["general", 0.5];
};