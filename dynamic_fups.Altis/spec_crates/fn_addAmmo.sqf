private _parameterCorrect = params [["_crate",objNull,[objNull]], ["_player",objNull,[objNull]] ];

if(_parameterCorrect) then {
    private _weaponMagazines = getArray (configFile >> "CfgWeapons" >> primaryWeapon _player >> "Magazines");
    if(count _weaponMagazines > 0) then {
        _crate addMagazineCargoGlobal [_weaponMagazines select 0, 6];
    };
    /*
    Problem: Used AT Launcher
    {
        // if weapon selected (not empty string or binocular)
        if !(_x isEqualTo "" || _x isKindOf ["Binocular", configFile >> "CfgWeapons"]) then {
            private _weapon = _x;
            private _weaponMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "Magazines");
            if(_weapon isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {
                // for a launcher add weapon and magazines
                _crate addWeaponCargoGlobal [_weapon, 2];
                {
                    _crate addMagazineCargoGlobal [_x, 2];
                } forEach _weaponMagazines;
            } else {
                // for a weapon add first magazine
                _crate addMagazineCargoGlobal [_weaponMagazines select 0, 6];
            };
        };
    } forEach weapons _player;
    */
};
true
