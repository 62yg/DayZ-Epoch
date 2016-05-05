private["_selection","_returnArray","_allowedMags","_allowedWeapons","_allowedBackpacks","_allowedTools","_allowedPrimary","_allowedSidearm","_formattedText","_pic"
,"_backpack","_vehicleWeapons","_vehicleMagazines","_vehicleBackpacks","_tempWeaponsArray","_tempBackpackArray","_tempMagazinesArray","_actualMags"];
#include "defines.sqf";

_selection = _this select 0;
_returnArray = [0,0,0];
if(_selection == 2) then{ //gear
	_actualMags = {!(_x in MeleeMagazines)} count (magazines player);
	_allowedMags = 20 - _actualMags;
	// 12 toolbelt + 1 Binoculars + 1 NVG + 1 Pistol + 1 Primary (onBack isn't counted in weapons player)
	_allowedWeapons = 16 - count(weapons player);

	_pic = getText (configFile >> 'CfgVehicles' >> (typeOf player) >> 'picture');

	_formattedText = format [
		"<img image='%1'  size='3' align='center'/>"
		, _pic
	];

	(findDisplay Z_AT_DIALOGWINDOW displayCtrl Z_AT_CONTAINERINFO) ctrlSetStructuredText parseText _formattedText;

	_backpack = unitBackpack player;
	_allowedBackpacks = if (isNull _backpack) then {1} else {0};

	_returnArray = [_allowedMags, _allowedWeapons, _allowedBackpacks];
};
if(_selection == 1) then{ //vehicle
	_allowedMags = 0;
	_allowedWeapons = 0;
	_allowedBackpacks = 0;
	_vehicleMagazines = 0;
	_vehicleWeapons = 0;
	_vehicleBackpacks = 0;
	if (!isNull Z_vehicle) then {

		_pic = getText (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'picture');

		_formattedText = format [
			"<img image='%1'  size='3' align='center'/>"
			, _pic
		];

		(findDisplay Z_AT_DIALOGWINDOW displayCtrl Z_AT_CONTAINERINFO) ctrlSetStructuredText parseText _formattedText;

		_tempMagazinesArray = getMagazineCargo Z_vehicle;

		{
			_vehicleMagazines = _vehicleMagazines + _x;
		}count ( _tempMagazinesArray select 1);


		_tempWeaponsArray = getWeaponCargo Z_vehicle;

		{
			_vehicleWeapons = _vehicleWeapons + _x;
		}count ( _tempWeaponsArray select 1);


		_tempBackpackArray = getBackpackCargo Z_vehicle;

		{
			_vehicleBackpacks = _vehicleBackpacks + _x;
		}count ( _tempBackpackArray select 1);

		_allowedWeapons = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportMaxWeapons');
		_allowedMags = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportMaxMagazines');
		_allowedBackpacks = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportmaxbackpacks');
	};
	_returnArray = [_allowedMags - _vehicleMagazines, _allowedWeapons - _vehicleWeapons, _allowedBackpacks - _vehicleBackpacks];
};
if(_selection == 0) then{ //backpack
	_allowedWeapons = 0;
	_allowedMags = 0;
	_allowedBackpacks = 0;
	_vehicleMagazines = 0;
	_vehicleWeapons = 0;
	_backpack = unitBackpack player;
	if (!isNil "_backpack") then {
		_pic = getText (configFile >> 'CfgVehicles' >> (typeOf _backpack) >> 'picture');

		_formattedText = format [
			"<img image='%1'  size='3' align='center'/>"
			, _pic
		];

		(findDisplay Z_AT_DIALOGWINDOW displayCtrl Z_AT_CONTAINERINFO) ctrlSetStructuredText parseText _formattedText;
		_tempMagazinesArray = getMagazineCargo Z_vehicle;

		{
			_vehicleMagazines = _vehicleMagazines + _x;
		}count ( _tempMagazinesArray select 1);


		_tempWeaponsArray = getWeaponCargo Z_vehicle;

		{
			_vehicleWeapons = _vehicleWeapons + _x;
		}count ( _tempWeaponsArray select 1);

		_allowedWeapons = getNumber (configFile >> 'CfgVehicles' >> (typeOf _backpack) >> 'transportMaxWeapons');
		_allowedMags = getNumber (configFile >> 'CfgVehicles' >> (typeOf _backpack) >> 'transportMaxMagazines');
		_allowedBackpacks = 0;
	};
	_returnArray = [_allowedMags - _vehicleMagazines ,_allowedWeapons - _vehicleWeapons, _allowedBackpacks];
};
(findDisplay Z_AT_DIALOGWINDOW displayCtrl Z_AT_SLOTSDISPLAY) ctrlSetText format["%1/%2/%3",_returnArray select 1,_returnArray select 0,_returnArray select 2];
