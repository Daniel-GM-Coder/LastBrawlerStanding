if(obj_Goku_player != noone)
{weissY = obj_Goku_player.y;}

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