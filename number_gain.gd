extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.countAdded.connect(countGained)

func countGained(num):
	$".".text = "+%d" % num
	position = Vector2(randi_range(150,1600),randi_range(150,900))
	for i in range(12750):
		await get_tree().create_timer(0.01).timeout
		$".".modulate.a -= 0.02
		position.y -= 3
