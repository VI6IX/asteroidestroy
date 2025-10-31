extends Node2D

#Access to parent
#Access to parent's health
#Access to asteroid that will be instantiated
@export var parent := CharacterBody2D;
@onready var next_asteroid := preload("res://scenes/asteroid_medium.tscn");
var parent_health : int;

func instantiate_asteroid():
	var asteroid_instance = next_asteroid.instantiate();
	add_child(asteroid_instance);

func _process(_delta: float) -> void:
	parent_health = parent.health;
	
