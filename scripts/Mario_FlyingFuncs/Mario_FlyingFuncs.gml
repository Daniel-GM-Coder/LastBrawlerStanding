//Entrar en el estado
function EnterFlyingMario(animSpriteIndex)
{
	//onAir se pone true para que sólo esté disponible el segundo salto
	onAir = true;
	
	sprite_index = animSpriteIndex;
	
	if(inputHorizMov != 0)
		speedX = maxWalkSpeed * inputHorizMov;
		
	//Hacer las movidas de que salgan volando al ser golpeados con X porcentaje
	if(hitted)
	{
		speedX = (maxWalkSpeed + damagePlayer * 0.1) * hittedDir;
		speedY = -(maxWalkSpeed + damagePlayer * 0.3);
	}
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