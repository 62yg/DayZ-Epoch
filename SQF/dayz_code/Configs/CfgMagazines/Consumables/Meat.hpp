class FoodGoatRaw : FoodRaw
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_GOAT_RAW;
	descriptionShort = $STR_EQUIP_FOOD_DESC_GOAT_RAW;	
	bloodRegen = 300;
	Nutrition[] = {143,300,0,0};	
	cookOutput = "FoodGoatCooked";
};

class FoodGoatCooked : FoodCooked
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_cooked_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_cooked_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_GOAT_COOKED;
	descriptionShort = $STR_EQUIP_FOOD_DESC_GOAT_COOKED;	
	bloodRegen = 600;
	Nutrition[] = {143,600,0,0};
};

class FoodMuttonRaw : FoodRaw
{
	scope = 2;	
	model = "z\addons\dayz_communityassets\models\mutton_raw.p3d";
	picture = "\z\addons\dayz_communityassets\pictures\equip_mutton_raw_CA.paa";
	displayName = $STR_EQUIP_FOOD_NAME_MUTTON_RAW;
	descriptionShort = $STR_EQUIP_FOOD_DESC_MUTTON_RAW;	
	bloodRegen = 400;
	Nutrition[] = {294,350,0,0};	
	cookOutput = "FoodMuttonCooked";
};

class FoodMuttonCooked : FoodCooked
{
	scope = 2;
	
	model = "z\addons\dayz_communityassets\models\mutton_cooked.p3d";
	picture = "\z\addons\dayz_communityassets\pictures\equip_mutton_cooked_CA.paa";
	displayName = $STR_EQUIP_FOOD_NAME_MUTTON_COOKED;
	descriptionShort = $STR_EQUIP_FOOD_DESC_MUTTON_COOKED;	
	bloodRegen = 800;
	Nutrition[] = {294,700,0,0};
};

class FoodChickenRaw : FoodRaw
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_CHICKEN_RAW;
	descriptionShort = $STR_EQUIP_FOOD_DESC_CHICKEN_RAW;	
	bloodRegen = 400;	
	Nutrition[] = {219,350,0,0};	
	cookOutput = "FoodChickenCooked";
};

class FoodChickenCooked : FoodCooked
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_cooked_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_cooked_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_CHICKEN_COOKED;
	descriptionShort = $STR_EQUIP_FOOD_DESC_CHICKEN_COOKED;	
	bloodRegen = 800;
	Nutrition[] = {219,700,0,0};
};

class FoodBaconRaw : FoodRaw
{
	scope = 2;	
	model = "z\addons\dayz_communityassets\models\bacon_raw.p3d";
	picture = "\z\addons\dayz_communityassets\pictures\equip_bacon_raw_CA.paa";
	displayName = $STR_EQUIP_FOOD_NAME_BACON_RAW;
	descriptionShort = $STR_EQUIP_FOOD_DESC_BACON_RAW;	
	bloodRegen = 300;
	Nutrition[] = {417,350,0,0};	
	cookOutput = "FoodBaconCooked";
};

class FoodBaconCooked : FoodCooked
{
	scope = 2;	
	model = "z\addons\dayz_communityassets\models\bacon_fried.p3d";
	picture = "\z\addons\dayz_communityassets\pictures\equip_bacon_fried_CA.paa";
	displayName = $STR_EQUIP_FOOD_NAME_BACON_COOKED;
	descriptionShort = $STR_EQUIP_FOOD_DESC_BACON_COOKED;	
	bloodRegen = 600;
	Nutrition[] = {417,700,0,0};
};

class FoodRabbitRaw : FoodRaw
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_RABBIT_RAW;
	descriptionShort = $STR_EQUIP_FOOD_DESC_RABBIT_RAW;	
	bloodRegen = 500;
	Nutrition[] = {517,450,0,0};	
	cookOutput = "FoodRabbitCooked";
};

class FoodRabbitCooked : FoodCooked
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_cooked_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_cooked_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_RABBIT_COOKED;
	descriptionShort = $STR_EQUIP_FOOD_DESC_RABBIT_COOKED;	
	bloodRegen = 1000;
	Nutrition[] = {517,900,0,0};
};

class FoodBeefRaw : FoodRaw
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_BEEF_RAW;
	descriptionShort = $STR_EQUIP_FOOD_DESC_BEEF_RAW;	
	bloodRegen = 400;
	Nutrition[] = {332,350,0,0};	
	cookOutput = "FoodBeefCooked";
};

class FoodBeefCooked : FoodCooked
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_cooked_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_cooked_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_BEEF_COOKED;
	descriptionShort = $STR_EQUIP_FOOD_DESC_BEEF_COOKED;	
	bloodRegen = 800;
	Nutrition[] = {332,700,0,0};
};

class FoodDogRaw : FoodRaw
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_DOG_RAW;
	descriptionShort = $STR_EQUIP_FOOD_DESC_DOG_RAW;	
	bloodRegen = 300;
	Nutrition[] = {143,300,0,0};	
	cookOutput = "FoodDogCooked";
};

class FoodDogCooked : FoodCooked
{
	scope = 2;	
	model = "\dayz_equip\models\food_steak_cooked_gear.p3d";
	picture = "\dayz_equip\textures\equip_steak_cooked_ca.paa";
	displayName = $STR_EQUIP_FOOD_NAME_DOG_COOKED;
	descriptionShort = $STR_EQUIP_FOOD_DESC_DOG_COOKED;	
	bloodRegen = 600;
	Nutrition[] = {143,600,0,0};
};