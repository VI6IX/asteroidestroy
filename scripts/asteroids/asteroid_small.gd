extends CharacterBody2D

@onready var SCREEN := get_viewport_rect();
@onready var COMPONENT_WRAP := $component_wrap;

@export var SPEED : float = 400;

func _process(_delta: float) -> void:
	velocity += transform.x * SPEED;
	if velocity.length() >= SPEED:
		velocity = velocity.limit_length(SPEED);
	move_and_slide();
