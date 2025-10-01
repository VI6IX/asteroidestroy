extends CharacterBody2D

@onready var SCREEN := get_viewport_rect();

@export var SPEED : float = 100;
@export var MAX_SPEED : float = 200;

func Destroy_Offscreen():
	pass

func _process(delta: float) -> void:
	if velocity.length() < MAX_SPEED:
		velocity += transform.x * SPEED * delta;
	else:
		velocity = velocity.limit_length(MAX_SPEED);
	move_and_slide();

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free();
	GLOBAL_VARIABLES.asteroid_count -= 1;
	print("Off-screen asteroid destroyed; asteroid count reduced to " + str(GLOBAL_VARIABLES.asteroid_count));
