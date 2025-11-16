extends Node2D

@onready var PLAYER := $"../Player"
@onready var LARGE_ASTEROID := preload("res://scenes/asteroids/asteroid_large.tscn");
@onready var MEDIUM_ASTEROID := preload("res://scenes/asteroids/asteroid_medium.tscn");
@onready var SMALL_ASTEROID := preload("res://scenes/asteroids/asteroid_small.tscn");
@onready var SPAWN_LOCATION := $SpawnPath/SpawnLocation
@onready var TARGET_POSITION := $TargetPath/TargetPosition
@onready var TIMER : Timer = $Timer;
@onready var sfx_destruction: AudioStreamPlayer2D = $sfx_destruction


@export var SMALL_SCORE : int = 200;
@export var LARGE_SCORE : int = 50;
@export var MEDIUM_SCORE : int = 100;

func spawn_large_asteroid():
	var asteroid_instance = LARGE_ASTEROID.instantiate();
	SPAWN_LOCATION.progress_ratio = randf();
	TARGET_POSITION.progress_ratio = randf();
	asteroid_instance.position = SPAWN_LOCATION.position;
	asteroid_instance.look_at(TARGET_POSITION.global_position);
	add_child(asteroid_instance);

func _on_asteroid_destroyed(asteroid): # called on asteroid's component damage health_depleted signal
	# the asteroid parameter is the health_depleted's argument (the component's parent)
	var queued_asteroid = null
	var incremented_rotation = asteroid.rotation
	sfx_destruction.play();
	
	if asteroid.size == asteroid.ASTEROID_SIZE.LARGE:
		queued_asteroid = MEDIUM_ASTEROID
		#print("LARGE ASTEROID DESTROYED - ADDING " + str(LARGE_SCORE) + " TO SCORE!")
		GLOBAL_VARIABLES.on_score_increment(LARGE_SCORE);
	elif asteroid.size == asteroid.ASTEROID_SIZE.MEDIUM:
		queued_asteroid = SMALL_ASTEROID
		#print("MEDIUM ASTEROID DESTROYED - ADDING " + str(MEDIUM_SCORE) + " TO SCORE!")
		GLOBAL_VARIABLES.on_score_increment(MEDIUM_SCORE);
	else:
		#print("SMALL ASTEROID DESTROYED - ADDING " + str(SMALL_SCORE) + " TO SCORE!")
		GLOBAL_VARIABLES.on_score_increment(SMALL_SCORE);
		despawn(asteroid)
		return
	
		
	for i in 2:
		var queued_instance = queued_asteroid.instantiate()
		incremented_rotation += 0.5
		queued_instance.rotation = incremented_rotation;
		queued_instance.position = asteroid.position
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
