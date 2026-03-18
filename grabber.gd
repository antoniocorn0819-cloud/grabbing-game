class_name GrabberComponent extends Node

@export var grab_box: Area2D
@export var grab_point: Node2D

@export var movement_component: MovementComponent

var current_grabbable_component: GrabableComponent

func initiate_grab() -> void:
	print("initiating grab")
	print(grab_box.get_overlapping_bodies())
	if grab_box.get_overlapping_areas().size() > 0 :
		print("objects found")
		if !grab_box.get_overlapping_areas()[0].is_grabbed:
			grab_box.get_overlapping_areas()[0].attempt_grab(self)
			current_grabbable_component = grab_box.get_overlapping_areas()[0]

func initiate_throw(throw_inherit_velocity: Vector2):
	current_grabbable_component.attempt_throw(throw_inherit_velocity)
	current_grabbable_component = null
