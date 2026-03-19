class_name HitboxComponent extends Area2D




signal hit

@export var collision_shape: CollisionShape2D

@export var health_component: HealthComponent
@export var movement_component: MovementComponent

func recieve_damage(damage_amount: int):
	health_component.take_raw_damage(damage_amount)
