class Attachment_Holo : CA_Magazine
{
	scope = 2;
	count = 1;
	type = 256;	
	model = "\z\addons\dayz_communityweapons\attachments\holo\holo.p3d";
	picture = "\z\addons\dayz_communityweapons\attachments\holo\data\m_holo_ca.paa";	
	displayName = $STR_DZ_ATT_HOLO_NAME;
	descriptionShort = $STR_DZ_ATT_HOLO_DESC;
	
	class ItemActions
	{
		class AttachToPrimary
		{
			text = $STR_DZ_ATT_ACT_TO_PRIMARY;
			script = "; [_id,1] call player_attachAttachment";
		};
	};
};