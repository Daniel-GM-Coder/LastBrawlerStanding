// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WeissStateMachine(argument0, argument1, argument2, argument3){
/*
state list
	0 = idle
	1 = walk
	2 = jump
	3 = crouch
	4 = attack
	5 = special attack
	6 = being hit
	
situation list
	0 = on floor
	1 = on air 
*/
	var state = argument0;
	var returnValues = array_create(3, noone);
	var newState = argument1;
	//var situation = array_create(1, argument2);
	var situation = argument2;
	var t = argument3;
	returnValues[0] = newState;
	returnValues[1] = situation;
	returnValues[2] = t;
	
	returnValues = UpdateWeissIdle(state, newState, situation, returnValues);
	
	returnValues = UpdateWeissAttack(state, newState, situation, returnValues);
	
	returnValues = UpdateWeissWalk(state, newState, situation, returnValues);
	
	returnValues = UpdateWeissCrouch(state, newState, situation, returnValues);
	
	returnValues = UpdateWeissJump(state, newState, situation, t, returnValues);
	
	show_debug_message("hola");
	if(returnValues[0] == -1){ // plantearlo al reves, es decir, simplemente que si el newState es diferente de -1, entonces state = newState y punto fiera makina tiburon bestia parda
		returnValues[0] = state;	
	}else{
		returnValues[0] = newState;
	}
	
	return returnValues;
	
}

function UpdateWeissIdle(state, newState, situation, returnValues){

	//if(state == 6){
	//	if(image
	//}else{
	
	//}
	switch(situation){
		
		case 0:
			if(state == 0 && newState == 0){
				
				if(sprite_index != spr_Weiss_Idle)
					sprite_index = spr_Weiss_Idle;
			}
			break;
			
		case 1:
			if(state == 0 && newState == 0){
				
				if(sprite_index != spr_Weiss_OnAir)
					sprite_index = spr_Weiss_OnAir;
			}
			break;
	}
	
	return returnValues;
}

function UpdateWeissAttack(state, newState, situation, returnValues){
	if(state != 6){
	
		if(state != 4 && state != 5){
		
			if(situation == 0){
			
				if(newState == 4){
				
					if(sprite_index != spr_Weiss_BasicAttack)
						sprite_index = spr_Weiss_BasicAttack;
			
				}else if(newState == 5){
				
					if(sprite_index != spr_Weiss_BasicSpecial)
						sprite_index = spr_Weiss_BasicSpecial;
			
				}
			}	
		}else{
		
			if(state == 4){
			
				var spriteToAsign = sprite_index;
			
				if(situation == 0)
					spriteToAsign = spr_Weiss_Idle;
				else
					spriteToAsign = spr_Weiss_OnAir;
			
				if(image_index >= image_number - 1){
					returnValues[0] = 0;
					sprite_index = spriteToAsign; //provisional, en funcion de la situacion habra q ponerle el idle del suelo o el de estar en el aire
				}else{
					returnValues[0] = -1;
				}
			
			}else if(state == 5){
				
				var spriteToAsign = sprite_index;
			
				if(situation == 0)
					spriteToAsign = spr_Weiss_Idle;
				else
					spriteToAsign = spr_Weiss_OnAir;
			
				if(image_index >= image_number - 1){
					returnValues[0] = 0;
					sprite_index = spriteToAsign; //provisional, en funcion de la situacion habra q ponerle el idle del suelo o el de estar en el aire
				}else{
					returnValues[0] = -1;
				}
			}
		}
	}
	return returnValues;
}

function UpdateWeissWalk(state, newState, situation, returnValues){
	if(state != 6){
	
		var targetSpeedX = 0;
		var oldPosY = y;
	
		if(state != 4 && state != 5 && state != 6){
		
			if (keyboard_check(ord("A")))
			{
				targetSpeedX -= max_speed;
			}
			if (keyboard_check(ord("D")))
			{
				targetSpeedX += max_speed;
			}
			if(newState == 1 && sprite_index != spr_Weiss_Walk)
				sprite_index = spr_Weiss_Walk;
		}
		var diffSpeedX = targetSpeedX - hspeed; //speedX
		diffSpeedX = clamp(diffSpeedX, -accel, accel);
		hspeed += diffSpeedX; //speedX
	}
	return returnValues;
}

function UpdateWeissCrouch(state, newState, situation, returnValues){
	if(state != 6){
	
		if(situation == 0){
		
			if(newState == 3){
			
				if(state !=2 && state != 4 && state != 5 && state != 6){
					if(sprite_index != spr_Weiss_Crouch)
						sprite_index = spr_Weiss_Crouch;
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
						
							if(image_index == 1 && image_speed = -1 && state == 3){
								sprite_index = spr_Weiss_Idle;
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
	}
	return returnValues;
}

function UpdateWeissJump(state, newState, situation, t, returnValues){
	
	// The player is situation and can jump
	if(situation == 0 && (state == 0 || state == 1) && newState == 2){
		
		returnValues[2] = 0;
		vspeed = 0;
		vspeed -= 10;
		returnValues[0] = 2;
		situation = 1;
		
		if(sprite_index != spr_Weiss_Jump)
			sprite_index = spr_Weiss_Jump;
		
	}else if(situation == 1){	//	The player is in the air
		
		//var gravity_force = 0.23;
		//var nextY = vspeed + gravity_force * t;
		//if(place_free(x, y + nextY)){
			
		//	vspeed += gravity_force * t;
		//	returnValues[2] +=3;
		//	returnValues[2] = clamp(t,0, maxFallVelocity);
		//}else{
			
		//	vspeed = 0;
		//	situation = 0;
		//}
		
	}
	
	return returnValues;
}
