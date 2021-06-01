//Entrar en el estado
function EnterFlyingMario(animSpriteIndex)
{
	onAir = true;
	
	sprite_index = animSpriteIndex;
	
	if(inputHorizMov != 0)
		speedX = maxWalkSpeed * inputHorizMov;
	//Hacer las movidas de que salgan volando al ser golpeados con X porcentaje
}

//Comprueba si queremos cambiar de estado
function NextStateFlyingMario()
{
	if(inputVerMov2 == 1)
		return 9;
	
	if(!onAir)
		return 0;
		
	return state;
}