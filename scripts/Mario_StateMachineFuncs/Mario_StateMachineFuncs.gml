/*
	0 - idle
	1 - walk
	3 - left & right normal atk. (ground)
	4 - left & right special atk. (ground)
	5 - down normal atk. (ground)
	6 - down special atk. (ground)
	7 - up normal atk. (ground)
	8 - up special atk. (ground)
	
	9 - jump idle
	10 - walk (air)
	11 - left & right normal atk. (air)
	12 - left & right special atk. (air)
	13 - down normal atk. (air)
	14 - down special atk. (air)
	15 - up normal atk. (air)
	16 - up special atk. (air)
	
	17 - Hitted Flying (air)
*/
function UpdateStateMachineMario()
{
	var nextState = SmNextStateMario();
	
	if(nextState !=	state)
		SMChangeStateMario(nextState);
		
	else if(nextState == 9 || nextState == 1 || nextState == 10 || nextState == 6 || nextState == 16)
		SMChangeStateMario(nextState);
}

//Ejecuta el NextState del estado actual
function SmNextStateMario()
{
	var nextState = -1;
	
	switch(state)
	{
		//Grounded
		case 0:
			nextState = NextStateIdleMario();
			break;
		case 1:
			nextState = NextStateWalkMario();
			break;
		case 3:
			nextState = NextAttackMario(0); //right & left normal
			break;
		case 4:
			nextState = NextAttackMario(0); //right & left special
			break;
		case 5:
			nextState = NextAttackMario(0); //down normal
			break;
		case 6:
			nextState = NextAttackMario(0); //down special
			break;
		case 7:
			nextState = NextAttackMario(0); //up normal
			break;
		case 8:
			nextState = NextAttackMario(0); //up special
			break;
			
		//Aerials
		case 9:
			nextState = NextStateJumpIdleMario();
			break;
		case 10:
			nextState = NextStateWalkAirMario();
			break;
		case 11:
			nextState = NextAttackMario(9); //right & left normal
			break;
		case 12:
			nextState = NextAttackMario(9); //right & left special
			break;
		case 13:
			nextState = NextAttackMario(9); //down normal
			break;
		case 14:
			nextState = NextAttackMario(9); //down special
			break;
		case 15:
			nextState = NextAttackMario(9); //up normal
			break;
		case 16:
			nextState = NextAttackMario(9); //up special
			break;
		case 17:
			nextState = NextStateFlyingMario(); //up special
			break;	
		default:
			break;
	}
	
	return nextState;
}

//Cambia el estado acutal por el dado como parámetro
function SMChangeStateMario(newState)
{
	if(state == newState && state != 9 && state != 1 && state != 10 && state != 6 && state != 16)
		return;
	
	//Cambiar el estado
	state = newState;
	
	//Entrar al nuevo estado
	switch(state)
	{
		//Grounded
		case 0:
			nextState = EnterIdleMario();
			break;
		case 1:
			nextState = EnterWalkMario();
			break;
		case 3:
			nextState = EnterAttackMario(sprMarioNormalAttackLeftRight,sprMarioNormalAttackLeftRight); //right & left normal
			break;
		case 4:
			nextState = EnterAttackMario(sprMarioSpecialAttackLeftRight,sprMarioSpecialAttackLeftRight); //right & left special
			break;
		case 5:
			nextState = EnterAttackMario(sprMarioNormalAttackDown,sprMarioNormalAttackDown); //down normal
			break;
		case 6:
			nextState = EnterAttackMario(sprMarioSpecialAttackDown_initial,sprMarioSpecialAttackDown_final); //down special
			break;
		case 7:
			nextState = EnterAttackMario(sprMarioNormalAttackUp,sprMarioNormalAttackUp); //up normal
			break;
		case 8:
			nextState = EnterAttackMario(sprMarioSpecialAttackUp,sprMarioSpecialAttackUp); //up special
			break;

		//Aerials
		case 9:
			nextState = EnterJumpIdleMario();
			break;
		case 10:
			nextState = EnterWalkAirMario();
			break;
		case 11:
			nextState = EnterAttackMario(sprMarioNormalAttackLeftRight_Air, sprMarioNormalAttackLeftRight_Air); //right & left normal
			break;
		case 12:
			nextState = EnterAttackMario(sprMarioSpecialAttackLeftRight_Air, sprMarioSpecialAttackLeftRight_Air); //right & left special
			break;
		case 13:
			nextState = EnterAttackMario(sprMarioNormalAttackDown_Air, sprMarioNormalAttackDown_Air); //down normal
			break;
		case 14:
			nextState = EnterAttackMario(sprMarioSpecialAttackDown_Air, sprMarioSpecialAttackDown_Air); //down special
			break;
		case 15:
			nextState = EnterAttackMario(sprMarioNormalAttackUp_Air, sprMarioNormalAttackUp_Air); //up normal
			break;
		case 16:
			nextState = EnterAttackMario(sprMarioSpecialAttackUp_initial_Air, sprMarioSpecialAttackUp_initial_Air); //up special
			break;
		case 17:
			nextState = EnterFlyingMario(sprMarioDamagedFly); //damaged Flying
			break;
		default:
			break;
	}
}