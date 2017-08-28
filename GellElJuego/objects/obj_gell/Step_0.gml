/// @description Insert description here
// You can write your code in this editor
var up    = keyboard_check(vk_up);
var down  = keyboard_check(vk_down);
var left  = keyboard_check(vk_left);
var right = keyboard_check(vk_right);

//DEBUG MOVEMENT
xs = 0;
ys = 0;
debug_speed = 10;
if (up)    { ys = -debug_speed; }
if (down)  { ys = debug_speed;  }
if (left)  { xs = -debug_speed; }
if (right) { xs = debug_speed;  }



//if (up)	    {show_debug_message("Up  "); vmove= jump;} 
//if (right)	{show_debug_message("Down"); hmove = gellspeed;}
//if (left)	{show_debug_message("Left"); hmove = -gellspeed;}

//Collision Booleans
tl_collides = wall_at_point(x,y);
tr_collides = wall_at_point(x+32, y);
bl_collides = wall_at_point(x, y+32);
br_collides = wall_at_point(x+32, y+32);

corners_colliding = tl_collides + tr_collides + bl_collides + br_collides;

newx = x;
newy = y;

if (corners_colliding == 4)
{	//if completely inside block, snap upwards to next block
	newy -= 32;
}
else if(corners_colliding == 2 || corners_colliding == 3)
{
	if (tl_collides && bl_collides)
	{	//snap left to wall
		newx = (x & ~31) + 31;
		if (xs < 0)
			xs = 0;
	}
	else if (tr_collides && br_collides)
	{	//snap right to wall
		newx = (x & ~31) + 1
		if (xs > 0)
			xs = 0;
	}
	
	
	if (tl_collides && tr_collides)
	{	//snap top to ceilling
		newy = (y & ~31) + 31;
		if (ys < 0)
			ys = 0;
	}
	else if (bl_collides && br_collides)
	{	//snap bottom to floor
		newy = (y & ~31) + 1
		if (ys > 0)
			ys = 0;
	}
}
else if(corners_colliding == 1)
{	
	lastx = x + 32 - xs;
	lasty = y + 32 - ys;
	
	if (br_collides)
	{		
		cornerx = (x & ~31) + 32
		cornery = (y & ~31) + 32
		
		if (lastx > cornerx && lasty < cornery) //fall from above
		{	//snap bottom to floor
			newy = (y & ~31) + 1
			if (ys > 0)
				ys = 0;
		}
		else if(lastx < cornerx && lasty > cornery) //crash from the left
		{	//snap right to wall
			newx = (x & ~31) + 1
			if (xs > 0)
				xs = 0;
		}
	}else if(tr_collides){
	}else if(bl_collides){
	}else{ //br_collides
	}
}

newx += xs;
newy += ys;

x = newx;
y = newy;


//if (!place_free(x+hmove,y))
//{
//	show_debug_message("HCOLLISION");
//}
//if (!place_free(x+hmove, y+vmove))
//{
//	show_debug_message("VCOLLISION");
//}
	


//show_debug_message(
//	"MOVEMENT: "
//	+ string(hmove) 
//	+ "/" 
//	+ string(vmove));
	
//x += hmove;
//y -= vmove;