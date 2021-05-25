if(instance_number(obj_Weiss_Player) > 0)
{
if(platformReady == true)
{
	if(obj_Weiss_Player != noone)
	{weissY2 = obj_Weiss_Player.y;}
	
if(weissY2 <= y)
	{
		solid = true;
	}

	else if(weissY2 > (y + 8))
	{	
		solid = false;
	}
}
}
else
{
	instance_destroy();
}