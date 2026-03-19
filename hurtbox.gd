class_name HurtboxComponent extends Area2D

signal hitbox_found
signal hit_box

func initiate_hurt() -> void:
	# add cooldows and such
	print("initiating hurt")
	print(get_overlapping_bodies())
	if get_overlapping_areas().size() > 0 :
		print("objects found")
		hit_box.emit()
		for hitbox in get_overlapping_areas():
			hitbox_found.emit(hitbox)
			hitbox.hit.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
