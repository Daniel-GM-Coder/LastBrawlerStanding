function PlayerInputsMario(){
	
	inputHorizMov = 0; // -1 andar izquierda; 1 andar derecha
	inputVerMov = 0; // 1 va a usar el primer salto, -1 si va a bajar de plataforma
	inputVerMov2 = 0; // 1 va a usar el segundo salto
	
	if(keyboard_check(ord("A")))
	{
		inputHorizMov -= 1;
		facingRight = -1;
	}
	if(keyboard_check(ord("D")))
	{
		inputHorizMov += 1;
		facingRight = 1;
	}
	if(keyboard_check_pressed(ord("W")))
	{
		//OnAir: TRUE si ha usado el primer salto, FALSE si no
		//OnAir2: TRUE si ha usado el segundo salto, FALSE si no
		
		if(!onAir)
			inputVerMov = 1;
		else if(onAir && !onAir2)
			inputVerMov2 = 1;
	}
	if(keyboard_check(ord("S")))
	{
		inputVerMov = -1;
	}
	
	//keyboard_check_pressed: No cuenta como nuevo input hasta que no suelta y vuelve a pulsar la tecla
	inputNormalAttack = keyboard_check_pressed(ord("J"));
	inputSpecialAttack = keyboard_check_pressed(ord("K"));
	
	inputNormalDownAttack = keyboard_check_pressed(ord("N"));
	inputSpecialDownAttack = keyboard_check(ord("M"));
	
	inputNormalUpAttack = keyboard_check_pressed(ord("U"));
	inputSpecialUpAttack = keyboard_check_pressed(ord("I"));
	
	if(keyboard_check(ord("X")))
	{
		//inputFlying = true;
		//Usar esto para probar
	}
}