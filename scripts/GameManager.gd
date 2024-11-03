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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Night.visible = false
	choose_crop()
	harvest()
	sleep()
	
	#print("harvest_time: ", harvest_time)
	#print("Balance: ", balance)
	
func choose_crop():
	if Input.is_action_pressed("Carrots") && harvest_time == 0:
		current_crops = "Carrots"
		harvest_time = 2
		$Carrots.visible = true
		#Something to make it plant carrots
	elif Input.is_action_pressed("Potatoes") && harvest_time == 0:
		current_crops = "Potatoes"
		harvest_time = 2
		$Potatoes.visible = true
		#Something to make it plant Potatoes
	elif Input.is_action_pressed("Wheat") && harvest_time == 0:
		current_crops = "Wheat"
		harvest_time = 5
		$Wheat.visible = true
		#Something to make it plant WHeat
	elif Input.is_action_pressed("Soybeans") && harvest_time == 0:
		current_crops = "Soybeans"
		harvest_time = 4
		$Soybeans.visible = true
		#Something to make it plant Soybeans

func loss():
	if previous_crop == current_crops && harvest_time == 0:
		
		yeild_lost 
	
	

func harvest():
	if harvest_time == 0:
		if current_crops == "Carrots":
			balance += 460130
		elif current_crops == "Potatoes":
			balance += 890000
		elif current_crops == "Wheat":
			balance += 66750
		elif current_crops == "Soybeans":
			balance += 157530
	
	
			
	$Carrots.visible = false
	$Potatoes.visible = false
	$Wheat.visible = false
	$Soybeans.visible = false
	
	previous_crop = current_crops

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
	
func sleep():
	var night_time = false
	if Input.is_action_pressed("Sleep") && key_pressed == false:
		night_time = true
		months += 1
		harvest_time -= 1
		key_pressed = true
		
		var control = 10099999000
		
		while control > 0:
			control -= 1
			$Night.visible = true
		
		
	key_pressed = false
		
		
	
	#if night_time == true && key_pressed == false:
		#$Night.visible = true
		#wait(5)
		
	night_time = false
		
#ADDD FADE TO BLACK
