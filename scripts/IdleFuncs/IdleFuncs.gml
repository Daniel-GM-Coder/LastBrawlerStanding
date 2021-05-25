//Entrar en el estado
function EnterIdle()
{
	onAir = false;
	onAir2 = false;
	
	speedX = 0;
	speedY = 0;
	
	sprite_index = sprMarioIdle;
	image_index = 0;
	
	if(facingRight)
		image_xscale = 1;
	else
		image_xscale = -1;
}

//Comprueba si queremos cambiar de estado
function NextStateIdle()
{
	if(inputNormalAttack)
		return 3;
		
	if(inputSpecialAttack)
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
	
	return 0;
}