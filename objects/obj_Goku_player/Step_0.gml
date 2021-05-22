/* 
state list
	0 = idle
	1 = walk
	2 = jump
	3 = crouch
	4 = attack
	5 = special attack
	6 = Receiving damage
	
	
situation list
	0 = on floor
	1 = on air 
*/
//	We gather the keyboard inputs here
orientation = 0;
var nextState = 0;

if(keyboard_check(ord("W"))){
	nextState = 2;	
}else if(keyboard_check(ord("A"))){
	nextState = 1;
	orientation = 0;
}else if(keyboard_check(ord("S"))){
	nextState = 3;
}else if(keyboard_check(ord("D"))){
	nextState = 1;
	orientation = 1;
}else if(keyboard_check(ord("J"))){
	nextState = 4;	
}else if(keyboard_check(ord("K"))){
	nextState = 5;	
}

if(keyboard_check(ord("W")) && keyboard_check(ord("J"))){
	nextState = 4;
}else if(keyboard_check(ord("W")) && keyboard_check(ord("K"))){
	nextState = 5;
}else if(keyboard_check(ord("A")) && keyboard_check(ord("J"))){
	nextState = 4;
	orientation = 0;
}else if(keyboard_check(ord("A")) && keyboard_check(ord("K"))){
	nextState = 5;
	orientation = 0;
}else if(keyboard_check(ord("D")) && keyboard_check(ord("J"))){
	nextState = 4;
	orientation = 1;
}else if(keyboard_check(ord("D")) && keyboard_check(ord("K"))){
	nextState = 5;
	orientation = 1;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("J"))){
	nextState = 4;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("K"))){
	nextState = 5;
}else if(keyboard_check(ord("W")) && keyboard_check(ord("A"))){
	nextState = 2;
	orientation = 0;
}else if(keyboard_check(ord("W")) && keyboard_check(ord("D"))){
	nextState = 2;
	orientation = 1;
}
else if(keyboard_check(ord("S")) && keyboard_check(ord("A"))){
	nextState = 1;
	orientation = 0;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("D"))){
	nextState = 1;
	orientation = 1;

}

//FUNCIONA DE PUTA MADRE
var nextY = vspeed + gravity_force * t;
if(place_free(x, y + nextY)){
	vspeed += gravity_force * t;
	t +=3;
	t = clamp(t,0, maxFallVelocity);
}else{
	vspeed = 0;
	situation = 0;
}

//state = GokuStateMachine(state, nextState, situation, t);

var stateMachineChanges = array_create(3, noone);
stateMachineChanges = GokuStateMachine(state, nextState, situation, t, ssj_status, orientation);	//	nuevo
state = stateMachineChanges[0];
situation = stateMachineChanges[1];
t = stateMachineChanges[2];
ssj_status = stateMachineChanges[3];
