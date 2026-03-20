class_name CharacterMovementComponent extends MovementInterface


@export var body: CharacterBody2D

@export var calculation_mass: float = 1

func update_movement(delta: float) -> void:
	delta_local = delta
	body.move_and_slide()

func add_velocity(velocity_vector: Vector2):
	body.velocity += velocity_vector

func apply_impulse(impulse_vector: Vector2):
	body.velocity += impulse_vector / calculation_mass

func set_velocity(velocity_vector: Vector2):
	body.velocity = velocity_vector

func set_velocity_x(value: float):
	body.velocity.x = value

func set_velocity_y(value: float):
	body.velocity.y = value
