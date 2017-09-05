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

var collision_set = get_collision_set();

resolve_collisions(collision_set);

newx += xs;
newy += ys;

x = newx;
y = newy;

