extends Control

func _on_play_button_pressed() -> void:
	print("PLAY BUTTON PRESSED")
	get_tree().change_scene_to_file("res://scenes/game.tscn");

func _on_quit_button_pressed() -> void:
	print("QUIT BUTTON PRESSED")
	# "are you sure?" panel
	get_tree().quit();
