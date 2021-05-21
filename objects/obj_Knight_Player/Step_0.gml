/// @description Insert description here
// You can write your code in this editor
nextState = 0;

// detect state
/*
    * 0 = Idle
    * 1 = Up left
    * 2 = Up right
    * 3 = Down left
    * 4 = Down right
    * 5 = Up
    * 6 = Down
    * 7 = Left
    * 8 = Right
*/

if (place_meeting(x,y+1, obj_InvWall)) // check if run or not run
{
    if (keyboard_check(ord("j")) && keyboard_check(ord("o")))
    {
        nextState = 1;
        animationState = "PC_FA_Leftforeward";
	}else if (keyboard_check(ord("j")) && keyboard_check(ord("u")))
    {
        nextState = 2;
        animationState = "PC_FA_Leftforeward";
	}
    else if (keyboard_check(ord("l")) && keyboard_check(ord("o")))
    {
        nextState = 3;
        animationState = "PC_FA_Rightforeward";
    }else if (keyboard_check(ord("l")) && keyboard_check(ord("u")))
    {
        nextState = 4;
        animationState = "PC_FA_Rightforeward";
    }
    else if (keyboard_check(ord("k")) && keyboard_check(ord("o")))
    {
        nextState = 5;
        animationState = "PC_FA_Leftbackward";
    }else if (keyboard_check(ord("k")) && keyboard_check(ord("u")))
    {
        nextState = 6;
        animationState = "PC_FA_Leftbackward";
    }
    else if (keyboard_check(ord("i")) && keyboard_check(ord("o")))
    {
        nextState = 7;
        animationState = "PC_FA_Rightbackward";
    }else if (keyboard_check(ord("i")) && keyboard_check(ord("u")))
    {
        nextState = 8;
        animationState = "PC_FA_Rightbackward";
    }
    else if (Input.GetKey("j"))
    {
        nextState = 9;
        animationState = "PC_FA_Foreward";
    }
    else if (Input.GetKey("l"))
    {
        nextState = 10;
        animationState = "PC_FA_Backward";
    }
    else if (Input.GetKey("k"))
    {
        nextState = 11;
        animationState = "PC_FA_Leftward";
    }
    else if (Input.GetKey("i"))
    {
        nextState = 12;
        animationState = "PC_FA_Rightward";
    }

    // idle animations according with his position
    if (nextState == 0)
    {
        animationState = "";
    }
}
else // if press shift run and change to run animatios
{
    if (Input.GetKey("w") && Input.GetKey("a"))
    {
        nextState = 1;
        animationState = "PC_FA_RunLeftforeward";
    }
    else if (Input.GetKey("w") && Input.GetKey("d"))
    {
        nextState = 2;
        animationState = "PC_FA_RunRightforeward";
    }
    else if (Input.GetKey("s") && Input.GetKey("a"))
    {
        nextState = 3;
        animationState = "PC_FA_RunLeftbackward";
    }
    else if (Input.GetKey("s") && Input.GetKey("d"))
    {
        nextState = 4;
        animationState = "PC_FA_RunRightbackward";
    }
    else if (Input.GetKey("w"))
    {
        nextState = 5;
        animationState = "PC_FA_RunForeward";
    }
    else if (Input.GetKey("s"))
    {
        nextState = 6;
        animationState = "PC_FA_RunBackward";
    }
    else if (Input.GetKey("a"))
    {
        nextState = 7;
        animationState = "PC_FA_RunLeftward";
    }
    else if (Input.GetKey("d"))
    {
        nextState = 8;
        animationState = "PC_FA_RunRightward";
    }
}
// check if its new state
if (nextState != state)
{
    state = nextState;
}
