extends Node2D

@export var COMPONENT_PARENT : Node2D;
@onready var SCREEN_SIZE = get_viewport_rect().size;
@onready var timer : Timer = $Timer;
@export var wait_time : float = 1;

var can_wrap :bool = false;

func _ready() -> void:
	#if timer.wait_time <= 0:
		#timer.wait_time = 2;
	#else:
		#timer.wait_time = wait_time;
	print(str(COMPONENT_PARENT.name) + " ENTERED SCENE. TIMER STARTED.")
	print(wait_time)
	timer.start(wait_time);

func horizontal_wrap():
	if COMPONENT_PARENT.position.x > (SCREEN_SIZE.x + COMPONENT_PARENT.scale.x) and can_wrap == true:
		#print(str(COMPONENT_PARENT.name) + " has passed the right screen boundary");
		COMPONENT_PARENT.position.x = -SCREEN_SIZE.x + 1;
	if COMPONENT_PARENT.position.x < -(SCREEN_SIZE.x - COMPONENT_PARENT.scale.x) and can_wrap == true:
		#print(str(COMPONENT_PARENT.name) + " has passed the left screen boundary");
		COMPONENT_PARENT.position.x = SCREEN_SIZE.x - 1;

func vertical_wrap():
	if COMPONENT_PARENT.position.y < -(SCREEN_SIZE.y + COMPONENT_PARENT.scale.y) and can_wrap == true:
		#print(str(COMPONENT_PARENT.name) + " has passed the upper screen boundary");
		COMPONENT_PARENT.position.y = SCREEN_SIZE.y - 1;
	if COMPONENT_PARENT.position.y > (SCREEN_SIZE.y + COMPONENT_PARENT.scale.y) and can_wrap == true:
		#print(str(COMPONENT_PARENT.name) + " has passed the lower screen boundary");
		COMPONENT_PARENT.position.y = -SCREEN_SIZE.y - 1;

func _process(_delta: float) -> void:
	horizontal_wrap();
	vertical_wrap();

func _on_timer_timeout() -> void:
	can_wrap = true;
	print("TIMER ENDED; " + str(COMPONENT_PARENT.name) + " CAN WRAP");
