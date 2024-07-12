extends CharacterBody2D

# this is to keep track of the last direction that the PC moved and used for the animations
var last_direction = Vector2.ZERO;

# this is a reference to the AnimatedSprite2D node and will allow us to control the PC's animations
var animated_sprite; 

# called when the node is added to the scene so that everything is seen that needs references to other nodes
func _ready():
	animated_sprite = $AnimatedSprite2D;
	# set the animation to "idle" on startup? seems to be working
	animated_sprite.play("idle");
	#add_to_group("Player");

# this is the process loop that gets called each frame
func _physics_process(delta):
	# Vector2 is the x and y data for the axis of the map
	var direction = Vector2();
	
	# these update your direction val based on the input of the keys
	if Input.is_key_pressed(KEY_W):
		direction.y = -1;
	elif Input.is_key_pressed(KEY_S):
		direction.y = 1;
	if Input.is_key_pressed(KEY_A):
		direction.x = -1;
	elif Input.is_key_pressed(KEY_D):
		direction.x = 1;

	# sets the position to the "direction" number that correlates due to the Vector2
	position += direction;
	
	# this will save the last direction that the PC moved even after the PC has stopped moving
	if direction != Vector2.ZERO:
		last_direction = direction;
	
	
	# this block will use "direction" to determine if we are moving and if not it will use "last_direction"
	# using these we determine what sprite to use
	if direction.x != 0 or direction.y != 0:
		animated_sprite.play("walking");
	
	else:
		if last_direction.x != 0 or last_direction.y != 0:
			animated_sprite.play("idle");
	
	#this flips the sprites and makes all the work i did to flip them manually useless ;-;
	animated_sprite.flip_h = last_direction.x < 0;
	
	#TODO: test to see if this is necessary, according to the ARPG vid this moves the character with a calculated and set velocity
	# it states that this will help handle collisions with the PC if necessary preventing getting getting stuck on walls or other objects
	move_and_slide()

# used to check which npc is the player
func player():
	pass
