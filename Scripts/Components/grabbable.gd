class_name GrabableComponent extends Area2D

signal grabbed 
signal thrown

@export var object_root_node: Node
# DEFINITELY CHANGE THIS
var container_node: Node

var is_grabbed: bool = false

var grabber_component: GrabberComponent

func _ready() -> void:
	container_node = object_root_node.get_parent()


func attempt_grab(passed_grabber_component: GrabberComponent):
	grabber_component = passed_grabber_component
	is_grabbed = true
	# maybe change to reparent
	object_root_node.reparent(grabber_component.grab_point)
	grabbed.emit()


func attempt_throw(inherit_throw_velocity):
	thrown.emit(inherit_throw_velocity)
	
	# maybe change to reparent
	object_root_node.reparent(container_node)
	
	
	is_grabbed = false
	grabber_component = null
	print("attempt throw completed")
	

func get_grabber_position(current_position: Vector2) -> Vector2:
	# print("got grab point position")
	if grabber_component == null:
		return current_position
	return grabber_component.grab_point.global_position
	
