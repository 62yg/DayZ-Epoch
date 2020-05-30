class ItemPickaxe : ItemCore
{
	scope = 2;	
	model = "z\addons\dayz_communityweapons\models\pickaxe\pickaxe.p3d";
	picture = "\z\addons\dayz_communityweapons\models\pickaxe\pickaxe.paa";
	displayName = $STR_EQUIP_NAME_PICKAXE;
	descriptionShort = $STR_EQUIP_DESC_PICKAXE;
	
	class ItemActions
	{
		class Use
		{
			text = $STR_ACTIONS_MINE_STONE;
			script = "spawn player_mineStone;";
		};
	};
};

class ItemPickaxeBroken : ItemCore
{
	scope = 2;	
	model = "z\addons\dayz_communityweapons\models\pickaxe\pickaxe.p3d";
	picture = "\dayz_epoch_c\icons\tools\ItemPickaxeBroken.paa";
	displayName = $STR_name_ItemPickaxeBroken;
	descriptionShort = $STR_desc_ItemPickaxeBroken;	
	fixedTool = "ItemPickaxe";
	
	class ItemActions
	{
		class Repair
		{
			text = $STR_ACTIONS_FIX_PICKAXE;
			script = "spawn player_fixHatchet;";
		};
	};
};