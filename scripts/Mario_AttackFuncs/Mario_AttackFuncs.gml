//Entrar en el estado
function EnterAttackMario(animSpriteIndex, hitMaskIndex)
{
	//Parar al personaje
	if(!onAir)
	{
		speedX = 0;
		speedY = 0;
	}
	
	if(sprite_index == sprMarioSpecialAttackDown_initial)
		sprite_index = sprMarioSpecialAttackDown_final;
		
	else if(sprite_index == sprMarioSpecialAttackUp_initial_Air)
	{
		sprite_index = sprMarioSpecialAttackUp_final_Air;
		speedY = -30;
	}
	else
	{
		if(sprite_index != sprMarioSpecialAttackDown_final && sprite_index != sprMarioSpecialAttackUp_final_Air)
		{
			sprite_index = animSpriteIndex;
			image_index = 0;
		}
		else
		{
			if(inputHorizMov != 0)
				image_xscale = -inputHorizMov;
		}
	}
	
	//Crear la hitMask
	//var hitMaskInstance = instance_create_depth(x, y, depth + 1, hitMaskIndex);
	//hitMaskInstance.image_xscale = image_xscale;
	//hitMaskInstance.owner = self;
}

//Comprueba si queremos cambiar de estado
function NextAttackMario(returnToState)
{
	if(!inputSpecialDownAttack && (sprite_index == sprMarioSpecialAttackDown_initial || sprite_index == sprMarioSpecialAttackDown_final))
		return returnToState;
	
	if((sprite_index == sprMarioSpecialAttackDown_initial || sprite_index == sprMarioSpecialAttackDown_final) && image_index >= image_number - 1)
		return state;
		
	else if(sprite_index == sprMarioSpecialAttackUp_final_Air && speedY > 0)
		return 17;
		
	else if(sprite_index == sprMarioSpecialAttackUp_final_Air && speedY <= 0)
		return state;
		
	else if(image_index >= image_number - 1)
		return returnToState;
	else
		return state;
}