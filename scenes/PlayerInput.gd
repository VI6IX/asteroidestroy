extends CharacterBody2D

@export var Raycast : RayCast2D;
@export var PAN_SPEED : float = 5;
@export var THRUST_FORCE : float = 800;
@export var MAX_SPEED : float = 800;
@export var DECELERATION_RATE : float = 5;

func pan(delta) -> void:
	var PAN_DIRECTION : float = 0;
	if Input.is_action_pressed("pan_Left"):
		print("pan_Left input pressed");
		PAN_DIRECTION -= 1;
	
	if Input.is_action_pressed("pan_Right"):
		print("pan_Right input pressed");
		PAN_DIRECTION += 1;
	
	# Increments the rotation (under Node2D Transform) by PAN_DIRECTION (-1 or 1) at the rate of
	# PAN_SPEED times delta
	rotation += PAN_DIRECTION * PAN_SPEED * delta;

func thrust():
	if Input.is_action_pressed("thrust"):
		velocity = transform.x * THRUST_FORCE;

func decelerate():
	if !Input.is_action_pressed("thrust"):
		velocity = velocity.move_toward(Vector2.ZERO, DECELERATION_RATE);

func shoot() -> void:
	if Input.is_action_pressed("shoot"):
		print("shoot input pressed")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pan(delta);
	thrust();
	decelerate();
	shoot();
	move_and_slide();
