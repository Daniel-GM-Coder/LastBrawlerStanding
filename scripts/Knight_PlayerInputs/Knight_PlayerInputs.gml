function KnightPlayerInputs(){
	
	inputHorizMov = 0;
	inputVerMov = 0;
	inputVerMov2 = 0;
	
	if(gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl))
	{
		inputHorizMov -= 1;
		facingRight = false;
	}
	
	if (keyboard_check(ord("A")))
	{
		inputHorizMov -= 1;
		facingRight = false;
	}
	if(gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr))
	{
		inputHorizMov += 1;
		facingRight = true;
	}
	if(keyboard_check(ord("D")))
	{
		inputHorizMov += 1;
		facingRight = true;
	}
	if(gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face1))
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
	if(gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd))
	{
		//inputVerMov = -1;
	}
	
	if(keyboard_check(ord("S")))
	{
		//inputVerMov = -1;
	}
	
	if(gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu))
	{
		//inputVerMov = 1;
	}
	
	if(keyboard_check(ord("W")))
	{
		//inputVerMov = 1;
	}
	
	
	
	inputNormalAttack = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face2) && 
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr);
	inputSpecialAttack = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face4) && 
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr);
	
	inputNormalSide = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face2) && 
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd) &&
		(gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl) ||
		gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr));
		
	inputSpecialSide = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face4) && 
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd) &&
		(gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl) ||
		gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr));
		
	
	inputNormalDownAttack = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face2) && 
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr);
		
	inputSpecialDownAttack = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face4) && 
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr);
	
	inputNormalUpAttack = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face2) && 
		gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padl) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padr);
		
	inputSpecialUpAttack = gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face4) && 
		gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padu) &&
		!gamepad_button_check(obj_DeviceManager.player1AssignedController, gp_padd);
	
	
	if(keyboard_check(ord("X")))
	{
		//inputFlying = true;
		//Usar esto para probar
	}
}