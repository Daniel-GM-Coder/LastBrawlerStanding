//++++++++++++++GROUND WALK++++++++++++++

function  GokuEnterWalk()
{
	sprite_index = spr_Knight_Walk;
	image_xscale = inputHorizMov;
	//if(facingRight)
	//{
	//	speedX += maxWalkSpeed;
	//	image_xscale = 1;
	//}
	//else if(!facingRight)
	//{
	//	speedX -= maxWalkSpeed;
	//	image_xscale = -1;
	//}
	
	speedX = maxWalkSpeed * inputHorizMov;
}

//Comprueba si queremos cambiar de estado
function GokuNextStateWalk()
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

function GokuEnterWalkAir()
{	
	sprite_index = spr_Knight_OnAir;
	if(inputHorizMov != 0)
	{
		//speedX = maxWalkSpeed * 4 * inputHorizMov;
		image_xscale = 1 * inputHorizMov;
	}
}

//Comprueba si queremos cambiar de estado
function GokuNextStateWalkAir()
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