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
	1 = on air not falling
	2 = on air falling
*/
var nextState = 0;

//	We gather the keyboard inputs here
if(keyboard_check(ord("W"))){
	nextState = 2;	
}else if(keyboard_check(ord("A"))){
	nextState = 1;
}else if(keyboard_check(ord("S"))){
	nextState = 1;
}else if(keyboard_check(ord("D"))){
	nextState = 3;
}

if(keyboard_check(ord("W")) && keyboard_check(ord("J"))){
	nextState = 4;
}else if(keyboard_check(ord("W")) && keyboard_check(ord("K"))){
	nextState = 5;
}else if(keyboard_check(ord("A")) && keyboard_check(ord("J"))){
	nextState = 4;
}else if(keyboard_check(ord("A")) && keyboard_check(ord("K"))){
	nextState = 5;
}else if(keyboard_check(ord("D")) && keyboard_check(ord("J"))){
	nextState = 4;
}else if(keyboard_check(ord("D")) && keyboard_check(ord("K"))){
	nextState = 5;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("J"))){
	nextState = 4;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("K"))){
	nextState = 5;
}

GokuStateMachine(state, nextState, situation);