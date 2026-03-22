class_name SpawnerComponent extends Node

@export var scene: PackedScene

var cooldown: float = 2
var on_cooldown: bool = true
var temp_cooldown: float = cooldown
	
func instantiator() -> Node:
	return scene.instantiate()

func add_to_container(n: Node) -> void:
	get_tree().add_child(n)
	
func _process(delta: float) -> void:
	if on_cooldown:
		temp_cooldown -= delta
	if(temp_cooldown < 0):
		on_cooldown = false
		temp_cooldown = cooldown
