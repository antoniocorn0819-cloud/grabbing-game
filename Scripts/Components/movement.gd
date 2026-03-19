class_name MovementComponent extends Node


@export var body: CharacterBody2D
@export var collision_shape: CollisionShape2D
@export var mass: float = 1

var delta_local: float = 0

func update_movement(delta: float) -> void:
	delta_local = delta
	body.move_and_slide()

func apply_impulse(impulse_vector: Vector2):
	body.velocity += impulse_vector / mass
