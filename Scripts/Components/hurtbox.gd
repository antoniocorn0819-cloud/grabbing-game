class_name HurtboxComponent extends Area2D

signal hitbox_found
signal hit_box



@export var collision_shape: CollisionShape2D

@export var default_color: Constants.Type
var current_color: Constants.Type

func _ready():
	# big hmmm
	current_color = default_color

func initiate_hurt() -> void:
	# add cooldows and such
	print("initiating hurt")
	print(get_overlapping_areas())
	
	var collision_items: Array[HitboxComponent]
	
	for item in get_overlapping_areas():
		print(item.current_color)
		if item.current_color == Constants.Type.Neutral:
			collision_items.append(item)
		if item.current_color != current_color:
			collision_items.append(item)
	
	print(collision_items)
	if collision_items.size() > 0 :
		# print("objects found")
		hit_box.emit()
		for hitbox in collision_items:
			hitbox_found.emit(hitbox)
			hitbox.hit.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
