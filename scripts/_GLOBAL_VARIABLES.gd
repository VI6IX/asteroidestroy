extends Node

@export var PLAYER_LIVES : int = 4;
@export var asteroid_limit : int = 5;
@export var asteroid_count : int = 0;

signal increment_score(amount)

func _ready() -> void:
	increment_score.connect(on_score_increment);
	pass

func on_score_increment(amount):
	#print("SCORE INCREMENTED FROM " + str(score) + " TO " + str(score + amount));
	score += amount;

@onready var score : int = 0;
