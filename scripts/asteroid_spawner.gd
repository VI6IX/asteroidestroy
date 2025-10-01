extends Node2D

@onready var PLAYER := $"../Player"
@onready var ASTEROID := preload("res://scenes/asteroid.tscn");
@onready var SPAWN_LOCATION := $SpawnPath/SpawnLocation
@onready var TARGET_POSITION := $TargetPath/TargetPosition
@onready var TIMER : Timer = $Timer;

@export var asteroid_limit : int = 2;
@export var asteroid_count : int = 0;

func Instantiate_Asteroid():
	var asteroid_instance = ASTEROID.instantiate();
	SPAWN_LOCATION.progress_ratio = randf();
	TARGET_POSITION.progress_ratio = randf();
	asteroid_instance.position = SPAWN_LOCATION.position;
	asteroid_instance.rotation = randf_range(-360, 360);
	asteroid_instance.look_at(TARGET_POSITION.global_position);
	add_child(asteroid_instance);
	pass

func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if asteroid_count < asteroid_limit:
		print("Asteroids can be instantiated.");
		Instantiate_Asteroid();
		asteroid_count += 1;
	else:
		print("Asteroid limit reached: asteroids cannot be instantiated.");
		return
