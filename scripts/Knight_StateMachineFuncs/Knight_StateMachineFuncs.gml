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
	if(inputFlying)
	{
		KnightChangeState(17);
		return;
	}
	
	var nextState = KnightNextState();
	
	if(nextState !=	state)
		KnightChangeState(nextState);
		
	else if(nextState == 9 || nextState == 1 || nextState == 10 || nextState == 8 || nextState == 16 || nextState == 6 || nextState == 14 || nextState == 19 || nextState == 4 || nextState == 12 || nextState == 21 || nextState == 20) 
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
		case 21:
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
	if(state == newState && state != 9 && state != 1 && state != 10 &&  state != 8 &&  state != 16 && state != 6 && state != 14 && state != 19 && state != 4 && state != 12 && state != 20 && state != 21)
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
			nextState = KnightEnterAttack(spr_Knight_FTilt, obj_KnightNormalAttackLeftRight_HitMask); //right & left normal
			break;
		case 4:
			nextState = KnightEnterAttack(spr_Knight_FSpecial, noone); //right & left special
			break;
		case 5:
			nextState = KnightEnterAttack(spr_Knight_DownTilt, obj_KnightNormalAttackDown_HitMask); //down normal
			break;
		case 6:
			nextState = KnightEnterAttack(spr_Knight_DownSpecial, obj_KnightSpecialAttackDown_HitMask); //down special
			break;
		case 7:
			nextState = KnightEnterAttack(spr_Knight_UpAttack, obj_KnightNormalAttackUp_HitMask); //up normal
			break;
		case 8:
			nextState = KnightEnterAttack(spr_Knight_UpSpecial, noone); //up special
			break;
		case 18:
			nextState = KnightEnterAttack(spr_Knight_Jab, obj_KnightJabAttack_HitMask); // normal
			break;
		case 19:
			nextState = KnightEnterAttack(spr_Knight_NeutralSpecial,noone); // special
			break;
		case 21:
			nextState = KnightEnterAttack(spr_Knight_Taunt, noone); //air attack
			break;
		//Aerials
		case 9:
			nextState = KnightEnterJumpIdle();
			break;
		case 10:
			nextState = KnightEnterWalkAir();
			break;
		case 11:
			nextState = KnightEnterAttack(spr_Knight_FrontAir, obj_KnightNormalAttackLeftRight_Air_HitMask); //right & left normal
			break;
		case 12:
			nextState = KnightEnterAttack(spr_Knight_FSpecial, noone); //right & left special
			break;
		case 13:
			nextState = KnightEnterAttack(spr_Knight_DownAir, obj_KnightNormalAttackDown_Air_HitMask); //down normal
			break;
		case 14:
			nextState = KnightEnterAttack(spr_Knight_DownSpecial, obj_KnightSpecialAttackDown_HitMask); //down special
			break;
		case 15:
			nextState = KnightEnterAttack(spr_Knight_UpAir,obj_KnightNormalAttackUp_Air_HitMask); //up normal
			break;
		case 16:
			nextState = KnightEnterAttack(spr_Knight_UpSpecial, noone); //up special
			break;
		case 17:
			nextState = KnightEnterFlying(spr_Knight_Fall2); //damaged Flying
			break;
		case 20:
			nextState = KnightEnterAttack(spr_Knight_NeutralAir, obj_KnightNeutralAttack_Air_HitMask); //air attack
			break;

		default:
			break;
	}
}