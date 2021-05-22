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
	var returnValues = array_create(4, noone);
	var newState = argument1;
	//var situation = array_create(1, argument2);
	var situation = argument2;
	var t = argument3;
	var ssj_state = argument4;
	returnValues[0] = newState;
	returnValues[1] = situation;
	returnValues[2] = t;
	returnValues[3] = ssj_state;
	
	returnValues = UpdateIdle(state, newState, situation, ssj_state, returnValues);
	
	returnValues = UpdateAttack(state, newState, situation, ssj_state, returnValues);
	
	returnValues = UpdateWalk(state, newState, situation, ssj_state, returnValues);
	
	returnValues = UpdateCrouch(state, newState, situation, ssj_state, returnValues);
	
	returnValues = UpdateJump(state, newState, situation, t, ssj_state, returnValues);
	
	var returnResults = array_create(3, noone);

	if(returnValues[0] == -1){ // plantearlo al reves, es decir, simplemente que si el newState es diferente de -1, entonces state = newState y punto fiera makina tiburon bestia parda
		returnValues[0] = state;	
	}else{
		returnValues[0] = newState;
	}
	
	return returnValues;
}

function UpdateIdle(state, newState, situation, ssj_state, returnValues){

	switch(situation){
		
		case 0:
			if(state == 0 && newState == 0){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "idle", returnValues);
			}
			break;
			
		case 1:
			if(state == 0 && newState == 0){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "on_air", returnValues);
			}
			break;
	}
	return returnValues;
}

function UpdateAttack(state, newState, situation, ssj_state, returnValues){
	
	if(state != 4 && state != 5){
		if(situation == 0){
			if(newState == 4){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "basic_attack");
			//if(sprite_index != spr_Goku_BasicAttack)
			//	sprite_index = spr_Goku_BasicAttack;
			
			}else if(newState == 5){
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "special_atttack");
			//if(sprite_index != spr_Goku_SpecialAttack)
			//	sprite_index = spr_Goku_SpecialAttack;	
			}	
		}else{
			if(newState == 4){
				
				ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "air_attack");
			}else if(newState[0] == 5){
				
			//	ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "special_attack");
			}
		}
		
	}else{
		
		//newState = -1;
		returnValues[0] = - 1;
		
		if(state == 4){
			if(image_index >= image_number - 1){
				//newState = 0;
				returnValues[0] = 0;
				sprite_index = spr_Goku_Idle; //provisional, en funcion de la situacion habra q ponerle el idle del suelo o el de estar en el aire
			}
		}else if(state == 5){
			hspeed = 0;
			if(image_index > image_number - 1){
				//newState = 0;
				returnValues[0] = 0;
				sprite_index = spr_Goku_Idle; //provisional, en funcion de la situacion habra q ponerle el idle del suelo o el de estar en el aire
				
				//	NUEVO
				//var abilityEffect = instance_create_depth(x + 20,y - 40, depth + 1, obj_Goku_Special_Attack_Effect);
				//	with(abilityEffect){
				//		hspeed = 2;
				//	}
			}
			else if(image_index == image_number - 2){
				var abilityEffect = instance_create_depth(x + 80,y - 50, depth + 1, obj_Goku_Special_Attack_Effect);
					with(abilityEffect){
						hspeed = 8;
					}
			}
		}
	}
	return returnValues;
}

function UpdateWalk(state, newState, situation, ssj_state, returnValues){
	
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
	ChangeSpriteAccordingToSSJStatus(newState, ssj_state, "walk", returnValues);
	
	// update the speed to aim towards targetSpeed
	var diffSpeedX = targetSpeedX - hspeed; //speedX
	diffSpeedX = clamp(diffSpeedX, -accel, accel);
	hspeed += diffSpeedX; //speedX
	
	return returnValues;
}

function UpdateCrouch(state, newState, situation, ssj_state, returnValues){
	
	if(situation == 0){
		
			if(newState == 3){
			
				if(state !=2 && state != 4 && state != 5 && state != 6){
					
					//if(sprite_index != spr_Goku_Crouch)
					//	sprite_index = spr_Weiss_Crouch;
					ChangeSpriteAccordingToSSJStatus(returnValues[0], "crouch", ssj_state);
				}else if(state == 3){
					
					if(image_index == image_number){
						image_speed = 0;
					}
				} 
				//SETEAR A 0 SI EL NEW STATE ES IDLE?
			}else if(newState == 0 || newState == 1){
			
				if(state != 4 && state != 5 && state !=6){
				
					if(state == 3){
						//invertir la velocidad del sprite para levantarnos
						//pasar a idle si ya hemos terminado de levantarnos
					
						if(image_speed != -1){
							image_speed = 1;
						}else{
						
							if(image_index == 1 && image_speed = -1 && state == 3){//image_index = 0
								//sprite_index = spr_Goku_Idle;
								ChangeSpriteAccordingToSSJStatus(returnValues[0], "idle", ssj_state);
							}
						}
					}
				}
			//	keycheck_key_released --> image_speed = -1
			//	if(state == 3 && image_speed = -1 && image_index == 0){
			//		
			//	}
			}
		}
	
	return returnValues;
		
}

