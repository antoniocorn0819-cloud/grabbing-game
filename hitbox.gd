class_name HitboxComponent extends Area2D


signal hit

@export var health_component: HealthComponent

func recieve_damage(damage_amount: int):
	health_component.take_raw_damage(damage_amount)
