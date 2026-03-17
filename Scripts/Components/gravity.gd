class_name GravityComponent   extends Node

@export var movement_component: MovementComponent

@export var gravity_vector: Vector2 = Vector2(0, 1000)

func update_gravity():
	if !movement_component.body.is_on_floor():
		movement_component.body.velocity += gravity_vector * movement_component.delta_local
