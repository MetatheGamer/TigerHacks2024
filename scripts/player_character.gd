extends CharacterBody2D

@export var all_interactions = []
@export var cur_interactions = []
@onready var InteractionLabel = $"InteractionComponents/Interact Label"

func _ready():
	update_interactions()
	
#Feel free to change the speed
var SPEED = 500
var motion = Vector2.ZERO

#Movement of character
func _physics_process(delta):
	if Input.is_action_just_pressed("Interact"):
		exe_interaction()
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

func _on_interaction_area_area_entered(area: Area2D) -> void:
	all_interactions.insert(0,area)
	update_interactions()


func _on_interaction_area_area_exited(area: Area2D) -> void:
	all_interactions.erase(area)
	update_interactions()

func update_interactions():
	if all_interactions:
		InteractionLabel.text = all_interactions[0].interact_label
	else:
		InteractionLabel.text = ""
		
func exe_interaction():
	if all_interactions:
		cur_interactions = all_interactions[0]
		match cur_interactions.interact_type:
			"print_text" : print(cur_interactions.interact_value)
