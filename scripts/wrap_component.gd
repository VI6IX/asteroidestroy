extends Node

@export var COMPONENT_PARENT : Node2D;

func horizontal_wrap():
	if COMPONENT_PARENT.position.x > (1152.0 + COMPONENT_PARENT.scale.x):
		print(str(COMPONENT_PARENT.name) + " has passed the right screen boundary");
		COMPONENT_PARENT.position.x = -1151.0;
	if COMPONENT_PARENT.position.x < -(1152.0 - COMPONENT_PARENT.scale.x):
		print(str(COMPONENT_PARENT.name) + " has passed the left screen boundary");
		COMPONENT_PARENT.position.x = 1151.0;

func vertical_wrap():
	if COMPONENT_PARENT.position.y < -(648.0 + COMPONENT_PARENT.scale.y):
		print(str(COMPONENT_PARENT.name) + " has passed the upper screen boundary");
		COMPONENT_PARENT.position.y = 647.0;
	if COMPONENT_PARENT.position.y > (648.0 + COMPONENT_PARENT.scale.y):
		print(str(COMPONENT_PARENT.name) + " has passed the lower screen boundary");
		COMPONENT_PARENT.position.y = -647.0;

func _process(_delta: float) -> void:
	horizontal_wrap();
	vertical_wrap();
