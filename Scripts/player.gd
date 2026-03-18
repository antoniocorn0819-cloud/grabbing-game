extends Node

@export var input_component: InputComponent

@export var movement_component: MovementComponent
@export var character_controls: CharacterControls
@export var gravity_component: GravityComponent

@export var grabber_component: GrabberComponent

func _physics_process(delta):
	input_component.update_input()
	
	
	
	gravity_component.update_gravity()
	
	if input_component.is_jumping:
		character_controls.attempt_jump()
	
	character_controls.attempt_horizontal_movement(input_component.input_direction)
	movement_component.update_movement(delta)
	
	if input_component.is_grabbing:
		if grabber_component.current_grabbable_component == null:
			grabber_component.initiate_grab()
		else:
			grabber_component.initiate_throw(movement_component.body.velocity * 1.4)




#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
