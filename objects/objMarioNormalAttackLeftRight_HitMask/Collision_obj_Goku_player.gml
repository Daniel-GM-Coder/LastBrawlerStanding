if(!hitted && other != owner && image_index >= firstValidFrame && image_index < firstNotValidFrame)
{
	hitted = true;
	other.hitted = true;
	other.hittedDir = owner.facingRight;
	//Dañar al otro jugador
	
	switch(other.playerNumber){
		
		case 0:
			DamagePlayer2 += damage;
			break;
		case 1:
			DamagePlayer1 += damage;
			break;
	}
	//other.playerDamage += damage;
	show_debug_message("Golpeado");
}