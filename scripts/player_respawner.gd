extends Node2D

@export var player : CharacterBody2D;

func _process(_delta: float) -> void:
	if player.can_respawn == true and player.get_health() != 0:
		player.can_respawn = false;
		print("player can respawn");
		print(str(player.can_respawn))
	elif player.get_health() == 0:
		print("GAME OVER!");
	else:
		return;
