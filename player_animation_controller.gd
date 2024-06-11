class_name PlayerAnimationController
extends AnimatedSprite2D

var player_movement : PlayerMovementController
var facingDir = Vector2(0,0)
var dir_vector = Vector2(0,0)

func init(movement_controller: PlayerMovementController):
	self.player_movement = movement_controller

# plays the animation based on the players movement direction
func player_idle_animation():
	match player_movement.get_facing_dir():
		Vector2.RIGHT:
			play_animation("IdleRight")
		Vector2.LEFT:
			play_animation("IdleLeft")
		Vector2.UP:
			play_animation("IdleUp")
		Vector2.DOWN:
			play_animation("IdleDown")

func player_move_animation():
	match player_movement.get_input_direction():
		Vector2.RIGHT:
			play_animation("MoveRight")
		Vector2.LEFT:
			play_animation("MoveLeft")
		Vector2.UP:
			play_animation("MoveUp")
		Vector2.DOWN:
			play_animation("MoveDown")

func play_animation(anim_name):
	# dont stop playing an animation if it's what we want to see
	# will cause animation not to stutter
	if animation != anim_name:
		play(anim_name)


