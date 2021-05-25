function PlayerInputs(){
	
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
	
	inputNormalAttack = keyboard_check(ord("J"));
	inputSpecialAttack = keyboard_check(ord("K"));
	
	inputNormalDownAttack = keyboard_check(ord("N"));
	inputSpecialDownAttack = keyboard_check(ord("M"));
	
	inputNormalUpAttack = keyboard_check(ord("I"));
	inputSpecialUpAttack = keyboard_check(ord("O"));
	
	if(keyboard_check(ord("X")))
	{
		//inputFlying = true;
		//Usar esto para probar
	}
}