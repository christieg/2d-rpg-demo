class_name State
extends Node

@export var animation_name: String

## Hold a reference to the parent so that it can be controlled by the state
var animations: PlayerAnimationController
var entity: Player
var movement: PlayerMovementController


func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func play_animation(anim_name):
	# dont stop playing an animation if it's what we want to see
	# will cause animation not to stutter
	if animations.animation != anim_name:
		animations.play(anim_name)
	
