//Entrar en el estado
function WeissEnterFlying(animSpriteIndex)
{
	onAir = true;
	
	sprite_index = animSpriteIndex;
	
	//Hacer las movidas de que salgan volando al ser golpeados con X porcentaje
	if(hitted)
	{
		speedX = (maxWalkSpeed + damagePlayer * 0.1) * hittedDir;
		speedY = -(maxWalkSpeed + damagePlayer * 0.3);
		//speedX = 20;
		//speedY = -30;
		hitted = false;
	}
}

//Comprueba si queremos cambiar de estado
function WeissNextStateFlying()
{
	//Vuelva al idle aéreo si usa el doble salto
	if(inputVerMov2 == 1)
		return 9;
	
	//Vuelve al idle terrestre si toca el suelo o plataforma
	if(!onAir)
		return 0;
	
	return state;
}