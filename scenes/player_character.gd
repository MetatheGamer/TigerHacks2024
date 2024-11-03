extends CharacterBody2D

@export var all_interactions = []
@export var cur_interactions = []
@onready var InteractionLabel = $"InteractionComponents/Interact Label"

var GameManager2 = load("res://scripts/GameManager.gd")
var utility_instance2 = GameManager

enum {IDLE, RUN}
var state = IDLE
@onready var animationTree = $AnimationTree
@onready var state_machine = animationTree["parameters/playback"]
var blendPosition : Vector2 = Vector2.ZERO
var blendPath = [
	"parameters/idle/BlendSpace2D/blend_position",
	"parameters/move/BlendSpace2D/blend_position"
]
var anim_tree_keys = [
	"idle",
	'move'
]


func _ready():
	#utility_instance2.Carrots.visible = false
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

func animate() -> void:
	state_machine.travel(anim_tree_keys[state])
	animationTree.set(blendPath[state], blendPosition)
################################################################################
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
	#else:
		#InteractionLabel.text = "" this stopped working. idk why
		
var GameManager = load("res://scripts/GameManager.gd")
var utility_instance = GameManager.new()

		
func exe_interaction():
	if all_interactions:
		var cur_interactions = all_interactions[0]
		match cur_interactions.interact_type:
			"print_text" : print(cur_interactions.interact_value)
			"plant_crops" : utility_instance.choose_crop(cur_interactions.interact_value)


#Assorted Variables
