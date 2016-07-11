waitUntil { alive player };
waitUntil { !isNil "current_roundstate" };

while { true } do {
	waitUntil { current_roundstate == 2 };
	waitUntil { !isNil "winner" };
	waitUntil { winner == "blufor" || winner == "opfor" };
	
	if ((( playerside == WEST ) && (winner == "blufor")) || (( playerside == EAST ) && (winner == "opfor"))) then {
		playMusic "EventTrack01_F_Curator";
	} else {
		playMusic "EventTrack02_F_Curator";
	};
	
	sleep 1;

	if ( winner == "blufor") then { cutRsc ["blufor_victory","PLAIN",1,true]; };
	if ( winner == "opfor") then { cutRsc ["opfor_victory","PLAIN",1,true]; };

	_campos = [(getpos flashpoint select 0) + ((random 20) - 10),(getpos flashpoint select 1) + 3, 2];
	_camdest = [getpos flashpoint select 0,(getpos flashpoint select 1) + 60, 15];

	_cam = "camera" camCreate _campos;
	_cam camSetTarget flashpoint;
	_cam cameraEffect ["internal","back"];
	
	disableUserInput true;
	disableUserInput false;
	
	if ( (date select 3) < 5 || (date select 3) > 19 ) then { camUseNVG true; } else { camUseNVG false; };
	showCinemaBorder true;
	_cam camcommit 0;
	
	_cam camSetPos _camdest;
	_cam camCommit 20;

	waitUntil { current_roundstate != 2 };
	
	cutRsc ["fasttravel","PLAIN",1,true];
	
	sleep 2;

	_cam cameraEffect ["Terminate","back"];
	camUseNVG false;
	camDestroy _cam;
};