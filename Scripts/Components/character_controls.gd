class_name CharacterControls extends Node

@export var movement: MovementComponent

@export var jump_magnitude: float = -600
@export var horizontal_speed: float = 30000

func attempt_jump() -> void:
	if movement.body.is_on_floor():
		movement.body.velocity.y = jump_magnitude 

func attempt_horizontal_movement(direction: float) -> void:
	movement.body.velocity.x = horizontal_speed * movement.delta_local * direction
