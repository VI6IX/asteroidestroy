extends CharacterBody2D

@export var SPEED : float = 100;
@export var MAX_SPEED : float = 500;

func _process(delta: float) -> void:
	if velocity.length() < MAX_SPEED:
		velocity += transform.x * SPEED * delta;
	else:
		velocity = velocity.limit_length(MAX_SPEED);
	move_and_slide();
