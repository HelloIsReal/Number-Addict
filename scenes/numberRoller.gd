extends Node2D

var displayNumber=2

func _ready():
	Global.rollNumbers.connect(roll)
	#pass
	
	# Insert fade in animation when spawned
func _physics_process(delta):
	$number.text = "%d" % displayNumber


func roll():
	for i in range(100):
		
		await get_tree().create_timer(0.01).timeout
		if(displayNumber==9):
			displayNumber=0
		else:
			displayNumber+=1
