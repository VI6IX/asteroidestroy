extends Area2D

@export var BULLET_SPEED : float = 1500;

func _physics_process(delta: float) -> void:
	position += transform.x * BULLET_SPEED * delta;

func _on_timer_timeout() -> void:
	queue_free();

func _on_component_damage_has_collided() -> void:
	queue_free();
