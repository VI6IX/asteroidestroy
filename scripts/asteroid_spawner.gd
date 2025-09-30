extends Node2D

@onready var ASTEROID := preload("res://scenes/asteroid.tscn");

@export var asteroid_limit : int = 2;
@export var asteroid_count : int = 0;


func Instantiate_Asteroid():
	var asteroid_instance = ASTEROID.instantiate();
	add_child(asteroid_instance);
	pass

func _ready() -> void:
	Instantiate_Asteroid();

func _process(_delta: float) -> void:
	pass
