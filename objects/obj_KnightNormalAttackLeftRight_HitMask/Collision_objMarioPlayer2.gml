/// @description Insert description here
// You can write your code in this editor
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
	show_debug_message("Golpeado");
}