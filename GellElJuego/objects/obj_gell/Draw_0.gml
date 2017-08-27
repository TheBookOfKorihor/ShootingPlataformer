/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_color(c_red);

if (tl_collides){draw_rectangle(x,y,x+2,y+2, false);}
if (tr_collides){draw_rectangle(x+32,y,x+32+2,y+2,false);}
if (bl_collides){draw_rectangle(x,y+32, x+2,y+32+2,false);}
if (br_collides){draw_rectangle(x+32,y+32,x+32+2,y+32+2,false);}
