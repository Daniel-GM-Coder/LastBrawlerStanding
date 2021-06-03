if(!hitted && other != owner && image_index >= firstValidFrame && image_index < firstNotValidFrame)
{
	hitted = true;
	other.hitted = true;
	other.hittedDir = owner.facingRight;
	//Dañar al otro jugador
	//other.playerHealth += damage;
	show_debug_message("Golpeado");
}