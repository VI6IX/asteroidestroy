extends CharacterBody2D

@onready var SCREEN := get_viewport_rect();
@onready var wrap_Timer : Timer = $wrap_timer;
@onready var COMPONENT_WRAP := $component_wrap;

@export var SPEED : float = 100;
@export var MAX_SPEED : float = 200;

func _ready() -> void:
	COMPONENT_WRAP.can_wrap = false;
	print(str(COMPONENT_WRAP.can_wrap));

func _process(delta: float) -> void:
	if velocity.length() < MAX_SPEED:
		velocity += transform.x * SPEED * delta;
	else:
		velocity = velocity.limit_length(MAX_SPEED);
	move_and_slide();

func _on_wrap_timer_timeout() -> void:
	COMPONENT_WRAP.can_wrap = true;
