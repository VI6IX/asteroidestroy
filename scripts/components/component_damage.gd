extends Area2D

@export var parent = Node2D;
@export var health : int;

signal has_collided

func contact_damage(area: Area2D) -> void:
	print(str(parent.name) + " has collided with " + str(area.name));
	has_collided.emit();
