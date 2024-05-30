class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var curHP : int = 10
var maxHP : int = 10
var moveSpeed : int = 250
var damage : int = 1

var gold : int = 0

var curLevel : int = 0
var xpToNextLevel : int = 50
var xpToLevelIncreaseRate : float = 1.2

var interactDist : int = 70

var facingDir : Vector2 = Vector2()

@onready var rayCast = get_node("RayCast2D")
@onready var anim = get_node("AnimatedSprite2D")
@onready var state_machine: Node = $state_machine
@onready var animation_controller : PlayerAnimationController = $player_animation_controller

func _ready() -> void:
	animation_controller.init(self)
	state_machine.init(self, animation_controller)

# called to handle input
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)


func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)


func _process(delta: float) -> void:
	state_machine.process_frame(delta)


# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func get_input():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_dir = Input.get_axis("ui_left", "ui_right")
	var y_dir = Input.get_axis("ui_down", "ui_up")
	var dir_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if dir_vector:
		velocity = dir_vector * SPEED
		facingDir = dir_vector
		if x_dir != 0 and y_dir !=0 :
			facingDir = Vector2(x_dir, 0)
	else: # stop moving
		velocity = Vector2(0,0)
	## Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	#	# Add the gravity.
	#	if not is_on_floor():
	#		velocity.y += gravity * delta

#func _physics_process(_delta):
	#get_input()
	#move_and_slide()
	#manage_animations()
	
func manage_animations ():
	# if moving
	if velocity != Vector2(0,0):
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
	if anim.animation != anim_name:
		anim.play(anim_name)
