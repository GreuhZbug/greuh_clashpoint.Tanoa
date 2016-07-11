waitUntil { alive player };

_campos = [getmarkerpos "camstart" select 0, getmarkerpos "camstart" select 1, 2];
_camdest = [getmarkerpos "camstart" select 0, getmarkerpos "camstart" select 1, 35];

_cam = "camera" camCreate _campos;
_cam camSetTarget ciblecam;
_cam cameraEffect ["internal","back"];
_cam camcommit 0;

_cam camSetPos _camdest;
_cam camCommit 13;

sleep 1;

cutRsc ["intro","PLAIN",1,true];

sleep 1;

waitUntil { camCommitted _cam };

_cam cameraEffect ["Terminate","back"];
camDestroy _cam;