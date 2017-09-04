/// @description Insert description here
// You can write your code in this editor
var up    = keyboard_check(vk_up);
var down  = keyboard_check(vk_down);
var left  = keyboard_check(vk_left);
var right = keyboard_check(vk_right);

//DEBUG MOVEMENT
xs = 0; //xspeed
ys = 0; //yspeed
debug_speed = 10;

if (up)    { ys = -debug_speed; }
if (down)  { ys = debug_speed;  }
if (left)  { xs = -debug_speed; }
if (right) { xs = debug_speed;  }



//if (up)	    {show_debug_message("Up  "); vmove= jump;} 
//if (right)	{show_debug_message("Down"); hmove = gellspeed;}
//if (left)	{show_debug_message("Left"); hmove = -gellspeed;}

var height = sprite_height;
var width  = sprite_width;

//Collision Booleans
tl_collides = wall_at_point(x,y);
tr_collides = wall_at_point(x+width-1, y);
bl_collides = wall_at_point(x, y+height-1);
br_collides = wall_at_point(x+width-1, y+height-1);

var corners_colliding = tl_collides + tr_collides + bl_collides + br_collides;

var newx = x;
var newy = y;

if (corners_colliding == 4)
{	//if completely inside block, snap upwards to next block
	newy -= 32;
}
else if(corners_colliding == 2 || corners_colliding == 3)
{
	if (tl_collides && bl_collides)
	{	//snap her left side to wall
		newx = (x & ~31) + 31;
		if (xs < 0)
			xs = 0;
	}
	else if (tr_collides && br_collides)
	{	//snap her right side to wall
		newx = (x & ~31) + 1
		if (xs > 0)
			xs = 0;
	}
	
	
	if (tl_collides && tr_collides)
	{	//snap her top to ceilling
		newy = (y & ~31) + 31;
		if (ys < 0)
			ys = 0;
	}
	else if (bl_collides && br_collides)
	{	//snap her bottom to floor
		newy = (y & ~31) + 1
		if (ys > 0)
			ys = 0;
	}
}
else if(corners_colliding == 1)
{	
	if (br_collides)
	{	
		var bottom_right_x = x + 32;
		var bottom_right_y = y + 32;
		
		lastx = bottom_right_x - xs; 
		lasty = bottom_right_y - ys;
		
		tilex = (x & ~31) + 32
		tiley = (y & ~31) + 32
		
		if (lastx > tilex && lasty < tiley) //gel falls from above
		{	//snap her bottom to floor
			newy = (y & ~31) + 1
			if (ys > 0)
				ys = 0;
		}
		else if (lastx < tilex && lasty < tiley) //gel falls into corner
		{	//snap her bottom to floor
			newy = (y & ~31) + 1
			if (ys > 0)
				ys = 0;
		}
		else if(lastx < tilex && lasty > tiley) //gel crashes into left side of tile
		{	//snap her right side to wall
			newx = (x & ~31) + 1
			if (xs > 0)
				xs = 0;
		}	
	}
	else if(bl_collides)
	{
		var bottom_left_x = x;
		var bottom_left_y = y + 32;
		
		lastx = bottom_left_x - xs; 
		lasty = bottom_left_y - ys;
		
		tilex = (x & ~31) + 32
		tiley = (y & ~31) + 32
		
		if (lastx < tilex && lasty < tiley) //gel falls from above
		{	//snap bottom to floor
			newy = (y & ~31) + 1
			if (ys > 0)
				ys = 0;
		}
		else if (lastx > tilex && lasty < tiley) //gel falls into corner
		{	//snap her bottom to floor
			newy = (y & ~31) + 1
			if (ys > 0)
				ys = 0;
		}
		else if(lastx > tilex && lasty > tiley) //gel crashes into the right side of tile
		{	//snap left to wall
			newx = (x & ~31) + 31;
			if (xs < 0)
				xs = 0;
		}
	}
	else if(tr_collides)
	{
		var top_right_x = x + 32;
		var top_right_y = y;
		
		lastx = top_right_x - xs; 
		lasty = top_right_y - ys;
		
		tilex = (x & ~31) + 32
		tiley = (y & ~31) + 32
		
		if (lastx > tilex && lasty > tiley) //gel hits her head
		{	//snap her top to ceilling
			newy = (y & ~31) + 31;
			if (ys < 0)
				ys = 0;
		}
		else if (lastx < tilex && lasty > tiley) //gel falls into corner
		{	//snap her top to ceilling
			newy = (y & ~31) + 31;
			if (ys < 0)
				ys = 0;
		}
		else if(lastx < tilex && lasty < tiley) //gel crashes into left side of tile
		{	//snap her right side to wall
			newx = (x & ~31) + 1
			if (xs > 0)
				xs = 0;
		}
	}
	else
	{ //tl_collides
	
		var top_left_x = x;
		var top_left_y = y;
		
		lastx = top_left_x - xs; 
		lasty = top_left_y - ys;
		
		tilex = (x & ~31) + 32
		tiley = (y & ~31) + 32
		
		if (lastx < tilex && lasty > tiley) //gel hits her head
		{	//snap her top to ceilling
			newy = (y & ~31) + 31;
			if (ys < 0)
				ys = 0;
		}
		else if (lastx > tilex && lasty > tiley) //gel falls into corner
		{	//snap her top to ceilling
			newy = (y & ~31) + 31;
			if (ys < 0)
				ys = 0;
		}
		else if(lastx > tilex && lasty < tiley) //gel crashes into right side of tile
		{	//snap her left side to wall
			newx = (x & ~31) + 31;
			if (xs < 0)
				xs = 0;
		}
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