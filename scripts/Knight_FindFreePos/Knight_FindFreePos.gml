function KnightFindFreePosY(newY){
	if(newY > y)
	{
		var foundFreePos = false;
		while(newY > y && !foundFreePos)
		{
			newY -= 1;
			foundFreePos = place_free(x, newY);
		}
	}
	
	return newY;
}

function KnightFindFreePosPlatform(newY){
	if(newY > y)
	{
		var foundFreePos = false;
		while(newY > y && !foundFreePos)
		{
			newY -= 1;
			if (instance_position(x, newY, obj_OneWayPlat1) == noone)
				foundFreePos = true;
		}
	}
	
	return newY;
}

function KnightFindFreePosX(newX){
	if(newX > x)
	{
		var foundFreePos = false;
		while(newX > x && !foundFreePos)
		{
			newX -= 1;
			foundFreePos = place_free(newX, y);
		}
	}
	else
	{
		var foundFreePos = false;
		while(newX < x && !foundFreePos)
		{
			newX += 1;
			foundFreePos = place_free(newX, y);
		}
	}
	
	return newX;
}