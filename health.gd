class_name HealthComponent extends Node

signal death

@export var health:int = 3


func take_raw_damage(damage_amount: int):
	health -= damage_amount
	if health <= 0:
		death.emit()
		print("died")
