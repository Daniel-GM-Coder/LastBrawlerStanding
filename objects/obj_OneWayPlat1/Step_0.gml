with (obj_Weiss_Player)
{
	if(obj_Weiss_Player != noone)
	 {weissY = obj_Weiss_Player.y;}
}

if(weissY <= y)
{
	solid = true;
	sprite_index=(spr_OneWayPlatform);
}
else if(weissY > (y + 8))
{	
	sprite_index=(spr_OutWall);
	solid = false;
}