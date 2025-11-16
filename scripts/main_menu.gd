extends Control

@onready var game_buttons := %"Game Buttons"
@onready var quit_confirmation := %"Quit Confirmation"

func _ready() -> void:
	quit_confirmation.visible = false;

func _on_play_button_pressed() -> void:
	print("PLAY BUTTON PRESSED")
	get_tree().change_scene_to_file("res://scenes/game.tscn");

func _on_quit_button_pressed() -> void:
	print("QUIT BUTTON PRESSED")
	# "are you sure?" panel
	game_buttons.visible = false;
	quit_confirmation.visible = true;

func _on_yes_pressed() -> void:
	get_tree().quit();

func _on_no_pressed() -> void:
	quit_confirmation.visible = false;
	game_buttons.visible = true;
