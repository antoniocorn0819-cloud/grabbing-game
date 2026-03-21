class_name HurtboxComponent extends Area2D

signal attack_response
signal attack



@export var collision_shape: CollisionShape2D

@export var ignore_list: Array[HitboxComponent]
@export var damage_types: Array[Constants.DamageTypes]

@export var default_color: Constants.Colors
var current_color: Constants.Colors



func _ready():
	# big hmmm
	current_color = default_color

func initiate_hurt() -> void:
	# add cooldows and such
	print("initiating hurt")
	
	var collision_items: Array[HitboxComponent]
	
	for item in get_overlapping_areas():
		print(item.current_color)
		# somehow this works
		if item in ignore_list:
			# skips rest
			continue
		for type in item.ignore_types:
			print("parsing through ignore types")
			print(item.ignore_types)
			print(damage_types)
			if type in damage_types:
				continue
		if item.current_color == Constants.Colors.Neutral:
			collision_items.append(item)
		if item.current_color != current_color:
			collision_items.append(item)
		
	print(collision_items)
	if collision_items.size() > 0 :
		# print("objects found")
		for hitbox in collision_items:
			attack.emit(hitbox)
			hitbox.hit.emit(self)
		attack_response.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
