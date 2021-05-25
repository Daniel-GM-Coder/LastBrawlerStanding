//Entrar en el estado
function EnterAttack(animSpriteIndex, hitMaskIndex)
{
	//Parar al personaje
	if(!onAir)
	{
		speedX = 0;
		speedY = 0;
	}
	
	sprite_index = animSpriteIndex;
	image_index = 0;
	
	//Crear la hitMask
	//var hitMaskInstance = instance_create_depth(x, y, depth + 1, hitMaskIndex);
	//hitMaskInstance.image_xscale = image_xscale;
	//hitMaskInstance.owner = self;
}

//Comprueba si queremos cambiar de estado
function NextAttack(returnToState)
{
	if(image_index == image_number - 1)
		return returnToState;
	else
		return state;
}