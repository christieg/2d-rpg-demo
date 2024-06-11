class_name PlayerMovementController
extends Node


var facing_dir = Vector2(0,0)
var dir_vector = Vector2(0,0)
# TODO: is there a better way to pass this ref?
@export var player: Player
@export var SPEED = 300

func move_player():
	dir_vector = get_input_direction()
	if dir_vector.length() != 0:
		facing_dir = dir_vector.normalized()
		# if going diagonal. then just pick the x axis dir
		if dir_vector.x != 0 and dir_vector.y !=0 :
			facing_dir = Vector2(dir_vector.x, 0)
		player.velocity = dir_vector * SPEED
	else: # stop moving
		player.velocity = Vector2(0,0)
	player.move_and_slide()

func get_facing_dir():
	return facing_dir
	
# helper functions to see if the player tried to move
func get_input_direction():
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
