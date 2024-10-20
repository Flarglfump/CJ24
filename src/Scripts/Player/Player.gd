extends CharacterBody2D

@export var GRAVITY = 20
@export var SPEED = 200
@export var JUMP_FORCE = -400

func _ready() -> void:
	self.velocity = Vector2.ZERO
	self.up_direction = Vector2.UP

func _physics_process(_delta):
	self.velocity.y += GRAVITY
	var x_input_raw = Input.get_axis("ui_left", "ui_right")

	self.velocity.x = x_input_raw.normalized().x * SPEED
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		self.velocity.y = JUMP_FORCE
	move_and_slide()
	get_last_slide_collision()
