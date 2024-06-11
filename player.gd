class_name Player
extends CharacterBody2D


#@onready var rayCast = get_node("RayCast2D")
#@onready var anim = get_node("AnimatedSprite2D")
@onready var state_machine: Node = $state_machine
@onready var animation_controller: PlayerAnimationController = $player_animations
@onready var movement_controller: PlayerMovementController = $movement_controller

func _ready() -> void:
	animation_controller.init(movement_controller)
	state_machine.init(self, animation_controller, movement_controller)

# called to handle input
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)


func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)


func _process(delta: float) -> void:
	state_machine.process_frame(delta)

