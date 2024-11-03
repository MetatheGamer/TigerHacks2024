extends Node2D

const max_months = 24

var months = 1

var Dept = 1000

var balance = 0

var current_crops = null

var yeild_lost = 0

var carbon_footprint = null

var harvest_time = 0

var previous_crop = null

var number_of_repeats = 0 

var key_pressed = false

@export var all_interactions = []
@export var cur_interactions = []
@onready var InteractionLabel = $"InteractionComponents/Interact Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#$Carrots.visible = false
	#$Potatoes.visible = false
	#$Soybeans.visible = false
	#$Wheat.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	#print("harvest_time: ", harvest_time)
	#print("Balance: ", balance)
#Plants crops


func choose_crop(type):
	if type == "Carrots" && harvest_time == 0:
		current_crops = "Carrots"
		harvest_time = 2
		print("was meant to plant carrots")
		#Something to make it plant carrots
	elif type == "Potatoes" && harvest_time == 0:
		current_crops = "Potatoes"
		harvest_time = 2
		$Potatoes.visible = true
		#Something to make it plant Potatoes
	elif type == "Wheat" && harvest_time == 0:
		current_crops = "Wheat"
		harvest_time = 5
		$Wheat.visible = true
		#Something to make it plant WHeat
	elif type == "Soybeans" && harvest_time == 0:
		current_crops = "Soybeans"
		harvest_time = 4
		$Soybeans.visible = true
		#Something to make it plant Soybeans

	
var type
	


func loss():
	pass
	
	

#func harvest():
	#if harvest_time == 0:
		#if current_crops == "Carrots":
		#	balance += 460130
	#elif current_crops == "Potatoes":
		#	balance += 890000
	#elif current_crops == "Wheat":
		#	balance += 66750
	#elif current_crops == "Soybeans":
		#	balance += 157530
	
	
			
	#$Carrots.visible = false
	#$Potatoes.visible = false
	#$Wheat.visible = false
	#$Soybeans.visible = false
	
	#previous_crop = current_crops

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
	
func sleep():
	var night_time = false
	#if ("Sleep") && key_pressed == false:
		#night_time = true
		#months += 1
		#harvest_time -= 1
		#key_pressed = true
		
		
		
	#key_pressed = false
		
		
	
	#if night_time == true && key_pressed == false:
		#$Night.visible = true
		#wait(5)
		
	night_time = false
		
#ADDD FADE TO BLACK
