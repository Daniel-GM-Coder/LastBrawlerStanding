//++++++++++++++GROUND WALK++++++++++++++

function EnterWalk()
{
	sprite_index = sprMarioWalk;
	
	if(inputHorizMov > 0)
	{
		speedX = +maxWalkSpeed;
		image_xscale = 1;
	}
	else if(inputHorizMov < 0)
	{
		speedX = -maxWalkSpeed;
		image_xscale = -1;
	}

	speedY = 0;
}

//Comprueba si queremos cambiar de estado
function NextStateWalk()
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
	
	if(inputVerMov == 1)
		return 9;

	if(inputHorizMov == 0)
		return 0;
	
	return state;
}


//++++++++++AIR WALK++++++++++++++

function EnterWalkAir()
{	
	if(inputHorizMov > 0)
	{
		speedX = maxWalkSpeed * 2;
		image_xscale = 1;
	}
	else if(inputHorizMov < 0)
	{
		speedX = -maxWalkSpeed * 2;
		image_xscale = -1;
	}
}

//Comprueba si queremos cambiar de estado
function NextStateWalkAir()
{
	if(inputNormalAttack)
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
	
	if(inputVerMov2 != 0)
		return 9;
	
	if(!onAir)
		return 0;
	
	return state;
}