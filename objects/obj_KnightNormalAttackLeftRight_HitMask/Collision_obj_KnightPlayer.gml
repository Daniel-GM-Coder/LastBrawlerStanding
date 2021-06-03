/// @description Insert description here
// You can write your code in this editor
if(!hitted && other != owner && image_index >= firstValidFrame && image_index < firstNotValidFrame)
{
	hitted = true;
	
	if(hitted && other.damagePlayer >= minDamageEffect)
	{
		other.speedX = (hitSpeedX + other.damagePlayer * 0.1) * owner.facingRight;
		other.speedY = -(hitSpeedY + other.damagePlayer * 0.3);
	}
	//Dañar al otro jugador
	switch(other.playerNumber){
		
		case 0:
			DamagePlayer2 += damage;
			break;
		case 1:
			DamagePlayer1 += damage;
			break;
	}
	show_debug_message("Golpeado");
}