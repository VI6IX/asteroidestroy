extends Node2D

@export var PARENT : Node2D;

func _on_area_entered(area: Area2D) -> void:
	print(str(PARENT.name) + " has collided with " + str(area.name));
	PARENT.queue_free();
