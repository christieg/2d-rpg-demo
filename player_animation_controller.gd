class_name PlayerAnimationController
extends Node

# reference to the player

@onready var animations: AnimatedSprite2D = $player_animations
var entity : Player

func init(entity):
	self.entity = entity

# plays the animation based on the players movement direction
func player_animation():
	var facingDir = Vector2(0,0)
	var dir_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if dir_vector:
		facingDir = dir_vector
		# if going diagonal. then just pick the x axis dir
		if dir_vector.x != 0 and dir_vector.y !=0 :
			facingDir = Vector2(dir_vector.x, 0)
	if self.entity.velocity != Vector2(0,0):
		match facingDir:
			Vector2.RIGHT:
				play_animation("MoveRight")
			Vector2.LEFT:
				play_animation("MoveLeft")
			Vector2.UP:
				play_animation("MoveUp")
			Vector2.DOWN:
				play_animation("MoveDown")
	else:
		match facingDir:
			Vector2.RIGHT:
				play_animation("IdleRight")
			Vector2.LEFT:
				play_animation("IdleLeft")
			Vector2.UP:
				play_animation("IdleUp")
			Vector2.DOWN:
				play_animation("IdleDown")

func play_animation(anim_name):
	# dont stop playing an animation if it's what we want to see
	# will cause animation not to stutter
	if animations.animation != anim_name:
		animations.play(anim_name)


