if(other.y < y)
{
	if(keyboard_check(ord("S")))
	{
		other.y = other.y + 3;
	}
	else
	{
		vspeed = 0;
	}
}