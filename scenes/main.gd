extends Node2D

var currentTotal=0
var current
func _ready():
	Global.countAdded.connect(updateTotal)

func _physics_process(delta):
	$totalMult.text = "Current multiplier: %sx" % Global.currentMult
	print()

func updateTotal(num):
	currentTotal+=num
	$totalCount.text = "Total Count: %d" % currentTotal


func _on_roll_button_button_up():
	Global.emit_signal("rollNumbers")
