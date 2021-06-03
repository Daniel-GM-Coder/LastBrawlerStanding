//Entrar en el estado
function EnterJumpIdleMario()
{
	//Sólo salta si esta en el idle o andando, y no si está cayendo
	if(!onAir && !falling && (sprite_index == sprMarioIdle || sprite_index == sprMarioWalk))
	{
		speedY = -20;
		onAir = true;
	}
	else if(onAir && !onAir2 && inputVerMov2 != 0)
	{
		speedY = -20;
		onAir2 = true;
	}
	
	sprite_index = sprMarioJumpIdle;
	image_index = 0;
	
	if(inputHorizMov != 0)
		image_xscale = inputHorizMov;
}

//Comprueba si queremos cambiar de estado
function NextStateJumpIdleMario()
{
	if(inputNormalAttack || inputNormalSide)
		return 11;
		
	if(inputSpecialAttack)
		return 12;
		
	if(inputNormalDownAttack)
		return 13;
		
	if(inputSpecialDownAttack)
		return 14;
	
	if(inputNormalUpAttack)
		return 15;
		
	if(inputSpecialUpAttack)
		return 16;

	if(inputVerMov2 != 0 || falling) //Si no usa el segundo salto o está cayendo(después de andar) vuelve al idle aéreo
		return state;
		
	if(inputHorizMov != 0)
		return 10;

	if(!onAir)
		return 0;
	
	return state;
}