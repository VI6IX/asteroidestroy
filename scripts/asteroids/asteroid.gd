extends CharacterBody2D

@onready var component_damage = $component_damage
@onready var asteroid_spawner = get_tree().get_first_node_in_group("AsteroidSpawner")

@export var SPEED : float = 200;
enum ASTEROID_SIZE {LARGE, MEDIUM, SMALL}
@export var size : ASTEROID_SIZE

func _ready() -> void:
	component_damage.health_depleted.connect(asteroid_spawner._on_asteroid_destroyed);
	# Connects the asteroid's component_damage's health_depleted signal to the asteroid spawner's
	# _on_asteroid_destroyed() function

func _process(_delta: float) -> void:
	velocity += transform.x * SPEED;
	if velocity.length() >= SPEED:
		velocity = velocity.limit_length(SPEED);
	move_and_slide();
