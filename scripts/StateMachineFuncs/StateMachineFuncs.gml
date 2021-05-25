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
function UpdateStateMachine()
{
	var nextState = SmNextState();
	
	if(nextState !=	state)
		SMChangeState(nextState);
		
	else if(nextState == 9)
		SMChangeState(nextState);
}

//Ejecuta el NextState del estado actual
function SmNextState()
{
	var nextState = -1;
	
	switch(state)
	{
		//Grounded
		case 0:
			nextState = NextStateIdle();
			break;
		case 1:
			nextState = NextStateWalk();
			break;
		case 3:
			nextState = NextAttack(0); //right & left normal
			break;
		case 4:
			nextState = NextAttack(0); //right & left special
			break;
		case 5:
			nextState = NextAttack(0); //down normal
			break;
		case 6:
			nextState = NextAttack(0); //down special
			break;
		case 7:
			nextState = NextAttack(0); //up normal
			break;
		case 8:
			nextState = NextAttack(0); //up special
			break;
			
		//Aerials
		case 9:
			nextState = NextStateJumpIdle();
			break;
		case 10:
			nextState = NextStateWalkAir();
			break;
		case 11:
			nextState = NextAttack(9); //right & left normal
			break;
		case 12:
			nextState = NextAttack(9); //right & left special
			break;
		case 13:
			nextState = NextAttack(9); //down normal
			break;
		case 14:
			nextState = NextAttack(9); //down special
			break;
		case 15:
			nextState = NextAttack(9); //up normal
			break;
		case 16:
			nextState = NextAttack(9); //up special
			break;
		case 17:
			nextState = NextStateFlying(9); //up special
			break;	
		default:
			break;
	}
	
	return nextState;
}

//Cambia el estado acutal por el dado como parámetro
function SMChangeState(newState)
{
	if(state == newState && state != 9)
		return;
	
	//Cambiar el estado
	state = newState;
	
	//Entrar al nuevo estado
	switch(state)
	{
		//Grounded
		case 0:
			nextState = EnterIdle();
			break;
		case 1:
			nextState = EnterWalk();
			break;
		case 3:
			nextState = EnterAttack(sprMarioComboAttack1,sprMarioComboAttack1); //right & left normal
			break;
		case 4:
			nextState = EnterAttack(sprMarioComboAttack3,sprMarioComboAttack3); //right & left special
			break;
		case 5:
			nextState = EnterAttack(sprMarioDownAttack,sprMarioDownAttack); //down normal
			break;
		case 6:
			nextState = EnterAttack(sprMarioDownHardAttack,sprMarioDownHardAttack); //down special
			break;
		case 7:
			nextState = EnterAttack(sprMarioUpAttack,sprMarioUpAttack); //up normal
			break;
		case 8:
			nextState = EnterAttack(sprMarioUpHardAttack,sprMarioUpHardAttack); //up special
			break;

		//Aerials
		case 9:
			nextState = EnterJumpIdle();
			break;
		case 10:
			nextState = EnterWalkAir();
			break;
		//case 11:
		//	nextState = EnterAttack(,); //right & left normal
		//	break;
		//case 12:
		//	nextState = EnterAttack(,); //right & left special
		//	break;
		//case 13:
		//	nextState = EnterAttack(,); //down normal
		//	break;
		//case 14:
		//	nextState = EnterAttack(,); //down special
		//	break;
		//case 15:
		//	nextState = EnterAttack(,); //up normal
		//	break;
		//case 16:
		//	nextState = EnterAttack(,); //up special
		//	break;
		case 17:
			nextState = EnterFlying(sprMarioDamagedFly); //damaged Flying
			break;
		default:
			break;
	}
}