/// @description Insert description here
// You can write your code in this editor
up    = keyboard_check(vk_up);
down  = keyboard_check(vk_down);
left  = keyboard_check(vk_left);
right = keyboard_check(vk_right);

//DEBUG MOVEMENT
if (up)    { y -= 2; }
if (down)  { y += 2; }
if (left)  { x -= 2; }
if (right) { x += 2; }

//if (up)	    {show_debug_message("Up  "); vmove= jump;} 
//if (right)	{show_debug_message("Down"); hmove = gellspeed;}
//if (left)	{show_debug_message("Left"); hmove = -gellspeed;}

//Collision Booleans
tl_collides = !place_free(x,y);
tr_collides = !place_free(x+32, y);
bl_collides = !place_free(x, y+32);
br_collides = !place_free(x+32, y+32);


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