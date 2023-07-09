extends CharacterBody2D

@export var movespeed = 300
@export var jumpheight = 600
@export var gravity = 400

func _ready():
	pass

func _process(delta):
	
	if !is_multiplayer_authority(): return
	
	velocity.x = 0
	
	if Input.is_action_pressed("left"):
		velocity.x = -movespeed
	if Input.is_action_pressed("right"):
		velocity.x = movespeed
	
	if is_on_floor():
		
		velocity.y = 1
		
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jumpheight
			
	else:
		
		velocity.y += gravity * delta
	
	move_and_slide()
	
	
