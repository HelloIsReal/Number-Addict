extends Node2D
#func _ready():
	#updateStats()
	#Global.countAdded.connect(updateStats)
func _physics_process(delta):
	$totalMult.text = "Current multiplier: %sx" % Global.currentMult
	$totalCount.text = "Total Count: %d" % Global.totalCount
	if Global.rolling==true:
		$LeverStick.rotation=deg_to_rad(180)
	else:
		$LeverStick.rotation=0
func _on_roll_button_pressed():
	Global.emit_signal("rollNumbers")
