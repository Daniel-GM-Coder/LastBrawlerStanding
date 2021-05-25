function MarioStateMachine(argument0, argument1, argument2, argument3, argument4){
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
	var orientation = argument4;
	returnValues[0] = newState;
	returnValues[1] = situation;
	returnValues[2] = t;
	
	returnValues = UpdateMarioIdle(state, newState, situation, returnValues);
	
	returnValues = UpdateMarioAttack(state, newState, situation, returnValues);
	
	returnValues = UpdateMarioWalk(state, newState, situation, returnValues);
	
	//returnValues = UpdateMarioCrouch(state, newState, situation, returnValues, orientation);
	
	returnValues = UpdateMarioJump(state, newState, situation, t, returnValues);
	
	
	if(returnValues[0] == -1){ // plantearlo al reves, es decir, simplemente que si el newState es diferente de -1, entonces state = newState y punto fiera makina tiburon bestia parda
		returnValues[0] = state;	
	}else{
		returnValues[0] = newState;
	}
	
	if(orientation == 1)
		image_xscale = 1;
	else
		image_xscale = -1;
	
	return returnValues;
	
}

function UpdateMarioIdle(state, newState, situation, returnValues){

	switch(situation){
		
		case 0:
			if(state == 0 && newState == 0){
				
				if(sprite_index != sprMarioIdle)
					sprite_index = sprMarioIdle;
			}
			break;
			
		case 1:
			if(state == 0 && newState == 0){
				
				if(sprite_index != sprMarioJumpIdle)
					sprite_index = sprMarioJumpIdle;
			}
			break;
	}
	
	return returnValues;
}

function UpdateMarioAttack(state, newState, situation, returnValues){
	if(state != 6){
	
		if(state != 4){
		
			if(situation == 0){
			
				if(newState == 4){
				
					if(sprite_index != sprMarioComboAttack)
						sprite_index = sprMarioComboAttack;
			
				}else if(newState == 5){
				
					if(sprite_index != sprMarioHardAttack_initial && sprite_index != sprMarioHardAttack_final)
						sprite_index = sprMarioHardAttack_initial;
					else if(image_index == image_number - 1)
					{
						sprite_index = sprMarioHardAttack_final;
						if(!audio_is_playing(snd_Mario_Bugged))
						{
							audio_play_sound(snd_Mario_Bugged, 2, true);
						}
					}
				}
				else
				{
					audio_stop_sound(snd_Mario_Bugged);
				}
			}	
		}else{
		
			if(state == 4){
			
				var spriteToAsign = sprite_index;
			
				if(situation == 0)
					spriteToAsign = sprMarioIdle;
				else
					spriteToAsign = sprMarioJumpIdle;
			
				if(image_index >= image_number - 1){
					returnValues[0] = 0;
					sprite_index = spriteToAsign; //provisional, en funcion de la situacion habra q ponerle el idle del suelo o el de estar en el aire
				}else{
					returnValues[0] = -1;
				}
			
			}else if(state == 5){
				
				var spriteToAsign = sprite_index;
			
				if(situation == 0)
					spriteToAsign = sprMarioIdle;
				else
					spriteToAsign = sprMarioJumpIdle;
			
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

function UpdateMarioWalk(state, newState, situation, returnValues){
	if(state != 6){
	
		var targetSpeedX = 0;
	
		if(state != 4 && state != 5 && state != 6){
		
			if (keyboard_check(ord("A")))
			{
				targetSpeedX -= max_speed;
			}
			if (keyboard_check(ord("D")))
			{
				targetSpeedX += max_speed;
			}
			
			if(newState == 1 && situation == 0)
				sprite_index = sprMarioWalk;
		}
		
		var diffSpeedX = targetSpeedX - hspeed; //speedX
		diffSpeedX = clamp(diffSpeedX, -accel, accel);
		hspeed += diffSpeedX; //speedX
	}
	
	return returnValues;
}

function UpdateMarioJump(state, newState, situation, t, returnValues){
	
	// The player is situation and can jump
	if(situation == 0 && (state == 0 || state == 1) && newState == 2){
		
		returnValues[2] = 0;
		vspeed = 0;
		vspeed -= 15;
		returnValues[0] = 2;
		situation = 1;
		returnValues[1] = situation;
		
		if(sprite_index != sprMarioJumpIdle)
			sprite_index = sprMarioJumpIdle;
	}
	
	return returnValues;
}