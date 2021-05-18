/* 
state list
	0 = idle
	1 = walk
	2 = jump
	3 = crouch
	4 = attack
	5 = special attack
	
situation list
	0 = on floor
	1 = on air 
*/

function GokuStateMachine(argument0, argument1, argument2, argument3){
	
	var state = argument0;
	var newState = array_create(1, argument1);
	var situation = array_create(1, argument2);
	var t = argument3;
	
	UpdateIdle(state, newState, situation);
	
	UpdateAttack(state, newState, situation);
	
	UpdateWalk(state, newState, situation);
	
	UpdateCrouch(state, newState, situation);
	
	UpdateJump(state, newState, situation, t);
	
	if(newState[0] == -1){ // plantearlo al reves, es decir, simplemente que si el newState es diferente de -1, entonces state = newState y punto fiera makina tiburon bestia parda
		return state;	
	}else{
		return newState[0];
	}
	
	
}

function UpdateIdle(state, newState, situation){

	switch(situation[0]){
		
		case 0:
			if(state == 0){
				if(sprite_index	!= spr_Goku_Idle){
					sprite_index = spr_Goku_Idle;
					
				}
			}
			break;
			
		case 1:
			if(state == 0){
				if(sprite_index != spr_Goku_OnAir){
					sprite_index = spr_Goku_OnAir;
				}
			}
			break;
			
		default:
			break;

	}
}

function UpdateAttack(state, newState, situation){
	
	//if(state == 4 || state == 5){
	//	if(image_index == image_number -1){
	//		newState[@ 0] = 0;
	//		sprite_index = spr_Goku_Idle; //provisional, en funcion de la situacion habra q ponerle el idle del suelo o el de estar en el aire
	//	}else{
	//		newState[@ 0] = -1;
	//	}
	//}else{
	//	if(newState[0] == 4){
	//		if(sprite_index != spr_Goku_BasicAttack)
	//			sprite_index = spr_Goku_BasicAttack;
	//	}else if(newState[0] == 5){
	//		if(sprite_index != spr_Goku_SpecialAttack)
	//			sprite_index = spr_Goku_SpecialAttack;
	//	}
	//}
	if(state != 4 && state != 5){
		if(situation[0] == 0){
			if(newState[0] == 4){
				ChangeSpriteAccordingToSSJStatus();
				
			if(sprite_index != spr_Goku_BasicAttack)
				sprite_index = spr_Goku_BasicAttack;
			
			}else if(newState[0] == 5){
			if(sprite_index != spr_Goku_SpecialAttack)
				sprite_index = spr_Goku_SpecialAttack;	
			}	
		}else{
			if(newState[0] == 4){
				
			}else if(newState[0] == 5){
				
			}
		}
		
	}else{
		
		newState[@ 0] = -1;
		
		if(state == 4){
			if(image_index >= image_number - 1){
				newState[@ 0] = 0;
				sprite_index = spr_Goku_Idle; //provisional, en funcion de la situacion habra q ponerle el idle del suelo o el de estar en el aire
			}
		}else if(state == 5){
			
			//esperar que termine la animacion del ataque especial
		}
	}
}

function UpdateWalk(state, newState, situation){
	
	var targetSpeedX = 0;
	var oldPosY = y;
	
	if(state != 4 && state != 5){
		
		if (keyboard_check(vk_left))
		{
			targetSpeedX -= max_speed;
		}
		if (keyboard_check(vk_right))
		{
			targetSpeedX += max_speed;
		}
	}
	
	// update the speed to aim towards targetSpeed
	var diffSpeedX = targetSpeedX - hspeed; //speedX
	diffSpeedX = clamp(diffSpeedX, -accel, accel);
	hspeed += diffSpeedX; //speedX
}

function UpdateCrouch(state, newState, situation){
	
	
}

function UpdateJump(state, newState, situation, t){
	
	//	Jump
	if(situation[0] == 0 && (state == 0 || state == 1) && newState[0] == 2){
		t = 0;
		
		//var speedY = vspeed;
	 	//var diffSpeedY = max_speed - abs(speedY);
		//diffSpeedY = clamp(diffSpeedY, -accel, accel);
		//vspeed -= diffSpeedY;
		//situation[@ 0] = 1;
		//newState[@ 0] = 2;
		vspeed = -8;
		
	}//else if(situation == 1){
	//	//newY -= max_speed;
	//	speedY += grav;
	//	newY = y + speedY;	
	//}
	
	
	//	Apply gravity
	//vspeed += gravity_force;
	
}

function ChangeSpriteAccordingToSSJStatus(){
	
}