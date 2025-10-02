extends CharacterBody2D

@export var BULLET_SPEED : float = 500;
@export var MAX_SPEED : float = 1000;

func _process(delta: float) -> void:
	if velocity.length() < MAX_SPEED:
		velocity += transform.x * BULLET_SPEED * delta;
	else:
		velocity = velocity.limit_length(MAX_SPEED);
	move_and_slide();
