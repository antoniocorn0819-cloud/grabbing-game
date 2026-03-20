class_name HitboxComponent extends Area2D




signal hit

@export var collision_shape: CollisionShape2D

@export var health_component: HealthComponent
@export var movement_component: MovementInterface

@export var default_color: Constants.Type
var current_color: Constants.Type

func _ready():
	# big hmmm
	current_color = default_color

func recieve_damage(damage_amount: int):
	health_component.take_raw_damage(damage_amount)
