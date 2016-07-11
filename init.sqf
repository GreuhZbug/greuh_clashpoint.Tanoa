
enableSaving [ false, false ];

call compileFinal preprocessFileLineNumbers "scripts\fetch_params.sqf";
call compileFinal preprocessFileLineNumbers "scripts\functions\init_functions.sqf";
call compileFinal preprocessFileLineNumbers "classnames.sqf";

kill_manager = compileFinal preprocessFileLineNumbers "scripts\kill_manager.sqf";
[] execVM "GREUH\scripts\GREUH_activate.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\spawn_protection.sqf";
[] spawn compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";

// Fonctions serveur
if (isServer) then{
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\server_init.sqf";
};

// Fonctions client
if (!isDedicated) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\client_init.sqf";
};
