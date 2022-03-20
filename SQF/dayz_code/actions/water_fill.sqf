#include "\z\addons\dayz_code\util\player.hpp"

private ["_canFill","_water","_filled","_posASL","_posATL","_chance","_container","_drinking","_message","_recover","_wells"];

if (typeName _this == "ARRAY") then {
	_container = if (count _this == 1) then {_this select 0} else {_this select 3};
	_drinking = true;
} else {
	_container = _this;
	_drinking = false;
};

call gear_ui_init;
closeDialog 0;

if Player_IsOnLadder() exitWith { (localize "str_player_21") call dayz_rollingMessages; };

_posASL = getPosASL player;
_posATL = ASLtoATL _posASL;

_canFill = call {
	//Return: [nearWaterHole, isPond]
	if (count nearestObjects [_posATL,DZE_WaterSources,4] > 0) exitwith {[true,false]};
	if (toLower worldName in ["chernarus","namalsk","napf"]) exitwith {(call fn_nearWaterHole)};
	//Slow searches for maps without waterHoleProxy objects added yet
	if ({["_well",str _x] call fnc_inString} count nearestObjects [_posATL,[],4] > 0) exitwith {[true,false]};
	if ({["pond",str _x] call fnc_inString && {_posASL select 2 < ((getPosASL _x) select 2)}} count nearestObjects [player,[],50] > 0) exitwith {[true,true]};
	[false,false];
};

if !(_canFill select 0) exitWith {
	_message = if (_drinking) then {"str_player_32"} else {"str_player_20"};
	localize _message call dayz_rollingMessages;
};

//Check if guaranteed infected (only for ponds)
_water = if (dayz_infectiousWaterholes && {_canFill select 1} && {count nearestObjects [_posATL,["Body","Body1","Body2","Mass_grave"],50] > 0}) then {"infected"} else {"safe"};
_water = "containerwater" + _water;
_filled = 0;

if (_container == "hands") then {
	_chance = 0.03;
	_recover = 150;
} else {
	_chance = 0.06;
	_recover = 300;
};

//Additional chance to be infected (only for ponds)
if (_canFill select 1 && {[_chance] call fn_chance}) then {
	_water = "containerwaterinfected";
};

if (!dayz_isSwimming) then {
	player playActionNow "PutDown";
};

if (_drinking) then {
	["FoodDrink",0,[0,0,_recover,0]] call dayz_NutritionSystem; //[Energy,food,water,temp]
	[player,_posATL,10,"drink"] spawn fnc_alertZombies;

	if (_water == "containerwaterinfected") then {
		r_player_infected = true;
	};

	localize "str_drinkwithhands" call dayz_rollingMessages;
} else {
	{
		if (isText (configFile >> "CfgMagazines" >> _x >> _water)) then
		{
			_filled = _filled + 1;

			player removeMagazine _x;
			player addMagazine getText (configFile >> "CfgMagazines" >> _x >> _water);
		};
	}
	foreach magazines player;

	if (_filled > 0) then {
		[player,(getPosATL player),5,"fillwater"] spawn fnc_alertZombies;
		format [localize "str_player_01", _filled] call dayz_rollingMessages;
	} else {
		localize "str_player_02" call dayz_rollingMessages;
	};
};
