/*
        Created exclusively for ArmA2:OA - DayZMod.
        Please request permission to use/alter/distribute from project leader (R4Z0R49) AND the author (facoptere@gmail.com)
*/

/***********************************************************
ASSIGN DAMAGE TO A UNIT.
Called by "HandleDamage" vehicle Event Handler
or by "PVCDZ_veh_SH" PV
or by zombie_attack

- Function fnc_veh_handleDam
- [unit, selectionName, damage, source, projectile, broadcast] call fnc_veh_handleDam;
- return : updated damage for that part
broadcast: boolean. if true, then the request will be sent to all players if the vehicle is not local.
************************************************************/
local _unit = _this select 0;
local _selection = _this select 1;
local _total = _this select 2;

if (DZE_GodModeVehiclesPlot && {locked _unit && {count (crew _unit) == 0} && {count (_unit nearEntities ["Plastic_Pole_EP1_DZ", DZE_PlotPole select 0]) > 0}}) exitWith {0};

local _totalDmg = if (_selection != "") then {false} else {true};
local _force = [false,true] select (count _this > 6); // Needed to force update salvage

if (_total >= 0.98) then {
    _total = 1.0;
};

if (local _unit) then {
	if (_total > 0) then {
		_unit setHit [_selection, _total];

		PVDZ_veh_Save = [_unit,"damage",_force,_totalDmg];
		if (!isServer) then {
			publicVariableServer "PVDZ_veh_Save";
		} else {
			PVDZ_veh_Save call server_updateObject;
		};
	};
} else {
	//if ( (count _this > 5) AND {(_this select 5)}) then {
		// vehicle is not local to this client, ask the client which vehicle is local to set damage
		//_this resize 5; // delete "broadcast" boolean
		PVDZ_send = [_unit,"VehHandleDam",_this];
		publicVariableServer "PVDZ_send";
	//};
};

// all "HandleDamage event" functions should return the effective damage that the engine will record for that part
_total
