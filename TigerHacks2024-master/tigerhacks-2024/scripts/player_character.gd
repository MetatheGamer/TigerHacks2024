extends CharacterBody2D

@export var all_interactions = []

@onready var InteractionLabel = $"Interaction_Components/InteractionLabel"

#Feel free to change the speed
var SPEED = 600
var motion = Vector2.ZERO

#Movement of character
func _physics_process(delta):
	if Input.is_action_pressed("Right") && Input.is_action_pressed("Up"):
		motion.y = -SPEED
		motion.x = SPEED
	elif Input.is_action_pressed("Right") && Input.is_action_pressed("Down"):
		motion.y = SPEED
		motion.x = SPEED
	elif Input.is_action_pressed("Left") && Input.is_action_pressed("Up"):
		motion.y = -SPEED
		motion.x = -SPEED
	elif Input.is_action_pressed("Left") && Input.is_action_pressed("Down"):
		motion.y = SPEED
		motion.x = -SPEED
	elif Input.is_action_pressed("Up"):
		motion.y = -SPEED
		motion.x = 0
	elif Input.is_action_pressed("Down"):
		motion.y = SPEED
		motion.x = 0
	elif Input.is_action_pressed("Left"):
		motion.x = -SPEED
		motion.y = 0
	elif Input.is_action_pressed("Right"):
		motion.x = SPEED
		motion.y = 0
	else:
		motion.x = 0
		motion.y = 0
		
	velocity = motion
			
	move_and_slide()

################################################################################3
#Interactions


	
