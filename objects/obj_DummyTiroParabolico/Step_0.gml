/// @description Insert description here
// You can write your code in this editor
speedY += grav;
var newY = y + speedY;

// if we find collisions let's find a safe position
if (!place_free(x, newY))
{
	// make sure we don't go through the collision object
	var freePlaceFound = false;
	while (!freePlaceFound && newY > y)
	{
	newY -= 1;
	freePlaceFound = place_free(x, newY);
	}
	// reset the speed
	speedY = 0;
}

// update the Y position
y = newY

if(keyboard_check_pressed(vk_space)) {
	speedY = -25;
}
if(keyboard_check_pressed(vk_control)) {
	speedY = -20;
	speedX = 20;
}

var targetSpeedX =0;

if (keyboard_check(vk_left))
{
	targetSpeedX -= max_speed;
}
if (keyboard_check(vk_right))
{
	targetSpeedX += max_speed;
}

// update the speed to aim towards targetSpeed
var diffSpeedX = targetSpeedX - speedX;
diffSpeedX = clamp(diffSpeedX, -accel, accel);
speedX += diffSpeedX;

// check if we found a collision
var newX = x + speedX;
if (!place_free(newX, y))
{
// find a free place for the character
	if (speedX > 0)
	{
		var foundFreePlace = false;
		while (newX > x && !foundFreePlace)
		{
		newX -= 1;
		foundFreePlace = place_free(newX, y);
		}
	}
	else{
		var foundFreePlace = false;
		while (newX < x && !foundFreePlace)
		{
		newX += 1;
		foundFreePlace = place_free(newX, y);
		}
	}
	// reset the speed
	speedX = 0;
}

// update the position
x = newX;