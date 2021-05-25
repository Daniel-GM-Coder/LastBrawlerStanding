var nextState = 0;


if(keyboard_check(ord("W"))){
	nextState = 2;	
}else if(keyboard_check(ord("A"))){
	nextState = 1;
	nextOrientation = 0;
}else if(keyboard_check(ord("S"))){
	nextState = 3;
}else if(keyboard_check(ord("D"))){
	nextState = 1;
	nextOrientation = 1;
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
	nextOrientation = 0;
}else if(keyboard_check(ord("A")) && keyboard_check(ord("K"))){
	nextState = 5;
	nextOrientation = 0;
}else if(keyboard_check(ord("D")) && keyboard_check(ord("J"))){
	nextState = 4;
	nextOrientation = 1;
}else if(keyboard_check(ord("D")) && keyboard_check(ord("K"))){
	nextState = 5;
	nextOrientation = 1;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("J"))){
	nextState = 4;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("K"))){
	nextState = 5;
}else if(keyboard_check(ord("W")) && keyboard_check(ord("A"))){
	nextState = 2;
	nextOrientation = 0;
}else if(keyboard_check(ord("W")) && keyboard_check(ord("D"))){
	nextState = 2;
	nextOrientation = 1;
}
else if(keyboard_check(ord("S")) && keyboard_check(ord("A"))){
	nextState = 1;
	nextOrientation = 0;
}else if(keyboard_check(ord("S")) && keyboard_check(ord("D"))){
	nextState = 1;
	nextOrientation = 1;

}

var stateMachineChanges = array_create(3, noone);
stateMachineChanges = WeissStateMachine(state, nextState, grounded, t, nextOrientation);
state = stateMachineChanges[0];
grounded = stateMachineChanges[1];
t = stateMachineChanges[2];

//	FUNCIONA DE PUTA MADRE

nextY = vspeed + gravity_force * t;
if(place_free(x, y + nextY)){
	vspeed += gravity_force * t;
	t +=3;
	t = clamp(t,0, maxFallVelocity);
}else{
	vspeed = 0;
	situation = 0;
}


/*
if (keyboard_check(ord("A")) && (keyboard_check(vk_right)))
{
	image_xscale=1;
	sprite_index=spr_Weiss_SideAttack;
}
else if (keyboard_check(ord("A")) && (keyboard_check(vk_left)))
{
	image_xscale=-1;
	sprite_index=spr_Weiss_SideAttack;
}
else if (keyboard_check(ord("A")) && (keyboard_check(vk_up)))
{
	sprite_index=spr_Weiss_UpAttack;
}
else if (keyboard_check(ord("A")) && (keyboard_check(vk_down)))
{
	sprite_index=spr_Weiss_DownAttack;
}
else if (keyboard_check(ord("A")))
{
	sprite_index=spr_Weiss_BasicAttack;
}
else if (keyboard_check(vk_right))
{
	x=x+5;
	sprite_index=spr_Weiss_Walk;
	image_xscale=1;
}

else if (keyboard_check(vk_left))
{
	x=x-5;
	sprite_index=spr_Weiss_Walk;
	image_xscale=-1;
}
else
{
	sprite_index = spr_Weiss_Idle;
}
*/

if(keyboard_check(ord("N")))
{
	if(instance_number(obj_Weiss_Platform) < 1)
	{
		if(nextOrientation == 0)
		{
			instance_create_depth(x - 350, y - 40,depth,obj_Weiss_Platform);
		}
		else if(nextOrientation == 1)
		{
			instance_create_depth(x + 350, y - 40,depth,obj_Weiss_Platform);
		}
	}
	else
	{}
}