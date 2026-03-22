extends Node


@export var input_component: InputComponent

@export var movement_component: CharacterMovementComponent
@export var character_controls: CharacterControls
@export var gravity_component: GravityComponent

@export var grabber_component: GrabberComponent

@export var jump_attack: HurtboxComponent

func _ready():
	jump_attack.attack_response.connect(enemy_hit)
	jump_attack.attack.connect(per_enemy_hit)


func _physics_process(delta):
	input_component.update_input()
	
	# in case we want to disable gravity or like, invert gravity ngl that'd be cool
	gravity_component.update_gravity()
	
	# Make mutually exclusive(?)
	# do jump attack first, initiate hurt returns a boolean
	# you can only jump if you can't do the jump attack
	# if you're standing on a regular hitbox it does a jump attack(?)
	if input_component.is_jumping:
		character_controls.attempt_jump()
		jump_attack.initiate_hurt()  
	
	
	character_controls.attempt_horizontal_movement(input_component.input_direction)
	movement_component.update_movement(delta)
	
	
	if input_component.is_grabbing:
		# make more flexible and readible
		#once pressing grab button, if you're not holding something in your hands, you try to grab
		#if you have something in your hands, you throw it
		if grabber_component.current_grabbable_component == null:
			grabber_component.initiate_grab()
		else:
			grabber_component.initiate_throw(movement_component.body.velocity * 1.4)


func enemy_hit():
	# change to force
	print("got it")
	# change to impulse????
	movement_component.set_velocity_y(-500)

# What do I do to each enemy that I hit (push them down mostly)
func per_enemy_hit(hitbox: HitboxComponent):
	
	if !hitbox.movement_component == null:
		hitbox.movement_component.apply_impulse(Vector2(0, 800))
	hitbox.recieve_damage(1)
