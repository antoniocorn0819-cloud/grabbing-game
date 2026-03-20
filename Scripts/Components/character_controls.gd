class_name CharacterControls extends Node

@export var movement: MovementInterface

@export var jump_magnitude: float = -600
@export var horizontal_speed: float = 30000

func attempt_jump() -> void:
	if movement.body.is_on_floor():
		movement.set_velocity_y(jump_magnitude)

func attempt_horizontal_movement(direction: float) -> void:
	movement.set_velocity_x(horizontal_speed * movement.delta_local * direction)
