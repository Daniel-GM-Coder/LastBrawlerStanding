function UpdateMovementMario(){
	
	//Sólo hay aceleración horizontal si el player está en el aire, ya sea cayendo o por haber saltado
	
	if(onAir || falling)
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
			newX = FindFreePosX(newX);
	
			speedX = 0;
		}
	
		x = newX;
	}
	else
	{
		var newX = x+speedX;
		if(!place_free(newX, y))
		{
			newX = FindFreePosX(newX);
	
			speedX = 0;
		}
		
		x += speedX;
	}

	speedY += grav;
		
	var newY = y + speedY;

	if(!place_free(x, newY))
	{
		newY = FindFreePosY(newY);
		
		//Si el player está en el suelo, ambos saltos se vuelven disponibles, y el player no está cayendo
		speedY = 0;
		onAir = false;
		onAir2 = false;
		falling = false;
	}
	else
	{
		//Si el player está "cayendo" falling se pone true y el primer salto disponible
		falling = true;
		onAir = true;
	}
	
	//Si el player se apoya en la plataforma desde arriba se mantiene a menos que pulse S.
	//Si salta desde abajo, la atraviesa.
	if(instance_position(x, newY, obj_OneWayPlat1) != noone 
	&& instance_position(x, y-1, obj_OneWayPlat1) == noone
	&& speedY > -0.5
	&& (!keyboard_check(ord("S")) && !gamepad_button_check(controllerDevice, gp_padd)))
	{
		newY = MarioFindFreePosPlatform(newY);
		
		speedY = 0;
		onAir = false;
		onAir2 = false;
		falling = false;
	}
	y = newY;

}