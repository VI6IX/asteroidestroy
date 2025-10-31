extends CharacterBody2D

@export var SPEED : float = 200;

func _process(_delta: float) -> void:
	velocity += transform.x * SPEED;
	if velocity.length() >= SPEED:
		velocity = velocity.limit_length(SPEED);
	move_and_slide();
