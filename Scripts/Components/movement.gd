@abstract
class_name MovementInterface extends Node


@export var collision_shape: CollisionShape2D

var delta_local: float = 0

@abstract
func update_movement(delta: float) -> void

@abstract
func add_velocity(velocity_vector: Vector2)

@abstract
func apply_impulse(impulse_vector: Vector2) -> void

@abstract
func set_velocity(velocity_vector: Vector2)

@abstract
func set_velocity_y(value: float)

@abstract
func set_velocity_x(value: float)
