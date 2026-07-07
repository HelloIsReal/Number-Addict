extends Node2D

var currentTotal=0
func _ready():
	Global.countAdded.connect(updateTotal)


func _on_button_button_up():
	Global.emit_signal("rollNumbers")


func updateTotal(num):
	currentTotal+=num
	$totalCount.text = "Total Count: %d" % currentTotal
