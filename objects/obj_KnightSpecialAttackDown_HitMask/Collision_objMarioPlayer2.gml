if(!hitted && other != owner && owner.image_index >= firstValidFrame && owner.image_index < firstNotValidFrame)
{
	hitted = true;
	
	if(hitted && other.damagePlayer >= minDamageEffect)
	{
		other.speedX = (hitSpeedX + other.damagePlayer * 0.1) * owner.facingRight;
		other.speedY = -(hitSpeedY + other.damagePlayer * 0.3);
		other.accel = 0.25;
		other.alarm[0] = 0.2 * room_speed;
		other.hitted = true;
	}
	//Dañar al otro jugador
	
	if(!other.playerNumber) {
		DamagePlayer1 += damage;
	}else {
		DamagePlayer2 += damage;
	}
	
	show_debug_message("Golpeado");
}