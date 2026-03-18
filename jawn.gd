extends Node


@export var movement_component: MovementComponent
@export var gravity_component: GravityComponent
@export var grabable_component: GrabableComponent

enum States {
	Free,
	Grabbed
}

var current_state: States = States.Free

func _ready():
	grabable_component.grabbed.connect(grab_on_handler)
	grabable_component.thrown.connect(grab_off_handler)

func _physics_process(delta: float) -> void:
	if current_state == States.Free:
		gravity_component.update_gravity()
		movement_component.update_movement(delta)
	elif current_state == States.Grabbed:
		print("jawn in grab state")
		movement_component.body.position = grabable_component.get_grabber_position()

func grab_on_handler():
	current_state = States.Grabbed
	# make universal?
	movement_component.collision_shape.disabled = true

func grab_off_handler():
	current_state = States.Free
	# make universal?
	movement_component.collision_shape.disabled = false
