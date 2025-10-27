extends Node2D

@export var player : CharacterBody2D;
@onready var respawnTimer : Timer = $respawnTimer;
@onready var particles_explosion : Node2D = %particles_explosion.get_child(0);

@onready var LIVES : int;

var is_vulnerable = true;

func handle_respawn():
	if player.can_respawn == true and is_vulnerable == true and LIVES != 0:
		print("PLAYER CAN RESPAWN! | " + str(LIVES) + " LIVES");
		player.can_respawn = false;
		is_vulnerable = false;
		
		deactivate_player();
		
		respawnTimer.start();
	elif LIVES == 0:
		print("GAME OVER!");
		player.set_process(false);
		player.visible = false;
		particles_explosion.position = player.position;
		particles_explosion.set_emitting(true);
		return;

func deactivate_player():
	player.set_process(false);
	player.visible = false;
	particles_explosion.position = player.position;
	particles_explosion.set_emitting(true);

func activate_player():
	is_vulnerable = true;
	player.visible = true;
	player.velocity = Vector2.ZERO;
	player.position = Vector2.ZERO;
	# set_process() activates or deactivates the node's _process() function.
	player.set_process(true);

func _process(_delta: float) -> void:
	LIVES = GLOBAL_VARIABLES.PLAYER_LIVES;
	handle_respawn();

func _on_respawn_timer_timeout() -> void:
	activate_player();
	print("PLAYER RESPAWNED");
