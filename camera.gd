extends Camera2D

@onready var target = get_node('/root/MainScene/Player')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position = target.position
	
	
