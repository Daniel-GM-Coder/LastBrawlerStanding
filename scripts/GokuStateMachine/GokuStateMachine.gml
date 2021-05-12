// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function GokuStateMachine(argument0, argument1, argument2){
	
	var state = argument0;
	var newState = argument1;
	var situation = array_create(1, argument1);
	var newState = 0;
	
	newState = UpdateIdle(state, situation);
	
	UpdateAttack(state, situation);
	
	UpdateCrouch(state, situation);
	
	UpdateJump(state, situation);
	
	
}

function UpdateIdle(state, situation){

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

function UpdateAttack(state, situation){
	
	switch(situation[0]){
		
	}
}

function UpdateCrouch(state, situation){
	
}

function UpdateJump(state, situation){
	
}