extends Node2D

@export var COMPONENT_PARENT : Node2D;
@onready var SCREEN_SIZE = get_viewport_rect().size;

func horizontal_wrap():
	if COMPONENT_PARENT.position.x > (SCREEN_SIZE.x + COMPONENT_PARENT.scale.x):
		print(str(COMPONENT_PARENT.name) + " has passed the right screen boundary");
		COMPONENT_PARENT.position.x = -SCREEN_SIZE.x + 1;
	if COMPONENT_PARENT.position.x < -(SCREEN_SIZE.x - COMPONENT_PARENT.scale.x):
		print(str(COMPONENT_PARENT.name) + " has passed the left screen boundary");
		COMPONENT_PARENT.position.x = SCREEN_SIZE.x - 1;

func vertical_wrap():
	if COMPONENT_PARENT.position.y < -(SCREEN_SIZE.y + COMPONENT_PARENT.scale.y):
		print(str(COMPONENT_PARENT.name) + " has passed the upper screen boundary");
		COMPONENT_PARENT.position.y = SCREEN_SIZE.y - 1;
	if COMPONENT_PARENT.position.y > (SCREEN_SIZE.y + COMPONENT_PARENT.scale.y):
		print(str(COMPONENT_PARENT.name) + " has passed the lower screen boundary");
		COMPONENT_PARENT.position.y = -SCREEN_SIZE.y - 1;

func _process(_delta: float) -> void:
	horizontal_wrap();
	vertical_wrap();
