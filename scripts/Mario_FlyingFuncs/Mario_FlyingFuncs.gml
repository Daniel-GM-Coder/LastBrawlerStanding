//Entrar en el estado
function EnterFlyingMario(animSpriteIndex)
{
	onAir = true;
	
	sprite_index = animSpriteIndex;
	
	//Hacer las movidas de que salgan volando al ser golpeados con X porcentaje
}

//Comprueba si queremos cambiar de estado
function NextStateFlyingMario()
{
	if(inputHorizMov != 0)
		return 10;
	
	if(inputVerMov == 1)
		return 9;
	
	return state;
}