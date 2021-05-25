function UpdateMovement(){
	if(onAir)
	{
		var targetSpeedX = 0;

		var diffSpeedX = targetSpeedX - speedX;
		diffSpeedX = clamp(diffSpeedX, -accel, accel);
		speedX += diffSpeedX;

		var newX = x+speedX;
		if(!place_free(newX, y))
		{
			newX = FindFreePosX(newX);
	
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
		newY = FindFreePosY(newY);
	
		speedY = 0;
		onAir = false;
		onAir2 = false;
	}
	y = newY;

}