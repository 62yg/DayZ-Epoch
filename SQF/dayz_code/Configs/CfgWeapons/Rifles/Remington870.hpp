#define R870_FLASHLIGHT class FlashLight\
{\
	color[] = {0.9, 0.9, 0.7, 0.9};\
	ambient[] = {0.1, 0.1, 0.1, 1.0};\
	position = "flash dir";\
	direction = "flash";\
	angle = 30;\
	scale[] = {1, 1, 0.5};\
	brightness = 0.1;\
}

#define R870_MFLASHLIGHT class FlashLight\
{\
	color[] = {0.9, 0.0, 0.0, 0.9};\
	ambient[] = {0.1, 0.0, 0.0, 1.0};\
	position = "flash dir";\
	direction = "flash";\
	angle = 30;\
	scale[] = {1, 1, 0.5};\
	brightness = 0.08;\
}

class Remington870_Base : Rifle
{
	scope = 2;
	
	descriptionShort = $STR_DZ_WPN_R870_DESC;
	
	magazines[] =
	{
		8Rnd_12Gauge_Slug,
		8Rnd_12Gauge_Buck,
		2Rnd_12Gauge_Slug,
		2Rnd_12Gauge_Buck
	};
	
	handAnim[] = {"OFP2_ManSkeleton", "\Ca\weapons_E\Data\Anim\LeeEnfield.rtm"};
	
	distanceZoomMin = 100;
	distanceZoomMax = 100;

	modes[] = {"Single"};
	
	class Single : Mode_SemiAuto
	{
		dispersion = 0.003;
		soundContinuous = 0;	
		reloadTime = 0.5;		
		begin1[] = {"\dayz_epoch_c\sounds\weapons\shotgun_0", 1.77828, 1, 1000};
		begin2[] = {"\dayz_epoch_c\sounds\weapons\shotgun_1", 1.77828, 1, 1000};
		begin3[] = {"\dayz_epoch_c\sounds\weapons\shotgun_2", 1.77828, 1, 1000};
		soundBegin[] = {"begin1", 0.33, "begin2", 0.33, "begin3", 0.33};
		drySound[] = {"ca\sounds\weapons\rifles\dry", 0.01, 1, 10};
		recoil = "recoil_single_primary_9outof10";
		recoilProne = "recoil_single_primary_prone_8outof10";
	};
};

class Remington870_DZ : Remington870_Base
{
	model = "\dayz_weapons\models\Remington870.p3d";
	picture = "\dayz_weapons\textures\equip_remington870_CA.paa";
	displayname = $STR_DZ_WPN_R870_NAME;
	
	class Attachments
	{
		Attachment_FL = "Remington870_FL_DZ";
		Attachment_MFL = "Remington870_MFL_DZ";
	};
};

class Remington870_FL_DZ : Remington870_DZ
{
	model = "\dayz_weapons\models\Remington870_lamp.p3d";
	displayname = $STR_DZ_WPN_R870_FL_NAME;
	descriptionShort = $STR_DZ_WPN_R870_FL_DESC;
	
	R870_FLASHLIGHT;

	class Attachments {};

	class ItemActions
	{
		class RemoveFlashlight
		{
			text = $STR_DZ_ATT_FL_RFL_RMVE;
			script = "; ['Attachment_FL',_id,'Remington870_DZ'] call player_removeAttachment";
		};
	};
};

class Remington870_MFL_DZ : Remington870_DZ
{
	model = "\dayz_weapons\models\Remington870_lamp.p3d";
	displayname = $STR_DZ_WPN_R870_MFL_NAME;
	descriptionShort = $STR_DZ_WPN_R870_FL_DESC;
	
	R870_MFLASHLIGHT;

	class Attachments {};

	class ItemActions
	{
		class RemoveFlashlight
		{
			text = $STR_DZ_ATT_FL_RFL_RMVE;
			script = "; ['Attachment_MFL',_id,'Remington870_DZ'] call player_removeAttachment";
		};
	};
};
