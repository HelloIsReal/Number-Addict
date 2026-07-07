extends Node2D

var currentTotal=0
var current
func _ready():
	Global.countAdded.connect(updateTotal)


func _on_button_button_up():
	Global.emit_signal("rollNumbers")


func updateTotal(num):
	currentTotal+=num
	$totalCount.text = "Total Count: %d" % currentTotal

func updateMult():
	$totalMult.text = "Current multiplier: %dx" % Global.currentMult
