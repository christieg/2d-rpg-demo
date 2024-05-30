extends State

@export var move_state: State

@export var talking_state: State

func enter() -> void:
	super()
	# do the idle animation
	animations.player_animation('Idle')


func process_input(event: InputEvent) -> State:
	# transition to the moving state if the player tried to move
	if Input.is_action_just_pressed('move_left') or Input.is_action_just_pressed('move_right') or Input.is_action_just_pressed('move_right') or Input.is_action_just_pressed('move_right'):
		return move_state
	return null

# I dont think I need to process physics just yet....
func process_physics(delta: float) -> State:
	return null

