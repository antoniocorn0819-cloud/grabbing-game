extends Node

@export var hurtbox_component: HurtboxComponent
@export var health_component: HealthComponent

@export var root_node: Node

func _ready():
	hurtbox_component.attack.connect(per_attack)
	hurtbox_component.attack_response.connect(on_attack)
	health_component.death.connect(death_manager)
	hurtbox_component.area_entered.connect(on_hurtbox_entered)

func on_hurtbox_entered(body):
	hurtbox_component.initiate_hurt()

func per_attack(hitbox: HitboxComponent):
	hitbox.recieve_damage(1)

func on_attack():
	health_component.take_raw_damage(1)

func death_manager():
	root_node.queue_free()
