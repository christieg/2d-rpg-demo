extends State

@export
var talking_state: State
@export
var idle_state: State

func process_input(event: InputEvent) -> State:
	# if there is no input, then switch to idle state
	
	return null

func process_physics(delta: float) -> State:
	# Get the input direction and handle the movement/deceleration.
	# TODO: As good practice, you should replace UI actions with custom gameplay actions.
	
	movement.move_player()
	animations.player_move_animation()
	if movement.get_input_direction().is_zero_approx():
		return idle_state
	return null
