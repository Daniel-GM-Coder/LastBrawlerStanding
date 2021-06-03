//Entrar en el estado
function EnterFlyingMario(animSpriteIndex)
{
	//onAir se pone true para que sólo esté disponible el segundo salto
	onAir = true;
	
	sprite_index = animSpriteIndex;
	
	if(inputHorizMov != 0)
		speedX = maxWalkSpeed * inputHorizMov;
		
}

//Comprueba si queremos cambiar de estado
function NextStateFlyingMario()
{
	//Vuelva al idle aéreo si usa el doble salto
	if(inputVerMov2 == 1)
		return 9;
	
	//Vuelve al idle terrestre si toca el suelo o plataforma
	if(!onAir)
		return 0;
		
	return state;
}