_old_flashpoint_side = "res";

side_color = [0,1,0,1];
_overlayshown = false;
_color = "";
_base = objNull;
if (isNil "player_spawn_protected") then { player_spawn_protected = false };
_protection_color = [1,1,0,1];
_firstloop = true;
_firstswitch = false;
_timer5mb = true;
_timer3mb = true;
_timer2mb = true;
_timer1mb = true;
_timer20sb = true;
_timer5mo = true;
_timer3mo = true;
_timer2mo = true;
_timer1mo = true;
_timer20so = true;


seconds_to_timer = compile preprocessFileLineNumbers "scripts\client\seconds_to_timer.sqf";

_task_point = player createSimpleTask ["Clashpoint"];
_task_point setSimpleTaskTarget [flashpoint, true];
_task_point setSimpleTaskDescription [localize "STR_OBJECTIVE", "Clashpoint", "Clashpoint"];
_task_point setTaskState "Assigned";
player setCurrentTask _task_point;

waitUntil { !isNil "current_roundstate" && !isNil "blufor_score" && !isNil "opfor_score" && !isNil "blufor_timer" && !isNil "opfor_timer"};

if ( side player == WEST ) then {
	_color = "ColorBLUFOR";
	_base = blufor_base;
} else {
	_color = "ColorOPFOR";
	_base = opfor_base;
};

