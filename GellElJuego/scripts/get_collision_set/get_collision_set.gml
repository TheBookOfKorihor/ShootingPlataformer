var width = sprite_width;
var height = sprite_height;

//Collision Booleans
tl_collides = wall_at_point(x,y);
tr_collides = wall_at_point(x+width-1, y);
bl_collides = wall_at_point(x, y+height-1);
br_collides = wall_at_point(x+width-1, y+height-1);

var collision_set;

collision_set[0] = tl_collides;
collision_set[1] = tr_collides;
collision_set[2] = bl_collides;
collision_set[3] = br_collides;

return collision_set;