if(!hitted && other != owner && owner.image_index >= firstValidFrame && owner.image_index < firstNotValidFrame)
{
	hitted = true;
	
	if(hitted && other.damagePlayer >= minDamageEffect)
	{
		if(owner.x > other.x) 
			other.speedX = (hitSpeedX + other.damagePlayer * 0.1) * -1;
		else
			other.speedX = (hitSpeedX + other.damagePlayer * 0.1) * 1;
	
		other.speedY = -(hitSpeedY + other.damagePlayer * 0.3);
		other.accel = 0.25;
		other.alarm[0] = (0.2 + (other.damagePlayer / 100)) * room_speed;
		other.hitted = true;
		if(!other.onAir) {
				y -= 5
		}
		if(other.damagePlayer < 65)
			gamepad_set_vibration(other.controllerDevice, 0.7, 0.7);
		else	
			gamepad_set_vibration(other.controllerDevice, 0.9, 0.9);
	}
	//Dañar al otro jugador
	
	if(!other.playerNumber) {
		DamagePlayer1 += damage;
	}else {
		DamagePlayer2 += damage;
	}
	
	show_debug_message("Golpeado");
}