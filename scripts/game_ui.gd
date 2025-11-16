extends Control

@onready var score_value : Label = %"Score Value"
@onready var lives_value: Label = %"Lives Value"
@onready var SCORE : int = GLOBAL_VARIABLES.score;
@onready var PLAYER_LIVES : int = GLOBAL_VARIABLES.PLAYER_LIVES;

func _process(_delta: float) -> void:
	score_value.text = str(SCORE);
