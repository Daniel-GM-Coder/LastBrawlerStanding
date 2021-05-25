if(platformReady == true)
{
	with (obj_Weiss_Player)
	{
		if(obj_Weiss_Player != noone)
		 weissY2 = obj_Weiss_Player.y;
	}

	if(weissY2 <= y)
	{
		solid = true;
	}
	if(weissY2 > (y + 8))
	{
		solid = false;
	}
}