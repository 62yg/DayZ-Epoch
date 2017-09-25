private ["_activatingPlayer","_isOK","_worldspace","_location","_dir","_class","_uid","_key","_keySelected","_characterID","_donotusekey","_object","_result","_outcome","_oid","_object_para"];
//PVDZE_veh_Publish2 = [[_dir,_location],_part_out,false,_keySelected,_activatingPlayer];
#include "\z\addons\dayz_server\compile\server_toggle_debug.hpp"

_worldspace = 	_this select 0;
_class = 		_this select 1;
_donotusekey =	_this select 2;
_keySelected =  _this select 3;
_activatingPlayer =  _this select 4;

if(_donotusekey) then {
	_isOK = true;
} else {
	_isOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
};

if(!_isOK) exitWith {diag_log ("HIVE: CARKEY DOES NOT EXIST: "+ str(_keySelected));};

if(_donotusekey) then {
	_characterID = _keySelected;
} else {
	_characterID = str(getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid"));
};

_dir = 		_worldspace select 0;
_location = _worldspace select 1;
_uid = _worldspace call dayz_objectUID2;

_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];

#ifdef OBJECT_DEBUG
diag_log ("HIVE: WRITE: "+ str(_key)); 
#endif

_key call server_hiveWrite;

_key = format["CHILD:388:%1:",_uid];

#ifdef OBJECT_DEBUG
diag_log ("HIVE: WRITE: "+ str(_key));
#endif

_result = _key call server_hiveReadWrite;
_outcome = _result select 0;

if (_outcome != "PASS") then {
	diag_log("CUSTOM: failed to get id for : " + str(_uid));
} else {
	_oid = _result select 1;

	#ifdef OBJECT_DEBUG
	diag_log("CUSTOM: Selected " + str(_oid));
	#endif

	if(DZE_TRADER_SPAWNMODE) then {
		_object_para = "ParachuteMediumWest" createVehicle [0,0,0];
		_object_para setPos [_location select 0, _location select 1,(_location select 2) + 65];
		_object = _class createVehicle [0,0,0];
	} else {
		// Don't use setPos or CAN_COLLIDE here. It will spawn inside other vehicles
		_object = _class createVehicle _location;
		if (surfaceIsWater _location && {({_x != _object} count (_location nearEntities ["Ship",8])) == 0}) then {
			//createVehicle "NONE" is especially inaccurate in water
			_object setPos _location;
		};
	};

	if(!_donotusekey) then {
		_object setvehiclelock "locked";
	};

	clearWeaponCargoGlobal  _object;
	clearMagazineCargoGlobal  _object;
	dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];
	_object setVariable ["ObjectID", _oid, true];
	_object setVariable ["lastUpdate",diag_tickTime];
	_object setVariable ["CharacterID", _characterID, true];

	if(DZE_TRADER_SPAWNMODE) then {
		_object attachTo [_object_para, [0,0,-1.6]];
		uiSleep 1;
		WaitUntil{(([_object] call FNC_GetPos) select 2) < 0.1};
		detach _object;
		deleteVehicle _object_para;
	};

	_object call fnc_veh_ResetEH;

	PVDZE_veh_Init = _object;
	publicVariable "PVDZE_veh_Init";

	diag_log format["PUBLISH: %1(%2) bought %3 with ObjectUID %4",if (alive _activatingPlayer) then {name _activatingPlayer} else {"DeadPlayer"},getPlayerUID _activatingPlayer,_class,_uid];
};
