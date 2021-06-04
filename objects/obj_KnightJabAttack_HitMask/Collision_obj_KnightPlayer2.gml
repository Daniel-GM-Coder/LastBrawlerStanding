if(image_index == 5){
	hitted = false;
}

if(!hitted && other != owner && (image_index >= firstValidFrame && image_index < firstNotValidFrame || image_index >= 6 && image_index < 8))
{
	hitted = true;
	
	if(hitted && other.damagePlayer >= minDamageEffect)
	{
		other.speedX = (hitSpeedX + other.damagePlayer * 0.1) * owner.image_xscale;
		other.speedY = -(hitSpeedY + other.damagePlayer * 0.3);
		other.accel = 0.25;
		other.alarm[0] = (0.2 + (other.damagePlayer / 200)) * room_speed;
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