extends State

@export
var talking_state: State
@export
var idle_state: State

func process_input(event: InputEvent) -> State:
	# if there is no input, then switch to idle state
	if event==null:
		return idle_state
	return null

func process_physics(delta: float) -> State:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var x_dir = Input.get_axis("ui_left", "ui_right")
	var y_dir = Input.get_axis("ui_down", "ui_up")
	var dir_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if dir_vector:
		entity.velocity = dir_vector * entity.SPEED
	else: # stop moving
		entity.velocity = Vector2(0,0)
	entity.move_and_slide()
	return null
