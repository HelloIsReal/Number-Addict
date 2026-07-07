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
#func _physics_process(delta):
	


func roll():
	if(!rolling):
		rolling=true
		for i in range(100-(Global.rollSpeedReductions*5)):
			await get_tree().create_timer(0.01).timeout
			
			#if(displayNumber==9):
				#displayNumber=0
			#else:
				#displayNumber+=1
			rolledNumber = rng.randi_range(1*Global.currentMult,9*Global.currentMult)
			displayNumber=rolledNumber
			$number.text = "%d" % displayNumber
		var newNumberGain = numberGain.instantiate()
		get_tree().current_scene.add_child(newNumberGain)
		Global.countAdded.emit(rolledNumber)
		Global.totalCount+=rolledNumber
		rolling=false
