function WeissUpdateMovement(){
if(onAir || falling)
	{
		var targetSpeedX = 0;
		
		if(inputHorizMov != 0)
			targetSpeedX += maxWalkSpeed * inputHorizMov;

		var diffSpeedX = targetSpeedX - speedX;
		diffSpeedX = clamp(diffSpeedX, -accel, accel);
		speedX += diffSpeedX;

		var newX = x+speedX;
		if(!hitted && !place_free(newX, y))
		{
			newX = WeissFindFreePosX(newX);
	
			speedX = 0;
		}
		
		hitted = false;
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
		newY = WeissFindFreePosY(newY);
	
		speedY = 0;
		onAir = false;
		onAir2 = false;
		falling = false;
	}else {
		falling = true;
		onAir = true;
	}
	if(instance_position(x, newY, obj_OneWayPlat1) != noone 
	&& instance_position(x, y-1, obj_OneWayPlat1) == noone
	&& speedY >= -0.5
	&& (!keyboard_check(ord("S")) && !gamepad_button_check(controllerDevice, gp_padd)))
	{
		newY = WeissFindFreePosPlatform(newY);
		speedY = 0;
		onAir = false;
		onAir2 = false;
		falling = false;
	}
	y = newY;

}