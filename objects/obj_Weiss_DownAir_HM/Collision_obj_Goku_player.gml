if(!hitted && other != owner && image_index >= firstValidFrame && image_index < firstNotValidFrame)
{
	hitted = true;
	//Dañar al otro jugador
	//other.playerHealth += damage;
	show_debug_message("Golpeado");
}