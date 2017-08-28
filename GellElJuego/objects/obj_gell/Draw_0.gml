/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_color(c_red);

if (tl_collides){draw_rectangle(x,y,x+1,y+1, false);}
if (tr_collides){draw_rectangle(x+32,y,x+32+1,y+1,false);}
if (bl_collides){draw_rectangle(x,y+32, x+1,y+32+1,false);}
if (br_collides){draw_rectangle(x+32,y+32,x+32+1,y+32+1,false);}

cornerx = (x & ~31) + 32
cornery = (y & ~31) + 32

draw_set_color(c_green)
draw_rectangle(cornerx, cornery, cornerx + 1, cornery + 1, false);

lastx = x + 32 - xs;
lasty = y + 32 - ys;

draw_set_color(c_purple)
draw_rectangle(lastx, lasty, lastx + 1, lasty + 1, false);
