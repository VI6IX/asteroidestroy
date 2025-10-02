extends Node2D

@onready var PLAYER := $"../Player"
@onready var ASTEROID := preload("res://scenes/asteroid.tscn");
@onready var SPAWN_LOCATION := $SpawnPath/SpawnLocation
@onready var TARGET_POSITION := $TargetPath/TargetPosition
@onready var TIMER : Timer = $Timer;

func Instantiate_Asteroid():
	var asteroid_instance = ASTEROID.instantiate();
	SPAWN_LOCATION.progress_ratio = randf();
	TARGET_POSITION.progress_ratio = randf();
	asteroid_instance.position = SPAWN_LOCATION.position;
	asteroid_instance.look_at(TARGET_POSITION.global_position);
	add_child(asteroid_instance);

func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if GLOBAL_VARIABLES.asteroid_count < GLOBAL_VARIABLES.asteroid_limit:
		#print("Asteroids can be instantiated.");
		Instantiate_Asteroid();
		GLOBAL_VARIABLES.asteroid_count += 1;
		#print("Asteroid Count: " + str(GLOBAL_VARIABLES.asteroid_count));
	else:
		#print("Asteroid limit reached: asteroids cannot be instantiated.");
		return
