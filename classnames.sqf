// Standard BLUFOR AI squad
blufor_squad = ["B_Soldier_SL_F","B_Soldier_TL_F","B_soldier_M_F","B_Soldier_AR_F","B_Soldier_LAT_F","B_Soldier_GL_F","B_Medic_F","B_Soldier_A_F"];

// Standard OPFOR AI squad
opfor_squad = ["O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_M_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_GL_F","O_Medic_F","O_Soldier_A_F"];

// Independant militia on point
militia = ["I_Soldier_SL_F", "I_Soldier_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_lite_F", "I_medic_F", "I_Soldier_AR_F"];

// Civilians
civilians = ["C_man_p_beggar_F","C_man_1","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_journalist_F","C_man_w_worker_F","C_man_hunter_1_F"];

// True to generate militias out of the vanilla AAF soldiers, false if you're using mods (leighs opfor pack, etc)
homemade_militias = true;

// BLUFOR plane for CAS missions. Note: it uses the Zeus CAS module and RHS planes seem to have issues. Edit with care.
blufor_plane = "B_Plane_CAS_01_F";

// OPFOR plane for CAS missions. Note: it uses the Zeus CAS module and RHS planes seem to have issues. Edit with care.
opfor_plane = "O_Plane_CAS_02_F";

// BLUFOR vehicles
blufor_vehicles = ["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_MBT_01_TUSK_F"];

// OPFOR vehicles
opfor_vehicles = ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F"];

// Weather offset, 0 for the most chance of rain, 200 for very sunny places
weather_offset = 75;

// Get a debug message to know how many zones have been correctly loaded. Useful when you're editing or porting the mission to another map.
debugzones = false;