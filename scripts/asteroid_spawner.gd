extends Node2D

@onready var ASTEROID := preload("res://scenes/asteroid.tscn");
@onready var TIMER : Timer = $Timer;

@export var asteroid_limit : int = 2;
@export var asteroid_count : int = 0;

func Instantiate_Asteroid():
	var asteroid_instance = ASTEROID.instantiate();
	add_child(asteroid_instance);
	pass

func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if asteroid_count < asteroid_limit:
		print("Asteroids can be instantiated.");
		Instantiate_Asteroid();
	else:
		print("Asteroid limit reached: asteroids cannot be instantiated.");
