var layer_id = layer_get_id("CollisionTiles");
var collision_tile_id = layer_tilemap_get_id(layer_id)

var tile_id = tilemap_get_at_pixel(
	collision_tile_id, 
	argument0,  //x
	argument1); //y

var collides = 
	tile_id == 66 || //Orange wall
	tile_id == 322;  //Green Sponge

return collides;

