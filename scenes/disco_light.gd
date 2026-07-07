extends Node2D
var speed = 0.2
var hue = 0.0
var point=2
var rotationAmount=1
func _ready():
	disco_rotate()

func _physics_process(delta):
	hue += delta * speed
	hue = fmod(hue,1.0)
	
	$light.modulate = Color.from_hsv(hue,1.0,1.0)
	$light.self_modulate.a = 0.5


# There's probably a better way to do this, 
# But I've spent enough time tryna make this work :sob:
func disco_rotate(): 
	while true:
		var tween = get_tree().create_tween()
		tween.tween_property($".", "rotation_degrees", 70, 6)
		await tween.finished
		
		tween = get_tree().create_tween()
		tween.tween_property($".", "rotation_degrees", -70, 6)
		await tween.finished
