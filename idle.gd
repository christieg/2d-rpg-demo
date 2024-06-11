extends State

@export var move_state: State
@export var talking_state: State

func enter() -> void:
	super()
	# do the idle animation
	animations.player_idle_animation()


func process_input(event: InputEvent) -> State:
	# transition to the moving state if the player tried to move
	if movement.get_input_direction():
		return move_state
	return null

# I dont think I need to process physics just yet....
func process_physics(delta: float) -> State:
	return null

