function KnightPlayerInputs(){
	
	inputHorizMov = 0;
	inputVerMov = 0;
	inputVerMov2 = 0;
	
	if(keyboard_check(ord("A")))
	{
		inputHorizMov -= 1;
		facingRight = false;
	}
	if(keyboard_check(ord("D")))
	{
		inputHorizMov += 1;
		facingRight = true;
	}
	if(keyboard_check_pressed(ord("W")))
	{
		if(!onAir)
			inputVerMov = 1;
		else if(onAir && !onAir2)
			inputVerMov2 = 1;
	}
	if(keyboard_check(ord("S")))
	{
		inputVerMov = -1;
	}
	

	
	
	inputNormalSide = keyboard_check(ord("G"));
	inputSpecialSide = keyboard_check(ord("H"));
	
	inputNormalDownAttack = keyboard_check(ord("N"));
	inputSpecialDownAttack =keyboard_check(ord("M"));
	
	inputNormalUpAttack = keyboard_check(ord("U"));
	inputSpecialUpAttack = keyboard_check(ord("I"));
	
	inputNormalAttack = keyboard_check(ord("J"));
	inputSpecialAttack = keyboard_check(ord("K"));
	
	if(keyboard_check(ord("X")))
	{
		//inputFlying = true;
		//Usar esto para probar
	}
}