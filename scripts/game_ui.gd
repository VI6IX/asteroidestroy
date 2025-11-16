extends Control

@onready var score_value : Label = %"Score Value"
@onready var lives_value: Label = %"Lives Value"

func _process(_delta: float) -> void:
	score_value.text = str(GLOBAL_VARIABLES.score);
	lives_value.text = str(GLOBAL_VARIABLES.PLAYER_LIVES);
	if GLOBAL_VARIABLES.PLAYER_LIVES <= 0:
		GLOBAL_VARIABLES.PLAYER_LIVES = 0;
