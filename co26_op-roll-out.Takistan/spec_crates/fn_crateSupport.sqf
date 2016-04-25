private _parameterCorrect = params [["_x",objNull,[objNull]]];

private _mineDetector = "MineDetector";
private _binocular = "Binocular";
private _gps = "ACE_microDAGR";
private _rangefinder = "ACE_Yardage450";
private _toolkit = "ToolKit";

private _backpack = "B_FieldPack_ocamo";

private _weaponFlashlight = "acc_flashlight";
private _weaponLaser = "acc_pointer_IR";
private _weaponSilencerH = "muzzle_snds_H";
private _weaponSilencerL = "muzzle_snds_L";
private _weaponScope = "optic_Arco";

if(_parameterCorrect && isServer) then {
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearItemCargoGlobal _x;
    _x addItemCargoGlobal [_mineDetector,3];
    _x addItemCargoGlobal [_binocular,12];
    _x addItemCargoGlobal [_gps,5];
    _x addItemCargoGlobal [_rangefinder,5];
    _x addItemCargoGlobal [_toolkit,3];
    
    _x addBackpackCargoGlobal [_backpack,4];
    
    _x addItemCargoGlobal [_weaponFlashlight,12];
    _x addItemCargoGlobal [_weaponLaser,12];
    _x addItemCargoGlobal [_weaponSilencerH,12];
    _x addItemCargoGlobal [_weaponSilencerL,12];
    _x addItemCargoGlobal [_weaponSilencerL,12];
};
