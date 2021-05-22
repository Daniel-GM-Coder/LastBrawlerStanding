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

function GokuStateMachine(argument0, argument1, argument2, argument3, argument4){
	
	var state = argument0;
	var newState = array_create(1, argument1);
	var situation = array_create(1, argument2);
	var t = array_create(1, argument3);
	var ssj_state = array_create(1, argument4);
	
	UpdateIdle(state, newState, situation, ssj_state);
	
	UpdateAttack(state, newState, situation, ssj_state);
	
	UpdateWalk(state, newState, situation, ssj_state);
	
	UpdateCrouch(state, newState, situation, ssj_state);
	
	UpdateJump(state, newState, situation, t, ssj_state);
	
	//	viejo
	//if(newState[0] == -1){
	//	return state;	
	//}else{
	//	return newState[0];
	//}
	
	//	nuevo
	var returnResults = array_create(3, noone);

	if(newState[0] == -1){ // plantearlo al reves, es decir, simplemente que si el newState es diferente de -1, entonces state = newState y punto fiera makina tiburon bestia parda
		returnResults[0] = state;	
	}else{
		returnResults[0] = newState[0];
	}
	
	returnResults[1] = situation;
	returnResults[2] = t[0];
	
	return returnResults;
	
}

function UpdateIdle(state, newState, situation, ssj_state){

	switch(situation[0]){
		
		case 0:
			if(state == 0 && newState[0] == 0){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "idle");
			}
			break;
			
		case 1:
			if(state == 0 && newState[0] == 0){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "on_air");
			}
			break;
			
		default:
			break;

	}
}

function UpdateAttack(state, newState, situation, ssj_state){
	
	if(state != 4 && state != 5){
		if(situation[0] == 0){
			if(newState[0] == 4){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "basic_atttack");
			//if(sprite_index != spr_Goku_BasicAttack)
			//	sprite_index = spr_Goku_BasicAttack;
			
			}else if(newState[0] == 5){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "special_atttack");
			//if(sprite_index != spr_Goku_SpecialAttack)
			//	sprite_index = spr_Goku_SpecialAttack;	
			}	
		}else{
			if(newState[0] == 4){
				
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "air_attack");
			}//else if(newState[0] == 5){
				
			//	ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "special_attack");
				
			//}
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

function UpdateWalk(state, newState, situation, ssj_state){
	
	var targetSpeedX = 0;
	var oldPosY = y;
	
	if(state != 4 && state != 5 && state != 5){
		
		if (keyboard_check(ord("A")))
		{
			targetSpeedX -= max_speed;
		}
		if (keyboard_check(ord("D")))
		{
			targetSpeedX += max_speed;
		}
	}
	//ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "walk");
	
	// update the speed to aim towards targetSpeed
	var diffSpeedX = targetSpeedX - hspeed; //speedX
	diffSpeedX = clamp(diffSpeedX, -accel, accel);
	hspeed += diffSpeedX; //speedX
}

function UpdateCrouch(state, newState, situation, ssj_state){
	
	if(situation[0] == 0){
		
		if(newState[0] == 3){
			
			if(state != 2 && state != 4 && state != 5 && state != 6){
				//ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "crouch");
			}
		} 
			
			//if(sprite_index != spr_Goku_Crouch){
			//	sprite_index = spr_Goku_Crouch;
			//}else{
			//	if(image_index == image_number - 1){
			//		image_speed = 0;
			//	}
			//}
			
			

		}else if(newState[0] == 0 || newState[0] == 1){
			
			if(state != 4 && state != 5 && state !=6){
				
				//if(image_index == 1 && image_speed = -1 && state == 3){
					
					//	sprite_index = spr_Goku_Idle;
					//ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "idle");
				//}
				////if(image_index >= image_number - 1){
				////	newState[@ 0] = 0;
				////	sprite_index = spr_Goku_Idle;
				////}
			}
		}
		//	keycheck_key_released --> image_speed = -1
		//	if(state == 3 && image_speed = -1 && image_index == 0){
		//		
		//	}
	}


function UpdateJump(state, newState, situation, t, ssj_state){
	
	// The player is grounded and can jump
	if(situation[0] == 0 && (state == 0 || state == 1) && newState[0] == 2){
		
		t[@ 0] = 0;
		vspeed = 0;
		vspeed -= 15;
		newState[@ 0] = 2;
		situation[@ 0] = 1;
		//if(keyboard_check_released(ord("W")))
		//	t += 2
		
	}else if(situation[0] == 1){	//	The player is in the air
		
		var gravity_force = 0.23;
		var nextY = vspeed + gravity_force * t[0];
		if(place_free(x, y + nextY)){
			
			vspeed += gravity_force * t[0];
			t[@ 0] +=3;
			t[@ 0] = clamp(t,0, maxFallVelocity);
		}else{
			
			vspeed = 0;
			situation[@ 0] = 0;
		}
		
	}
}

function ChangeSpriteAccordingToSSJStatus(newState, ssj_state, spriteToAsign){
	
	switch(newState[0]){
		
		case 0:
		
			if(ssj_state[0] == 0){
				
				if(spriteToAsign == "idle" && sprite_index != spr_Goku_Idle)
					sprite_index = spr_Goku_Idle;
			}else if(ssj_state[0] == 1){
				
				if(spriteToAsign == "on_air" && sprite_index != spr_Goku_OnAir)
					sprite_index = spr_Goku_OnAir;
			}
			break;
			
		case 1:
			
			if(ssj_state[0] == 0){
				
				if(sprite_index != spr_Goku_Walk)
					sprite_index = spr_Goku_Walk;
			}else if(ssj_state[0] == 1){
				
				if(sprite_index != spr_Goku_SSJ_Walk)
					sprite_index = spr_Goku_SSJ_Walk;
			}
			break;
			
		case 2:
		
			if(ssj_state[0] == 0){
				
				if(sprite_index != spr_Goku_Jump)
					sprite_index = spr_Goku_Jump;
					
			}else if(ssj_state[0] == 1){
				
				if(sprite_index != spr_Goku_SSJ_Jump)
					sprite_index = spr_Goku_SSJ_Jump;
			}
			break;			 
			
		case 3:
		
			break;
			
		case 4:
		
			if(ssj_state[0] == 0){
				
				if(spriteToAsign == "basic_attack"){
					if(sprite_index != spr_Goku_BasicAttack)
						sprite_index = spr_Goku_BasicAttack;
				}else if(spriteToAsign == "air_attack"){
					if(sprite_index != spr_Goku_Air_Attack1)
						sprite_index = spr_Goku_Air_Attack1;
				}
					
			}else if(ssj_state[0] == 1){
				
				if(spriteToAsign == "ssj_basic_attack"){
					if(sprite_index != spr_Goku_SSJ_BasicAttack)
						sprite_index = spr_Goku_SSJ_BasicAttack;
				}else if(spriteToAsign == "ssj_air_attack"){
					if(sprite_index != spr_Goku_SSJ_Air_Attack1)
						sprite_index = spr_Goku_SSJ_Air_Attack1;
				}
					
			}
			break;
			
		case 5:
			break;
	}
	
	
	
}