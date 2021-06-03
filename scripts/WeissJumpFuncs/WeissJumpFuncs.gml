//Entrar en el estado
function WeissEnterJumpIdle()
{
	if(!onAir && !falling && (sprite_index == spr_Weiss_Idle || sprite_index == spr_Weiss_Walk))
	{
		speedY = -20;
		onAir = true;
	}
	else if(onAir && !onAir2 && inputVerMov2 != 0)
	{
		speedY = -20;
		onAir2 = true;
	}
	
	sprite_index = spr_Weiss_OnAir;
	image_index = 0;
	
	if(facingRight)
		image_xscale = 1;
	else
		image_xscale = -1;
}

//Comprueba si queremos cambiar de estado
function WeissNextStateJumpIdle()
{
	if(inputNormalAttack)
		return 20;
		
	if(inputSpecialAttack)
		return 19;
		
	if(inputNormalDownAttack)
		return 13;
		
	if(inputSpecialDownAttack)
		return 14;
	
	if(inputNormalUpAttack)
		return 15;
		
	if(inputSpecialUpAttack)
		return 16;
		
	if(inputNormalSide)
		return 11;
		
	if(inputSpecialSide)
		return 12;
	
	if(inputHorizMov != 0)
		return 10;

	if(inputVerMov2 != 0 || falling)
		return state;

	if(!onAir)
		return 0;
	
	return state;
}