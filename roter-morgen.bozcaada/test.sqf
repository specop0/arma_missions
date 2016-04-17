_objects = nearestObjects [getPosATL player, ["CAManBase","Air","Land"], 300];
{
	if(_x != player) then {
		deleteVehicle _x;
	};
} forEach _objects;

// https://forums.bistudio.com/topic/180646-list-of-all-hidden-texture-inits/
private _units = [
	// AAF like with russian symbol (csat uniform)
	["O_Soldier_TL_F","\a3\characters_f\OPFOR\Data\clothing_rus_co.paa"],
	// gren-khaki mix (no pattern)
	["B_soldier_LAT_F","\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"],
	// woodland
	["B_Soldier_lite_F","\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"],
	// high green woodland diver
	["B_diver_F","A3\characters_f\common\data\diver_suit_co.paa"],
	// mixed brownish, greenish dark colored
	["I_Soldier_lite_F","\a3\characters_f_gamma\Civil\Data\c_cloth1_black.paa"],
	["I_G_Soldier_LAT_F","A3\Characters_F\Civil\Data\c_cloth1_kabeiroi_co.paa"],
	// red civilian shirt + aaf pants
	["I_G_Soldier_A_F","A3\Characters_F\Civil\Data\c_cloth1_bandit_co.paa"],
	// brownish
	["I_Soldier_lite_F","\a3\characters_f_gamma\Civil\Data\c_cloth1_brown.paa"],
	// brownish shirt with orange, yellow or red/blue pants (and shirt)
	["I_Soldier_lite_F","A3\Characters_F\Civil\Data\c_cloth1_v3_co.paa"],
	["I_Soldier_lite_F","A3\Characters_F\Civil\Data\c_cloth1_v2_co.paa"],
	["I_Soldier_lite_F","A3\Characters_F\Civil\Data\c_cloth1_co.paa"],
	// vr suit no lights
	["I_Protagonist_VR_F","\A3\Characters_F\Common\Data\basicbody_black_co.paa"],
	// worker coveralls
	["C_man_w_worker_F","\A3\characters_f\common\data\coveralls_bandit_co.paa"],
	["C_man_w_worker_F","\A3\characters_f\common\data\coveralls_black_co.paa"],
	["C_man_w_worker_F","\A3\characters_f\common\data\coveralls_grey_co.paa"],
	["C_man_w_worker_F","\A3\characters_f\common\data\coveralls_urbancamo_co.paa"]
];

_direction = 0;//getDir player + 180;
_position = getPosATL player;
{
	_unit = (_x select 0) createVehicle position player;
	_unit setPosATL [(_position select 0) + _forEachIndex, _position select 1,0];
	_unit setObjectTextureGlobal [0, (_x select 1)];
	removeHeadgear _unit;
	removeAllWeapons _unit;
	_unit setDir _direction;
	_unit enableSimulation false;
} forEach _units;

private _backpacks = [
	// kitbag aaf
	["B_Kitbag_cbr","A3\weapons_f\ammoboxes\bags\data\backpack_fast_digi_co.paa"],
	// black kitbag and carryall
	["B_Kitbag_cbr","A3\weapons_f\ammoboxes\bags\data\backpack_fast_blk_co.paa"],
	["B_Carryall_oucamo","A3\weapons_f\ammoboxes\bags\data\backpack_tortila_blk_co.paa"]
];

{
	_unit = "O_Soldier_TL_F" createVehicle position player;
	_unit setPosATL [(_position select 0) + _forEachIndex + count _units, _position select 1,0];
	_unit addBackpack (_x select 0);
	(backpackContainer _unit) setObjectTextureGlobal [0, (_x select 1)];
	removeHeadgear _unit;
	removeAllWeapons _unit;
	_unit setDir _direction;
	_unit enableSimulation false;
} forEach _backpacks;

// vehicles
private _vehicles = [
	// black little bird
	["B_Heli_Light_01_F", [
		[0, "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"]
	]],
	// desert/khaki fennek aaf -> nato
	["I_MRAP_03_hmg_F", [
		[0,'\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa'],
		[1,'\A3\data_f\vehicles\turret_co.paa']
	]],
	// strider (apc) aaf -> nato
	["I_APC_Wheeled_03_cannon_F", [
		[0, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa"],
		[1, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa"],
		[2, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\rcws30_co.paa"],
		[3, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"]
	]],
	// darker green/khaki blackfoot (nato gunship)
	["B_Heli_Attack_01_F", [
		[0, "A3\Air_F\Heli_Light_02\Data\heli_light_02_common_co.paa"]
	]],
	// aaf little bird
	["B_Heli_Light_01_F", [
		[0, "A3\Air_F\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"]
	]],
	// aaf orca (csat helicopter)
	["O_Heli_Light_02_F", [
		[0,"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"]
	]],
	// civilian orca
	["O_Heli_Light_02_F", [
		[0,"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"]
	]],
	// civilian mohawk (aaf helicopter) white/(dark) green and whit/black
	["I_Heli_Transport_02_F", [
		[0,"a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa"],
		[1,"a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa"],
		[2,"a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"]
	]],
	["I_Heli_Transport_02_F", [
		[0,"a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa"],
		[1,"a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa"],
		[2,"a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"]
	]],
	// civilian zamak (normal, fuel, repair) base orange
	// O_Truck_02_transport_F
	["O_Truck_02_covered_F", [
		[0, "a3\soft_f_beta\Truck_02\Data\truck_02_kab_co.paa"],
		[1, "a3\soft_f_beta\Truck_02\Data\truck_02_kuz_co.paa"]
	]],
	["O_Truck_02_fuel_F", [
		[0, "a3\soft_f_beta\Truck_02\Data\truck_02_kab_co.paa"],
		[1, "a3\soft_f_beta\Truck_02\Data\truck_02_fuel_co.paa"]
	]],
	["O_Truck_02_box_F", [
		[0, "a3\soft_f_beta\Truck_02\Data\truck_02_kab_co.paa"],
		[1, "a3\soft_f_beta\Truck_02\Data\truck_02_repair_co.paa"]
	]]
];

{
	_vehicle = (_x select 0) createVehicle position player;
	_vehicle setPosATL [(_position select 0) + _forEachIndex * 10,(_position select 1) + 10,0];
	{
		_vehicle setObjectTextureGlobal [(_x select 0),(_x select 1)];
	} forEach (_x select 1);
} forEach _vehicles;