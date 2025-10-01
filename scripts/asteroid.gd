extends RigidBody2D

@onready var PLAYER := $"../Player";

func _ready() -> void:
	position.move_toward(PLAYER.global_position, 1);
