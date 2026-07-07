extends Node2D
#
#func _ready():
	#Global.countAdded.connect(updateTotal)

func _physics_process(delta):
	$totalMult.text = "Current multiplier: %sx" % Global.currentMult
	$totalCount.text = "Total Count: %d" % Global.totalCount
	print()

#func updateTotal(num):
	#Global.totalCount+=num
	


func _on_roll_button_button_up():
	Global.emit_signal("rollNumbers")
