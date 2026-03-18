class_name InputComponent extends Node


var input_direction: float = 0
var is_jumping: bool = false
var is_grabbing: bool = false

func update_input() -> void:
	# change to four directional 
	input_direction = Input.get_axis("ui_left", "ui_right")
	is_jumping = Input.is_action_just_pressed("ui_accept")
	is_grabbing = Input.is_action_just_pressed("ui_up")
