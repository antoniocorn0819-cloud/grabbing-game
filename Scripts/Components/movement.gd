class_name MovementComponent extends Node


@export var body: CharacterBody2D
@export var collision_shape: CollisionShape2D


var delta_local: float = 0

func update_movement(delta: float) -> void:
	delta_local = delta
	body.move_and_slide()
	
