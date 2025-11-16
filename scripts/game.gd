extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn");
		GLOBAL_VARIABLES.asteroid_limit = 5;
		GLOBAL_VARIABLES.PLAYER_LIVES = 3;
		GLOBAL_VARIABLES.score = 0;
