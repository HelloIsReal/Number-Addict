extends Node2D
var rng = RandomNumberGenerator.new()
var numberGain = preload("res://scenes/number_gain.tscn")
var displayNumber=0
var rolledNumber=0
var rolling=false
#I couldn't figure out why instantiated numberRoller scenes didn't want to pickup
# the Global.rolling variable for some reason. So I made a 2nd variable just to make
# the ultimate upgrade work. At least it works lol. Global is still used for the lever.

func _ready():
	Global.rollNumbers.connect(roll)
	Global.resetObjects.connect(freeObject)


func roll():
	print("I am rolling!")
	if(!rolling):
		Global.rolling=true
		rolling=true
		for i in range(100-(Global.rollSpeedReductions*5)):
			await get_tree().create_timer(0.01).timeout
			
			rolledNumber = rng.randi_range(1*Global.currentMult,9*Global.currentMult)
			displayNumber=rolledNumber
			$number.text = "%d" % displayNumber
			
		var newNumberGain = numberGain.instantiate()
		get_tree().current_scene.add_child(newNumberGain)
		Global.countAdded.emit(rolledNumber)
		Global.totalCount+=rolledNumber
		Global.rolling=false
		rolling=false

func freeObject():
	queue_free()
