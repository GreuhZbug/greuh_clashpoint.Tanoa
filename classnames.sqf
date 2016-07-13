// Standard BLUFOR AI squad
blufor_squad = ["B_T_Soldier_SL_F","B_T_Soldier_TL_F","B_T_soldier_M_F","B_T_Soldier_AR_F","B_T_Soldier_LAT_F","B_T_Soldier_GL_F","B_T_Medic_F","B_T_Soldier_A_F"];

// Standard OPFOR AI squad
opfor_squad = ["O_T_Soldier_SL_F","O_T_Soldier_TL_F","O_T_soldier_M_F","O_T_Soldier_AR_F","O_T_Soldier_LAT_F","O_T_Soldier_GL_F","O_T_Medic_F","O_T_Soldier_A_F"];

// Independant militia on point
militia = ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_7_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_6_F", "I_C_Soldier_Para_8_F", "I_C_Soldier_Para_1_F","I_C_Soldier_Para_5_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_8_F","I_C_Soldier_Bandit_4_F","I_C_Soldier_Camo_F"];

// Civilians
civilians = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan","C_journalist_F","C_man_w_worker_F","C_man_hunter_1_F","C_man_polo_4_F_euro","C_Man_casual_5_F_asia","C_man_polo_4_F_asia","C_man_shorts_2_F_asia","C_man_p_fugitive_F_asia"];

// True to generate militias out of the vanilla AAF soldiers, false if you're using mods (leighs opfor pack, etc)
homemade_militias = false;

// BLUFOR plane for CAS missions. Note: it uses the Zeus CAS module and RHS planes seem to have issues. Edit with care.
blufor_plane = "B_Plane_CAS_01_F";

// OPFOR plane for CAS missions. Note: it uses the Zeus CAS module and RHS planes seem to have issues. Edit with care.
opfor_plane = "O_Plane_CAS_02_F";

// BLUFOR vehicles
blufor_vehicles = ["B_T_LSV_01_armed_F","B_T_LSV_01_armed_F","B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F","B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_rcws_F","B_T_MBT_01_TUSK_F"];

// OPFOR vehicles
opfor_vehicles = ["O_T_LSV_02_armed_F","O_T_LSV_02_armed_F","O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F","O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_ghex_F","O_T_MBT_02_cannon_ghex_F"];

// Weather offset, 0 for the most chance of rain, 200 for very sunny places
weather_offset = 125;

// Get a debug message to know how many zones have been correctly loaded. Useful when you're editing or porting the mission to another map.
debugzones = false;