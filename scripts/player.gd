extends CharacterBody2D

@onready var Marker : Marker2D = $Marker2D;
@onready var timer : Timer = $Timer;
@onready var particles_thrust : Node2D = %particles_thrust.get_child(0);
@onready var sfx_thrust : AudioStreamPlayer2D = $sfx_thrust;
@onready var BULLET := preload("res://scenes/bullet.tscn");

@export var PAN_SPEED : float = 5;
@export var ACCELERATION : Vector2;
@export var THRUST_FORCE : float = 800;
@export var MAX_SPEED : float = 800;
@export var DECELERATION_RATE : float = 5;
@export var FIRE_RATE : float = 0.25;

var can_shoot : bool = true;

func pan(delta) -> void:
	var PAN_DIRECTION : float = 0;
	if Input.is_action_pressed("pan_Left"):
		#print("pan_Left input pressed");
		PAN_DIRECTION -= 1;
	
	if Input.is_action_pressed("pan_Right"):
		#print("pan_Right input pressed");
		PAN_DIRECTION += 1;
	# Increments the rotation (under Node2D Transform) by PAN_DIRECTION (-1 or 1) at the rate of
	# PAN_SPEED times delta
	rotation += PAN_DIRECTION * PAN_SPEED * delta;

func thrust(delta):
	ACCELERATION = Vector2.ZERO;
	if Input.is_action_pressed("thrust"):
		ACCELERATION = transform.x * THRUST_FORCE * delta;
		velocity += ACCELERATION;
		particles_thrust.set_emitting(true);
		sfx_thrust.play();
		#sfx_thrust_pitch_variation();
		if velocity.length() >= MAX_SPEED:
			velocity = velocity.limit_length(MAX_SPEED);

func decelerate():
	if !Input.is_action_pressed("thrust"):
		velocity = velocity.move_toward(Vector2.ZERO, DECELERATION_RATE);
		particles_thrust.set_emitting(false);

func instantiate_bullet():
	var bullet_instance = BULLET.instantiate();
	owner.add_child(bullet_instance);
	bullet_instance.transform = Marker.global_transform;

func shoot() -> void:
	if Input.is_action_pressed("shoot") and can_shoot == true:
		instantiate_bullet();
		can_shoot = false;
		timer.start(FIRE_RATE);

func _ready() -> void:
	timer.wait_time = FIRE_RATE;

func _process(delta: float) -> void:
	pan(delta);
	thrust(delta);
	decelerate();
	shoot();
	move_and_slide();

func _on_timer_timeout() -> void:
	can_shoot = true;
