#Basado en Proyecto de Jon Chau
extends "res://Scripts/LocalPlayer.gd"

func _ready():
	._ready()

func input_update(input, game_state):
	#calculate state of object for the given input
	vect.y += GRAVITY*0.1666667

	#Quisas no necesite este trozo en mi version
	#Collision detection for moving objects that can pass through each other
	for object in game_state:
		if object != name:
			if collisionMask.intersects(game_state[object]['collisionMask']):
				updateCounter += 1

	if input.net_input[3]: #A
		vect.x = 8
	elif input.net_input[1]: #D
		vect.x = -8
	else:
		vect.x = 0
	if (is_on_floor()):
		canJump = true
	if input.net_input[0]: #W JUMP
		if(canJump):
			canJump=false
			vect.y = JUMP_HEIGHT
	if input.local_input[3]: #SPACE
		counter = counter/2

	move_and_slide(vect,UP)
	#move_and_collide for "solid" stationary objects
	var collision = move_and_collide(vect)
	if collision:
		vect = vect.slide(collision.normal)
		move_and_collide(vect)

	collisionMask = Rect2(Vector2(position.x - rectExtents.x, position.y - rectExtents.y), Vector2(rectExtents.x, rectExtents.y) * 2)
