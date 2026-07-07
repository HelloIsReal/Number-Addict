extends Node2D

var discoLights=0
var discoBalls=0
var shopOpen=true
var rng = RandomNumberGenerator.new()
var discoLight = preload("res://scenes/disco_light.tscn")
var discoBall = preload("res://scenes/disco_ball.tscn")

func _physics_process(delta):
	$"TabContainer/Multiplier Upgrades/discoLights".text = "Disco Lights (+0.25)\n%d count" % (25*(discoLights+1))
	$"TabContainer/Multiplier Upgrades/discoBalls".text = "Disco Ball (+1)\n%d count" % (100*(discoBalls+1))
	Global.currentMult = 1 + discoLights*0.25 + discoBalls*1


func _on_show_show_arrow_button_pressed():
	if !shopOpen:
		shopOpen=true
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(0,0),0.75).set_trans(Tween.TRANS_CUBIC)
		print("entered!")
	elif shopOpen:
		shopOpen=false
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(-310,0),0.75).set_trans(Tween.TRANS_CUBIC)
		print("exited!")


func _on_disco_lights_pressed():
	if Global.totalCount >= (25*(discoLights+1)):
		print("bought disco light!")
		Global.totalCount -= (25*(discoLights+1))
		discoLights+=1
		var newDiscoLight = discoLight.instantiate()
		newDiscoLight.position = Vector2(rng.randi_range(150,1700),1080)
		get_tree().current_scene.add_child(newDiscoLight)


func _on_disco_balls_pressed():
	if Global.totalCount >= (100*(discoBalls+1)):
		print("bought disco ball!")
		Global.totalCount -= (100*(discoBalls+1))
		discoBalls+=1
		var newDiscoBall = discoBall.instantiate()
		newDiscoBall.position = Vector2(rng.randi_range(150,1800),75)
		get_tree().current_scene.add_child(newDiscoBall)
