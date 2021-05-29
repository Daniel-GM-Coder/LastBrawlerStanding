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
function KnightUpdateStateMachine()
{
	var nextState = KnightNextState();
	
	if(nextState !=	state)
		KnightChangeState(nextState);
		
	else if(nextState == 9 || nextState == 1 || nextState == 10)
		KnightChangeState(nextState);
}

//Ejecuta el NextState del estado actual
function KnightNextState()
{
	var nextState = -1;
	
	switch(state)
	{
		//Grounded
		case 0:
			nextState = KnightNextStateIdle();
			break;
		case 1:
			nextState = KnightNextStateWalk();
			break;
		case 3:
			nextState = KnightNextAttack(0); //right & left normal
			break;
		case 4:
			nextState = KnightNextAttack(0); //right & left special
			break;
		case 5:
			nextState = KnightNextAttack(0); //down normal
			break;
		case 6:
			nextState = KnightNextAttack(0); //down special
			break;
		case 7:
			nextState = KnightNextAttack(0); //up normal
			break;
		case 8:
			nextState = KnightNextAttack(0); //up special
			break;
		case 18:
			nextState = KnightNextAttack(0); // normal
			break;
		case 19:
			nextState = KnightNextAttack(0); // special
			break;

			
		//Aerials
		case 9:
			nextState = KnightNextStateJumpIdle();
			break;
		case 10:
			nextState = KnightNextStateWalkAir();
			break;
		case 11:
			nextState = KnightNextAttack(9); //right & left normal
			break;
		case 12:
			nextState = KnightNextAttack(9); //right & left special
			break;
		case 13:
			nextState = KnightNextAttack(9); //down normal
			break;
		case 14:
			nextState = KnightNextAttack(9); //down special
			break;
		case 15:
			nextState = KnightNextAttack(9); //up normal
			break;
		case 16:
			nextState = KnightNextAttack(9); //up special
			break;
		case 17:
			nextState = KnightNextStateFlying(); //up special
			break;	
		case 20:
			nextState = KnightNextAttack(9); // Normal Air
			break;	
		default:
			break;
	}
	
	return nextState;
}

//Cambia el estado acutal por el dado como parámetro
function KnightChangeState(newState)
{
	if(state == newState && state != 9 && state != 1 && state != 10)
		return;
	
	//Cambiar el estado
	state = newState;
	
	//Entrar al nuevo estado
	switch(state)
	{
		//Grounded
		case 0:
			nextState = KnightEnterIdle();
			break;
		case 1:
			nextState = KnightEnterWalk();
			break;
		case 3:
			nextState = KnightEnterAttack(spr_Knight_Jab,spr_Knight_Jab); //right & left normal
			break;
		case 4:
			nextState = KnightEnterAttack(spr_Knight_FSpecial,spr_Knight_FSpecial); //right & left special
			break;
		case 5:
			nextState = KnightEnterAttack(spr_Knight_DownTilt,spr_Knight_DownTilt); //down normal
			break;
		case 6:
			nextState = KnightEnterAttack(spr_Knight_DownSpecial,spr_Knight_DownSpecial); //down special
			break;
		case 7:
			nextState = KnightEnterAttack(spr_Knight_UpAttack,spr_Knight_UpAttack); //up normal
			break;
		case 8:
			nextState = KnightEnterAttack(spr_Knight_UpSpecial,spr_Knight_UpSpecial); //up special
			break;
		case 18:
			nextState = KnightEnterAttack(spr_Knight_NeutralAir,spr_Knight_NeutralAir); // normal
			break;
		case 19:
			nextState = KnightEnterAttack(spr_Knight_NeutralSpecial,spr_Knight_NeutralSpecial); // special
			break;

		//Aerials
		case 9:
			nextState = KnightEnterJumpIdle();
			break;
		case 10:
			nextState = KnightEnterWalkAir();
			break;
		case 11:
			nextState = KnightEnterAttack(spr_Knight_FrontAir, spr_Knight_FrontAir); //right & left normal
			break;
		case 12:
			nextState = KnightEnterAttack(spr_Knight_FSpecial, spr_Knight_FSpecial); //right & left special
			break;
		case 13:
			nextState = KnightEnterAttack(spr_Knight_DownAir, spr_Knight_DownAir); //down normal
			break;
		case 14:
			nextState = KnightEnterAttack(spr_Knight_DownSpecial, spr_Knight_DownSpecial); //down special
			break;
		case 15:
			nextState = KnightEnterAttack(spr_Knight_UpAir,spr_Knight_UpAir); //up normal
			break;
		case 16:
			nextState = KnightEnterAttack(spr_Knight_UpSpecial, spr_Knight_UpSpecial); //up special
			break;
		case 17:
			nextState = KnightEnterFlying(spr_Knight_HurtAir); //damaged Flying
			break;
		case 20:
			nextState = KnightEnterAttack(spr_Knight_NeutralAir, spr_Knight_NeutralAir); //air attack
			break;
		default:
			break;
	}
}