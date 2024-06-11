extends Label
var start_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position


func _physics_process(_delta):
	position = $"../player".position + start_position
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_StateMachine_state_changed(current_state):
	text = String(current_state.get_name())
