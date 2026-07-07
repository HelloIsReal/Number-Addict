extends Node2D
var rng = RandomNumberGenerator.new()
var numberGain = preload("res://scenes/number_gain.tscn")
var displayNumber=0
var rolledNumber=0
var rolling=false
func _ready():
	Global.rollNumbers.connect(roll)
	#pass
	
	# Insert fade in animation when spawned
func _physics_process(delta):
	$number.text = "%d" % displayNumber


func roll():
	if(!rolling):
		for i in range(100):
			
			await get_tree().create_timer(0.01).timeout
			if(displayNumber==9):
				displayNumber=0
			else:
				displayNumber+=1
			rolledNumber = rng.randi_range(1,9)
			displayNumber=rolledNumber
		var newNumberGain = numberGain.instantiate()
		get_tree().current_scene.add_child(newNumberGain)
		Global.countAdded.emit(rolledNumber)
