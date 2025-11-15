extends Node2D

@onready var PLAYER := $"../Player"
@onready var LARGE_ASTEROID := preload("res://scenes/asteroids/asteroid_large.tscn");
@onready var MEDIUM_ASTEROID := preload("res://scenes/asteroids/asteroid_medium.tscn");
@onready var SMALL_ASTEROID := preload("res://scenes/asteroids/asteroid_small.tscn");
@onready var SPAWN_LOCATION := $SpawnPath/SpawnLocation
@onready var TARGET_POSITION := $TargetPath/TargetPosition
@onready var TIMER : Timer = $Timer;

func spawn_large_asteroid():
	var asteroid_instance = LARGE_ASTEROID.instantiate();
	SPAWN_LOCATION.progress_ratio = randf();
	TARGET_POSITION.progress_ratio = randf();
	asteroid_instance.position = SPAWN_LOCATION.position;
	asteroid_instance.look_at(TARGET_POSITION.global_position);
	add_child(asteroid_instance);

func _on_asteroid_destroyed(asteroid):
	var queued_asteroid = null
	
	if asteroid.size == asteroid.ASTEROID_SIZE.LARGE:
		queued_asteroid = MEDIUM_ASTEROID
	elif asteroid.size == asteroid.ASTEROID_SIZE.MEDIUM:
		queued_asteroid = SMALL_ASTEROID
	else:
		# Small asteroids don't spawn anything
		despawn(asteroid)
		return
	
	for i in 2:
		var queued_instance = queued_asteroid.instantiate()
		queued_instance.position = asteroid.position
		queued_instance.rotation = asteroid.rotation + randf_range(-0.6, 0.6)
		call_deferred("add_child", queued_instance);
		GLOBAL_VARIABLES.asteroid_count += 1
	
	despawn(asteroid)

func despawn(asteroid):
	GLOBAL_VARIABLES.asteroid_count -= 1
	asteroid.queue_free()

func _on_timer_timeout() -> void:
	if GLOBAL_VARIABLES.asteroid_count < GLOBAL_VARIABLES.asteroid_limit:
		#print("Asteroids can be instantiated.");
		spawn_large_asteroid();
		GLOBAL_VARIABLES.asteroid_count += 1;
		#print("Asteroid Count: " + str(GLOBAL_VARIABLES.asteroid_count));
	else:
		#print("Asteroid limit reached: asteroids cannot be instantiated.");
		return
