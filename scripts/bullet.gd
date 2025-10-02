extends CharacterBody2D

@export var BULLET_SPEED : float = 2000;

func _process(_delta: float) -> void:
	if velocity.length() < BULLET_SPEED:
		velocity = transform.x * BULLET_SPEED;
	else:
		velocity = velocity.limit_length(BULLET_SPEED);
	move_and_slide();
