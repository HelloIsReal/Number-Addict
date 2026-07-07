extends Node2D

func _ready():
	updateStats()
	#Global.countAdded.connect(updateStats)
#func _physics_process(delta):
	

func _on_roll_button_pressed():
	Global.emit_signal("rollNumbers")

func updateStats():
	$totalMult.text = "Current multiplier: %sx" % Global.currentMult
	$totalCount.text = "Total Count: %d" % Global.totalCount
