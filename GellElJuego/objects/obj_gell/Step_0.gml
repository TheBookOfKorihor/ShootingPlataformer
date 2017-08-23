/// @description Insert description here
// You can write your code in this editor
up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);

vmove = 0;

if (right=true)
{
	hmove= gellspeed;
}

if (left= true)
{
	hmove= -gellspeed;
}

if (up)
{
	vmove= jump;
}

if (down)
{
	
}





x+= hmove;
y -= vmove-gravy;

if (hmove!=0 && !place_free(x+hmove,y))
	{
		if hmove>0 move_contact_solid(0,hmove)
		if hmove<0 move_contact_solid(180,-hmove)
		hmove=0;
	}
	
if (vmove!=0 && !place_free(x+hmove,y+vmove))
	{
		if vmove>0 move_contact_solid(270,vmove)
		if vmove<0 move_contact_solid(90,-vmove)
		vmove= 0;
	}
