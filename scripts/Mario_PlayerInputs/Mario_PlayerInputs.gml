function PlayerInputsMario(){
	
	inputHorizMov = 0; // -1 andar izquierda; 1 andar derecha
	inputVerMov = 0; // 1 va a usar el primer salto, -1 si va a bajar de plataforma
	inputVerMov2 = 0; // 1 va a usar el segundo salto
	
		if(gamepad_button_check(controllerDevice, gp_padl))
	{
		inputHorizMov -= 1;
		facingRight = false;
	}
	
	if (keyboard_check(ord("A")))
	{
		inputHorizMov -= 1;
		facingRight = false;
	}
	if(gamepad_button_check(controllerDevice, gp_padr))
	{
		inputHorizMov += 1;
		facingRight = true;
	}
	if(keyboard_check(ord("D")))
	{
		inputHorizMov += 1;
		facingRight = true;
	}
	if(gamepad_button_check_pressed(controllerDevice, gp_face1))
	{
		if(!onAir)
			inputVerMov = 1;
		else if(onAir && !onAir2)
			inputVerMov2 = 1;
	}
	if(keyboard_check_pressed(vk_space))
	{
		if(!onAir)
			inputVerMov = 1;
		else if(onAir && !onAir2)
			inputVerMov2 = 1;
	}
	
	//keyboard_check_pressed: No cuenta como nuevo input hasta que no suelta y vuelve a pulsar la tecla

	
	inputNormalAttack = gamepad_button_check_pressed(controllerDevice, gp_face2) && 
		!gamepad_button_check(controllerDevice, gp_padu) &&
		!gamepad_button_check(controllerDevice, gp_padd) &&
		!gamepad_button_check(controllerDevice, gp_padl) &&
		!gamepad_button_check(controllerDevice, gp_padr);
	inputSpecialAttack = gamepad_button_check_pressed(controllerDevice, gp_face4) && 
		!gamepad_button_check(controllerDevice, gp_padu) &&
		!gamepad_button_check(controllerDevice, gp_padd) &&
		!gamepad_button_check(controllerDevice, gp_padl) &&
		!gamepad_button_check(controllerDevice, gp_padr);
	
	inputNormalSide = gamepad_button_check_pressed(controllerDevice, gp_face2) && 
		!gamepad_button_check(controllerDevice, gp_padu) &&
		!gamepad_button_check(controllerDevice, gp_padd) &&
		(gamepad_button_check(controllerDevice, gp_padl) ||
		gamepad_button_check(controllerDevice, gp_padr));
		
	inputSpecialSide = gamepad_button_check_pressed(controllerDevice, gp_face4) && 
		!gamepad_button_check(controllerDevice, gp_padu) &&
		!gamepad_button_check(controllerDevice, gp_padd) &&
		(gamepad_button_check(controllerDevice, gp_padl) ||
		gamepad_button_check(controllerDevice, gp_padr));
		
	
	inputNormalDownAttack = gamepad_button_check_pressed(controllerDevice, gp_face2) && 
		!gamepad_button_check(controllerDevice, gp_padu) &&
		gamepad_button_check(controllerDevice, gp_padd) &&
		!gamepad_button_check(controllerDevice, gp_padl) &&
		!gamepad_button_check(controllerDevice, gp_padr);
		
	inputSpecialDownAttack = gamepad_button_check_pressed(controllerDevice, gp_face4) && 
		!gamepad_button_check(controllerDevice, gp_padu) &&
		gamepad_button_check(controllerDevice, gp_padd) &&
		!gamepad_button_check(controllerDevice, gp_padl) &&
		!gamepad_button_check(controllerDevice, gp_padr);
	
	inputNormalUpAttack = gamepad_button_check_pressed(controllerDevice, gp_face2) && 
		gamepad_button_check(controllerDevice, gp_padu) &&
		!gamepad_button_check(controllerDevice, gp_padd) &&
		!gamepad_button_check(controllerDevice, gp_padl) &&
		!gamepad_button_check(controllerDevice, gp_padr);
		
	inputSpecialUpAttack = gamepad_button_check_pressed(controllerDevice, gp_face4) && 
		gamepad_button_check(controllerDevice, gp_padu) &&
		!gamepad_button_check(controllerDevice, gp_padd);
		
	
	if(hitted)
	{
		inputFlying = true;
	}
}