while { true } do {

	if ( current_roundstate != 1 ) then {
		_firstloop = true;
		_timer5mb = true;
		_timer3mb = true;
		_timer2mb = true;
		_timer1mb = true;
		_timer20sb = true;
		_timer5mo = true;
		_timer3mo = true;
		_timer2mo = true;
		_timer1mo = true;
		_timer20so = true;
		if ( blufor_score > 0 || opfor_score > 0 ) then {
			_firstswitch = true;
		};
	};

	if ( current_roundstate == 1 ) then {

		"flashpoint_marker" setMarkerPosLocal getpos flashpoint;
		"base_marker" setMarkerPosLocal getpos _base;
		"base_marker" setMarkerColorLocal _color;
		if (_firstloop) then {
			sleep 10;
			_firstloop = false;
		};
		if (player_spawn_protected) then {
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl 321) ctrlSetText localize "STR_SPAWN_PROTECT";
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl 321) ctrlSetTextColor _protection_color;
		} else {
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl 321) ctrlSetText "";
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl 321) ctrlSetTextColor _protection_color;
		};
		if ( _old_flashpoint_side != flashpoint_side ) then {
			_old_flashpoint_side = flashpoint_side;
			switch (flashpoint_side) do {
				case "blufor" :
				{
					side_color = [0,0,1,1];
					"flashpoint_marker" setMarkerColorLocal "ColorBLUFOR";
					_tasktype = "TaskSucceeded";
					if (playerside == EAST) then { _tasktype = "TaskFailed" };
					[_tasktype,["",localize "STR_BLUFOR_capture"]] call BIS_fnc_showNotification;
				};
				case "opfor" :
				{
					side_color = [1,0,0,1];
					"flashpoint_marker" setMarkerColorLocal "ColorOPFOR";
					_tasktype = "TaskSucceeded";
					if (playerside == WEST) then { _tasktype = "TaskFailed" };
					[_tasktype,["",localize "STR_OPFOR_capture"]] call BIS_fnc_showNotification;
				};
				case "res" :
				{
					side_color =  [0,1,0,1];
					"flashpoint_marker" setMarkerColorLocal "ColorIndependent";
					if ( _firstswitch  ) then {
						_firstswitch  = false;
					} else {
						_tasktype = "TaskFailed";
						[_tasktype,["",localize "STR_RES_capture"]] call BIS_fnc_showNotification;
					};
				};
			};
		};

		if ( blufor_timer <= 300 && _timer5mb ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","5",localize "STR_BLUFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer5mb = false;
		};
		if ( blufor_timer <= 180 && _timer3mb ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","3",localize "STR_BLUFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer3mb = false;
		};
		if ( blufor_timer <= 120 && _timer2mb ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","2",localize "STR_BLUFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer2mb = false;
		};
		if ( blufor_timer <= 60 && _timer1mb ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","1",localize "STR_BLUFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer1mb = false;
		};
		if ( blufor_timer <= 20 && _timer20sb ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","20",localize "STR_BLUFOR_TIMERSECS"]]] call BIS_fnc_showNotification;
			_timer20sb = false;
		};
		if ( opfor_timer <= 300 && _timer5mo ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","5",localize "STR_OPFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer5mo = false;
		};
		if ( opfor_timer <= 180 && _timer3mo ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","3",localize "STR_OPFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer3mo = false;
		};
		if ( opfor_timer <= 120 && _timer2mo ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","2",localize "STR_OPFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer2mo = false;
		};
		if ( opfor_timer <= 60 && _timer1mo ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","1",localize "STR_OPFOR_TIMER"]]] call BIS_fnc_showNotification;
			_timer1mo = false;
		};
		if ( opfor_timer <= 20 && _timer20so ) then {
			["TaskUpdatedIcon",["",format ["%1 %2","20",localize "STR_OPFOR_TIMERSECS"]]] call BIS_fnc_showNotification;
			_timer20so = false;
		};

		if ( isNull ((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (101)) && _overlayshown ) then { _overlayshown = false };
		if ( alive player && !dialog && ! _overlayshown) then {
			cutRsc["statusoverlay", "PLAIN", 1];
			_overlayshown = true;
		};
		if ( ( !alive player || dialog ) && _overlayshown) then {
			cutRsc["blank", "PLAIN", 0];
			_overlayshown = false;
		};
		if ( _overlayshown ) then {
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (101)) ctrlSetText format ["%1",[blufor_timer] call seconds_to_timer];
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (102)) ctrlSetText format ["%1",[opfor_timer] call seconds_to_timer];
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (151)) ctrlSetText format ["%1",blufor_score];
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (152)) ctrlSetText format ["%1",opfor_score];
			_showblufor = ( flashpoint_side == "blufor" );
			_showopfor = ( flashpoint_side == "opfor" );
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (103)) ctrlShow _showblufor;
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (105)) ctrlShow _showblufor;
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (104)) ctrlShow _showopfor;
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (106)) ctrlShow _showopfor;

			_controls = [201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,200];
			_idx = 0;
			while { _idx < 20 } do {
				_current_killspam = killspam select _idx;
				_text = _current_killspam select 0;
				_textalpha = _current_killspam select 0;
				_namekiller = _current_killspam select 1;
				_nameweapon = _current_killspam select 2;
				_nametarget = _current_killspam select 3;
				_sidekiller = _current_killspam select 4;
				_textcolorkiller = "";
				_colorweapon = "#d0d0d0";
				switch ( _sidekiller ) do {
					case WEST : { _textcolorkiller = "#0060ff"; };
					case EAST : { _textcolorkiller = "#d00000"; };
					case RESISTANCE : { _textcolorkiller = "#00d000"; };
					default { _textcolorkiller = "#b0b0b0"; };
				};
				_sidetarget = _current_killspam select 5;
				_textcolortarget = "";
				switch ( _sidetarget ) do {
					case WEST : { _textcolortarget = "#0040ff"; };
					case EAST : { _textcolortarget = "#c00000"; };
					case RESISTANCE : { _textcolortarget = "#00c000"; };
					default { _textcolortarget = "#b0b0b0"; };
				};

				_textline = parseText "";
				if((_current_killspam select 0) > 0) then {
					_textline = parseText format["<t align='right'><t color='%1'>%2</t> <t color='%3'>[%4]</t> <t color='%5'>%6</t></t>",_textcolorkiller,_namekiller,_colorweapon,_nameweapon,_textcolortarget,_nametarget];
				};
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_controls select _idx)) ctrlSetStructuredText  _textline;
				if ( (_current_killspam select 0) > 0 ) then { _current_killspam = [(_current_killspam select 0) - 0.05,_current_killspam select 1,_current_killspam select 2,_current_killspam select 3,_current_killspam select 4,_current_killspam select 5]; };
				if ( (_current_killspam select 0) <= 0 ) then { _current_killspam = [0,"","","",CIVILIAN,CIVILIAN] };
				killspam set [_idx, _current_killspam];
				_idx = _idx + 1;
			};
		};
		_old_flashpoint_side = flashpoint_side;
	};
	sleep 0.5;
};