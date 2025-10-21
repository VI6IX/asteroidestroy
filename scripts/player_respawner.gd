extends Node2D

@export var player : CharacterBody2D;
@onready var respawnTimer : Timer = $respawnTimer;

@onready var LIVES : int;

func _process(_delta: float) -> void:
	LIVES = player.get_health();
	if player.can_respawn == true and LIVES != 0:
		print("PLAYER CAN RESPAWN!");
		print(LIVES);
		player.can_respawn = false;
		respawnTimer.start();
	elif LIVES == 0:
		print("GAME OVER!");
	else:
		return;

func _on_respawn_timer_timeout() -> void:
	print("PLAYER RESPAWN");
