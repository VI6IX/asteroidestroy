extends Area2D

@export var parent = Node2D;
@export var health : int;

signal has_collided
signal health_depleted(parent)

func contact_damage(_area: Area2D) -> void:
	#print(str(parent.name) + " has collided with " + str(_area.name));
	has_collided.emit();
	deplete_health();

func deplete_health():
	health -= 1;
	#print(str(parent.name) + "'s HEALTH has been reduced to " + str(get_health_value()));	
	health_depleted.emit(parent);
	if health <= 0:
		health = 0;
		#print(str(parent.name) + "'s HEALTH is zero and cannot be depleted any further.");

func get_health_value():
	return health;
