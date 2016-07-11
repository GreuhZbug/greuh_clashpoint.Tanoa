_killer = _this select 1;
_target = _this select 0;

if ( !isNull _killer && !isNull _target ) then {

	_weapon = currentWeapon _killer;

	_defaultdelay = 5;

	_weaponname = "";
	
	_namekiller = name _killer;
	_sidekiller = side (group _killer);
	_sidetarget = side (group _target);
	
	_targettext = name _target;
	if ( _killer == _target ) then { 
		_weaponname = "Suicide";  
		_targettext = "";
		_sidetarget = CIVILIAN;
	} else {
		_weaponname = getText (configFile >> "CfgWeapons" >> _weapon >> "displayName");
	};

	_newline = [_defaultdelay,_namekiller, _weaponname, _targettext, _sidekiller,_sidetarget];

	_idx = 19;
	while { _idx > 0 } do {
		killspam set [_idx, killspam select (_idx - 1)];
		_idx = _idx - 1;
	};

	killspam set [0,_newline];

	killspam resize 20;

};