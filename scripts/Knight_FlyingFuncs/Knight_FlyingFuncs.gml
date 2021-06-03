//Entrar en el estado
function KnightEnterFlying(animSpriteIndex)
{
	onAir = true;
	
	sprite_index = animSpriteIndex;
	
	if(onAir2) {
		image_blend = c_gray;
	}
	
	//Hacer las movidas de que salgan volando al ser golpeados con X porcentaje
	if(hitted && damagePlayer >= 40)
	{
		speedX = (maxWalkSpeed + damagePlayer * 0.1) * hittedDir;
		speedY = -(maxWalkSpeed + damagePlayer * 0.3);
	}
}

//Comprueba si queremos cambiar de estado
function KnightNextStateFlying()
{	
	//Vuelva al idle aéreo si usa el doble salto
	if(inputVerMov2 == 1)
		return 9;
	
	//Vuelve al idle terrestre si toca el suelo o plataforma
	if(!onAir)
		return 0;
		
	return state;
}