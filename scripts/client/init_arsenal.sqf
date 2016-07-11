private [ "_virtualStuff", "_virtualBackpacks", "_blacklisted_from_arsenal" ];

// Blacklisted arsenal items such as deployable weapons
_blacklisted_from_arsenal = [
"B_Respawn_Sleeping_bag_blue_F",
"B_Respawn_Sleeping_bag_brown_F",
"B_Respawn_TentDome_F",
"B_Respawn_Sleeping_bag_F",
"B_Respawn_TentA_F",
"I_GMG_01_A_weapon_F",
"O_GMG_01_A_weapon_F",
"B_GMG_01_A_weapon_F",
"I_HMG_01_A_weapon_F",
"B_HMG_01_A_weapon_F",
"O_HMG_01_A_weapon_F",
"O_HMG_01_weapon_F",
"B_HMG_01_weapon_F",
"I_HMG_01_weapon_F",
"I_HMG_01_high_weapon_F",
"O_HMG_01_high_weapon_F",
"B_HMG_01_high_weapon_F",
"O_GMG_01_weapon_F",
"I_GMG_01_weapon_F",
"B_GMG_01_weapon_F",
"B_GMG_01_high_weapon_F",
"I_GMG_01_high_weapon_F",
"O_GMG_01_high_weapon_F",
"I_Mortar_01_support_F",
"B_Mortar_01_support_F",
"O_Mortar_01_support_F",
"B_Mortar_01_weapon_F",
"O_Mortar_01_weapon_F",
"I_Mortar_01_weapon_F",
"B_HMG_01_support_F",
"O_HMG_01_support_F",
"I_HMG_01_support_F",
"B_HMG_01_support_high_F",
"O_HMG_01_support_high_F",
"I_HMG_01_support_high_F",
"RHS_M2_Gun_Bag",
"RHS_M2_Tripod_Bag",
"RHS_M2_MiniTripod_Bag",
"RHS_Mk19_Gun_Bag",
"RHS_Mk19_Tripod_Bag",
"RHS_NSV_Gun_Bag",
"RHS_NSV_Tripod_Bag",
"B_AA_01_weapon_F",
"O_AA_01_weapon_F",
"I_AA_01_weapon_F",
"B_AT_01_weapon_F",
"O_AT_01_weapon_F",
"I_AT_01_weapon_F",
"I_UAV_01_backpack_F",
"B_UAV_01_backpack_F",
"O_UAV_01_backpack_F"
];

_virtualStuff = [] call LARs_fnc_addAllVirtualCargo;

_virtualBackpacks = [];
{ if ( !(_x in _blacklisted_from_arsenal) ) then { _virtualBackpacks pushback _x } } foreach (_virtualStuff);

[ missionNamespace, true ] call BIS_fnc_addVirtualWeaponCargo;
[ missionNamespace, true ] call BIS_fnc_addVirtualMagazineCargo;
[ missionNamespace, true ] call BIS_fnc_addVirtualItemCargo;
if ( param_deployables == 0 ) then {
	[ missionNamespace, _virtualBackpacks ] call BIS_fnc_addVirtualBackpackCargo;
} else {
	[ missionNamespace, true ] call BIS_fnc_addVirtualBackpackCargo;
};

