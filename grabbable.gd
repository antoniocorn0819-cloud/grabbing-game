class_name GrabableComponent extends Area2D

signal grabbed 
signal thrown

var is_grabbed: bool = false

var grabber_component: GrabberComponent

func attempt_grab(passed_grabber_component: GrabberComponent):
	grabber_component = passed_grabber_component
	is_grabbed = true
	grabbed.emit()

func attempt_throw(inherit_throw_velocity):
	thrown.emit(inherit_throw_velocity)
	is_grabbed = false
	grabber_component = null
	

func get_grabber_position() -> Vector2:
	print("got grab point position")
	return grabber_component.grab_point.global_position
	
