extends Node2D
var speed = 0.1
var hue = 0.0
var point=2
var rotationAmount=1


func _physics_process(delta):
	hue += delta * speed
	hue = fmod(hue,1.0)
	
	$ball.modulate = Color.from_hsv(hue,1.0,1.0)
	$ball.self_modulate.a = 0.8
	
	$ball.rotation+=1*delta
	
	
