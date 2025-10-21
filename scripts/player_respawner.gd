extends Node2D

@export var player : CharacterBody2D;
@onready var respawnTimer : Timer = $respawnTimer;

@onready var LIVES : int;

func _process(_delta: float) -> void:
	LIVES = GLOBAL_VARIABLES.PLAYER_LIVES;
	if player.can_respawn == true and LIVES != 0:
		print("PLAYER CAN RESPAWN! | " + str(LIVES) + " LIVES");
		player.can_respawn = false;
		respawnTimer.start();
	elif LIVES == 0:
		player.can_respawn = false;
		print("GAME OVER!");
		return;

func _on_respawn_timer_timeout() -> void:
	print("PLAYER RESPAWN");
