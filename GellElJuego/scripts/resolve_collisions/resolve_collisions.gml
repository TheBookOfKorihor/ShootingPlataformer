
var collision_set = argument0;

var tl_collides = collision_set[0];
var tr_collides = collision_set[1];
var bl_collides = collision_set[2];
var br_collides = collision_set[3];

var corners_colliding = tl_collides + tr_collides + bl_collides + br_collides;

newx = x;
newy = y;



if (corners_colliding == 4)
{	//if completely inside block, snap upwards to next block
	newy -= 32;
}
else if(corners_colliding == 2 || corners_colliding == 3)
{

	if      (tl_collides && bl_collides) snap_left_side_to_wall();	
	else if (tr_collides && br_collides) snap_right_side_to_wall();
	
	if      (tl_collides && tr_collides) snap_top_to_ceilling();
	else if (bl_collides && br_collides) snap_bottom_to_floor();
	
}
else if(corners_colliding == 1)
{	
	if (br_collides)
	{	
		var br_x = x + 32;
		var br_y = y + 32;
		
		var lastx = br_x - xs; 
		var lasty = br_y - ys;
		
		var tilex = (x & ~31) + 32
		var tiley = (y & ~31) + 32
		
		if (lasty < tiley) 
		{	//gel falls from above
			snap_bottom_to_floor();
		}	
		else if(lastx < tilex && lasty > tiley) 
		{	//gel crashes into left side of tile
			snap_right_side_to_wall();	
		}
	}
	else if(bl_collides)
	{
		var bl_x = x;
		var bl_y = y + 32;
		
		var lastx = bl_x - xs; 
		var lasty = bl_y - ys;
		
		var tilex = (x & ~31) + 32
		var tiley = (y & ~31) + 32
		
		if (lasty < tiley) 
		{	//gel falls from above
			snap_bottom_to_floor();
		}	
		else if(lastx > tilex && lasty > tiley) 
		{	//gel crashes into the right side of tile
			snap_left_side_to_wall();
		}
	}
	else if(tr_collides)
	{
		var tr_x = x + 32;
		var tr_y = y;
		
		var lastx = tr_x - xs; 
		var lasty = tr_y - ys;
		
		var tilex = (x & ~31) + 32
		var tiley = (y & ~31) + 32
		
		if (lasty > tiley) 
		{	//gel hits her head
			snap_top_to_ceilling();
		}	
		else if(lastx < tilex && lasty < tiley) 
		{	//gel crashes into left side of tile
			snap_right_side_to_wall();
		}
	}
	else //tl_collides
	{ 
		var tl_x = x;
		var tl_y = y;
		
		var lastx = tl_x - xs; 
		var lasty = tl_y - ys;
		
		var tilex = (x & ~31) + 32
		var tiley = (y & ~31) + 32
		
		if (lasty > tiley) 
		{	//gel hits her head
			snap_top_to_ceilling();
		}	
		else if(lastx > tilex && lasty < tiley) 
		{	//gel crashes into right side of tile
			snap_left_side_to_wall();
		}
	}
}