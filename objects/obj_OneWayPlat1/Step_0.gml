if(instance_number(obj_Weiss_Player) > 0)
{
if(obj_Weiss_Player != noone)
{weissY = obj_Weiss_Player.y;}

if((weissY <= y + 8) && keyboard_check_pressed(ord("S")))
{	
	solid = false;
}
else if(weissY <= y)
{
	solid = true;
}

else if(weissY > (y + 8))
{	
	solid = false;
}
}