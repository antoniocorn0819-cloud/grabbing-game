class_name RigidMovementComponent extends MovementInterface


@export var body: RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_movement(delta: float) -> void:
	delta_local = delta

func add_velocity(velocity_vector: Vector2):
	body.linear_velocity += velocity_vector

func apply_impulse(impulse_vector: Vector2):
	body.linear_velocity += impulse_vector / body.mass

func set_velocity(velocity_vector: Vector2):
	body.linear_velocity = velocity_vector

func set_velocity_x(value: float):
	body.linear_velocity.x = value

func set_velocity_y(value: float):
	body.linear_velocity.y = value
