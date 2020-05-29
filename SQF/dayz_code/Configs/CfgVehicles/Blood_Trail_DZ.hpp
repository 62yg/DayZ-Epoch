class Blood_Trail : House {
	scope = 0;
	displayName = "";
	accuracy = 0.1;	// accuracy needed to recognize type of this target
	vehicleClass = "DayZ Epoch Buildings";
	model = "";
	nameSound = "";
	animated = false;
	simulation = "house";
	cost = 0;
	armor = 300;
	ladders[] = {};
	placement = "slope";
};
class Blood_Trail_DZ : Blood_Trail {
	scope = 2;
	animated = 0;
	destrType = "DestructNo";
	mapSize = 2;
	accuracy = 0.2;
	icon = "\ca\data\data\Unknown_object.paa";
	armor = 50;
	displayName = "Blood Trail";
	vehicleClass = "DayZ Epoch Buildings";
	model = "\z\addons\dayz_communityassets\models\blood.p3d";
};
