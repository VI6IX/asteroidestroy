extends Node2D

@export var player : CharacterBody2D;
@onready var respawnTimer : Timer = $respawnTimer;
@onready var particles_explosion : Node2D = %particles_explosion.get_child(0);
@onready var sfx_explosion : AudioStreamPlayer2D = %sfx_explosion;
@onready var LIVES : int;

var is_vulnerable = true;
var game_over = false;

func handle_respawn():
	if player.can_respawn == true and is_vulnerable == true and LIVES != 0:
		print("PLAYER CAN RESPAWN! | " + str(LIVES) + " LIVES");
		player.can_respawn = false;
		is_vulnerable = false;
		
		deactivate_player();
		
		respawnTimer.start();
	elif LIVES <= 0:
		player.can_respawn = false;
		game_over = true;
		print("GAME OVER!");
		deactivate_player();
		return

func deactivate_player():
	player.set_process(false);
	player.visible = false;
	sfx_explosion.play();
	sfx_explosion.set_pitch_scale(randf_range(0.8, 1.5));
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
	if game_over == false:
		handle_respawn();
	else:
		return;

func _on_respawn_timer_timeout() -> void:
	activate_player();
	print("PLAYER RESPAWNED");
