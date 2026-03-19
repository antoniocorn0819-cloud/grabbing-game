extends Node

@export var jawn_root_node: Node

@export var movement_component: MovementComponent
@export var gravity_component: GravityComponent
@export var grabable_component: GrabableComponent
@export var hitbox_component: HitboxComponent
@export var health_component: HealthComponent


enum States {
	Free,
	Grabbed
}

var current_state: States = States.Free

func _ready():
	grabable_component.grabbed.connect(grab_on_handler)
	grabable_component.thrown.connect(grab_off_handler)
	health_component.death.connect(death_handler)

func death_handler():
	# do more later
	jawn_root_node.queue_free()

func _physics_process(delta: float) -> void:
	if current_state == States.Free:
		gravity_component.update_gravity()
		movement_component.update_movement(delta)
	elif current_state == States.Grabbed:
		pass
		# print("jawn in grab state")
		# movement_component.body.global_position = grabable_component.get_grabber_position(movement_component.body.global_position)



func grab_on_handler():
	current_state = States.Grabbed
	# make universal?
	movement_component.collision_shape.disabled = true
	hitbox_component.collision_shape.disabled = true
	# definitely make this universal somehow
	# call_deferred("grab_on_deffered")

# this is so janky rn but it doesnt even work
func grab_on_deffered():
	movement_component.body.global_position = grabable_component.get_grabber_position(movement_component.body.global_position)


func grab_off_handler(inherit_throw_velocity):
	current_state = States.Free
	movement_component.body.velocity = inherit_throw_velocity
	movement_component.collision_shape.disabled = false
	hitbox_component.collision_shape.disabled = false
	print("jawn grab off handler ran")
