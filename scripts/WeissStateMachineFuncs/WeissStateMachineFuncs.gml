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
	
	18 - normal atk. (ground)
	19 - special atk. (ground)
	20 - normal atk. (air)
	21 - special atk. (air)
*/
function WeissUpdateStateMachine()
{
	var nextState = WeissSmNextState();
	
	if(nextState !=	state)
		WeissSMChangeState(nextState);
		
	else if(nextState == 9)
		WeissSMChangeState(nextState);
}

//Ejecuta el NextState del estado actual
function WeissSmNextState()
{
	var nextState = -1;
	
	switch(state)
	{
		//Grounded
		case 0:
			nextState = WeissNextStateIdle();
			break;
		case 1:
			nextState = WeissNextStateWalk();
			break;
		case 3:
			nextState = WeissNextAttack(0); //right & left normal
			break;
		case 4:
			nextState = WeissNextAttack(0); //right & left special
			break;
		case 5:
			nextState = WeissNextAttack(0); //down normal
			break;
		case 6:
			nextState = WeissNextAttack(0); //down special
			break;
		case 7:
			nextState = WeissNextAttack(0); //up normal
			break;
		case 8:
			nextState = WeissNextAttack(0); //up special
			break;
		case 18:
			nextState = WeissNextAttack(0); // normal
			break;
		case 19:
			nextState = WeissNextAttack(0); // special
			break;
			
		//Aerials
		case 9:
			nextState = WeissNextStateJumpIdle();
			break;
		case 10:
			nextState = WeissNextStateWalkAir();
			break;
		case 11:
			nextState = WeissNextAttack(9); //right & left normal
			break;
		case 12:
			nextState = WeissNextAttack(9); //right & left special
			break;
		case 13:
			nextState = WeissNextAttack(9); //down normal
			break;
		case 14:
			nextState = WeissNextAttack(9); //down special
			break;
		case 15:
			nextState = WeissNextAttack(9); //up normal
			break;
		case 16:
			nextState = WeissNextAttack(9); //up special
			break;
		case 17:
			nextState = WeissNextStateFlying(9); //up special
			break;	
		default:
			break;
	}
	
	return nextState;
}

//Cambia el estado acutal por el dado como parámetro
function WeissSMChangeState(newState)
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
			nextState = WeissEnterIdle();
			break;
		case 1:
			nextState = WeissEnterWalk();
			break;
		case 3:
			nextState = WeissEnterAttack(spr_Weiss_SideAttack,spr_Weiss_SideAttack); //right & left normal
			break;
		case 4:
			nextState = WeissEnterAttack(spr_Weiss_SideSpecial,spr_Weiss_SideSpecial); //right & left special
			break;
		case 5:
			nextState = WeissEnterAttack(spr_Weiss_DownAttack,spr_Weiss_DownAttack); //down normal
			break;
		case 6:
			nextState = WeissEnterAttack(spr_Weiss_DownSpecial,spr_Weiss_DownSpecial); //down special
			break;
		case 7:
			nextState = WeissEnterAttack(spr_Weiss_UpAttack,spr_Weiss_UpAttack); //up normal
			break;
		case 8:
			nextState = WeissEnterAttack(spr_Weiss_UpSpecial,spr_Weiss_UpSpecial); //up special
			break;
		case 18:
			nextState = WeissEnterAttack(spr_Weiss_BasicAttack,spr_Weiss_BasicAttack); // normal
			break;
		case 19:
			nextState = WeissEnterAttack(spr_Weiss_BasicSpecial,spr_Weiss_BasicSpecial); // special
			break;

		//Aerials
		case 9:
			nextState = WeissEnterJumpIdle();
			break;
		case 10:
			nextState = WeissEnterWalkAir();
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
			nextState = WeissEnterFlying(spr_Weiss_Hurt); //damaged Flying
			break;
		default:
			break;
	}
}