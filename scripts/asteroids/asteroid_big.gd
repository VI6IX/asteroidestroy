extends CharacterBody2D

@onready var SCREEN := get_viewport_rect();
@onready var wrap_Timer : Timer = $wrap_timer;
@onready var COMPONENT_WRAP := $component_wrap;

@export var SPEED : float = 200;

func _ready() -> void:
	COMPONENT_WRAP.can_wrap = false;

func _process(_delta: float) -> void:
	velocity += transform.x * SPEED;
	if velocity.length() >= SPEED:
		velocity = velocity.limit_length(SPEED);
	move_and_slide();

func _on_wrap_timer_timeout() -> void:
	COMPONENT_WRAP.can_wrap = true;
