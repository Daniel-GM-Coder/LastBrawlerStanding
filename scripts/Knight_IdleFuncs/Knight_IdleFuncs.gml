//Entrar en el estado
function KnightEnterIdle()
{
	onAir = false;
	onAir2 = false;
	
	speedX = 0;
	speedY = 0;
	
	image_blend = noone;
	
	sprite_index = spr_Knight_Idle;
	image_index = 0;
	
	if(facingRight)
		image_xscale = 1;
	else
		image_xscale = -1;
}

//Comprueba si queremos cambiar de estado
function KnightNextStateIdle()
{
	if(inputNormalSide)
		return 3;
		
	if(inputSpecialSide)
		return 4;
	
	if(inputNormalDownAttack)
		return 5;
		
	if(inputSpecialDownAttack)
		return 6;
	
	if(inputNormalUpAttack)
		return 7;
		
	if(inputSpecialUpAttack)
		return 8;
	
	if(inputHorizMov != 0)
		return 1;
	
	if(inputVerMov == 1)
		return 9;
	
	if(inputNormalAttack == 1)
		return 18;
		
	if(inputSpecialAttack == 1)
		return 19;
	return 0;
}