function UpdateJump(state, newState, situation, t, ssj_state, returnValues){
	
	// The player is grounded and can jump
	if(situation == 0 && (state == 0 || state == 1) && newState == 2){
		
		t = 0;
		returnValues[2] = 0;
		vspeed = 0;
		vspeed -= 15;
		newState = 2;
		returnValues[0] = 2;
		situation = 1;
		returnValues[1] = 1;
		
		ChangeSpriteAccordingToSSJStatus(newState, "jump", ssj_state);
		
	}else if(situation == 1){	//	The player is in the air
		
		var gravity_force = 0.23;
		var nextY = vspeed + gravity_force * t;
		if(place_free(x, y + nextY)){
			
			vspeed += gravity_force * t;
			t +=3;
			t = clamp(t,0, maxFallVelocity);
			returnValues[2] = t;
		}else{
			
			vspeed = 0;
			situation = 0;
			returnValues[1] = 0;
		}
	}
	
	return returnValues;
}

function ChangeSpriteAccordingToSSJStatus(newState, ssj_state, spriteToAsign, returnValues){
	
	switch(newState){
		
		case 0:
		
			if(ssj_state == 0){
				
				if(spriteToAsign == "idle" && sprite_index != spr_Goku_Idle)
					sprite_index = spr_Goku_Idle;
				else if(spriteToAsign == "on_air" && sprite_index != spr_Goku_OnAir)
					sprite_index = spr_Goku_OnAir;
					
			}else if(ssj_state == 1){
				
				if(spriteToAsign == "idle" && sprite_index != spr_Goku_SSJ_Idle)
					sprite_index = spr_Goku_SSJ_Idle;
				else if(spriteToAsign == "on_air" && sprite_index != spr_Goku_SSJ_OnAir)
					sprite_index = spr_Goku_SSJ_OnAir;
			}
			break;
			
		case 1:
			
			if(ssj_state == 0){
				
				if(sprite_index != spr_Goku_Walk)
					sprite_index = spr_Goku_Walk;
			}else if(ssj_state == 1){
				
				if(sprite_index != spr_Goku_SSJ_Walk)
					sprite_index = spr_Goku_SSJ_Walk;
			}
			break;
			
		case 2:
		
			if(ssj_state == 0){
				
				if(sprite_index != spr_Goku_Jump)
					sprite_index = spr_Goku_Jump;
					
			}else if(ssj_state == 1){
				
				if(sprite_index != spr_Goku_SSJ_Jump)
					sprite_index = spr_Goku_SSJ_Jump;
			}
			break;			 
			
		case 3:
		
			if(ssj_state == 0){
				
				if(sprite_index != spr_Goku_Crouch)
					sprite_index = spr_Goku_Crouch;
			}else if(ssj_state == 1){
				
				if(sprite_index != spr_Goku_SSJ_Crouch)
					sprite_index = spr_Goku_SSJ_Crouch;
			}
			break;
			
		case 4:
		
			if(ssj_state == 0){
				
				if(spriteToAsign == "basic_attack"){
					if(sprite_index != spr_Goku_BasicAttack)
						sprite_index = spr_Goku_BasicAttack;
				}else if(spriteToAsign == "air_attack"){
					if(sprite_index != spr_Goku_Air_Attack1)
						sprite_index = spr_Goku_Air_Attack1;
				}
					
			}else if(ssj_state == 1){
				
				if(spriteToAsign == "basic_attack"){
					if(sprite_index != spr_Goku_SSJ_BasicAttack)
						sprite_index = spr_Goku_SSJ_BasicAttack;
				}else if(spriteToAsign == "air_attack"){
					if(sprite_index != spr_Goku_SSJ_Air_Attack1)
						sprite_index = spr_Goku_SSJ_Air_Attack1;
				}
			}
			break;
			
		case 5:
			
			if(ssj_state == 0){
				
				if(sprite_index != spr_Goku_base_special_attack){
					sprite_index = spr_Goku_base_special_attack;
					
					
				}
					
			}else if(ssj_state == 1){
				
				if(sprite_index != spr_Goku_SSJ_SpecialAttack)
					sprite_index = spr_Goku_SSJ_SpecialAttack;
			}
			break;
	}
}