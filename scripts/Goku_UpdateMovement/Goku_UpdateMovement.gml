function  GokuUpdateMovement(){
if(onAir)
	{
		var targetSpeedX = 0;
		
		if(inputHorizMov != 0)
			targetSpeedX += maxWalkSpeed * inputHorizMov;

		var diffSpeedX = targetSpeedX - speedX;
		diffSpeedX = clamp(diffSpeedX, -accel, accel);
		speedX += diffSpeedX;

		var newX = x+speedX;
		if(!place_free(newX, y))
		{
			newX =  KnightFindFreePosX(newX);
	
			speedX = 0;
		}
	
		x = newX;
	}
	else
	{
		x += speedX;
	}

	speedY += grav;
		
	var newY = y + speedY;

	if(!place_free(x, newY))
	{
		newY =  KnightFindFreePosY(newY);
	
		speedY = 0;
		onAir = false;
		onAir2 = false;
	}
	if(instance_position(x, newY, obj_OneWayPlat1) != noone 
	&& instance_position(x, y-1, obj_OneWayPlat1) == noone
	&& speedY >= -0.5
	&& !keyboard_check(ord("S")))
	{
		newY = KnightFindFreePosPlatform(newY);
		speedY = 0;
		onAir = false;
		onAir2 = false;
	}
	y = newY;

}