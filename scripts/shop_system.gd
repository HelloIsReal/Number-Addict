extends Node2D

var discoLights=0
var discoBalls=0
var shopOpen=false
var glitter=0
var hasGlitter=false
var reloading=false
var numberRollers=1
var rng = RandomNumberGenerator.new()
var discoLightObject = preload("res://scenes/disco_light.tscn")
var discoBallObject = preload("res://scenes/disco_ball.tscn")
var glitterObject = preload("res://scenes/glitter.tscn")
var numberRollerObject = preload("res://scenes/number_roller.tscn")
func _ready():
	updateCosts()

func updateCosts():
	$"TabContainer/Multiplier Upgrades/rollSpeed".text = "Roll Speed (-0.05s)\n%d count" % (20*((Global.rollSpeedReductions+1)*(Global.rollSpeedReductions+1)))
	$"TabContainer/Multiplier Upgrades/discoLights".text = "Disco Lights (+0.25)\n%d count" % (25*(discoLights+1))
	$"TabContainer/Multiplier Upgrades/discoBalls".text = "Disco Ball (+1)\n%d count" % (100*(discoBalls+1))
	$"TabContainer/Multiplier Upgrades/glitter".text = "Glitter (+10)\n%d count" % (600*(glitter+1))
	$"TabContainer/Multiplier Upgrades/ultimate upgrade".text = "Ultimate Upgrade\n (+Number)\n%d count" % (100000*(numberRollers))
	Global.currentMult = 1 + discoLights*0.25 + discoBalls*1 + glitter*10


func _on_show_show_arrow_button_pressed():
	if !shopOpen:
		shopOpen=true
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(0,0),0.75).set_trans(Tween.TRANS_CUBIC)
	elif shopOpen:
		shopOpen=false
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(-310,0),0.75).set_trans(Tween.TRANS_CUBIC)
	updateCosts()


func _on_disco_lights_pressed():
	if Global.totalCount >= (25*(discoLights+1)):
		print("bought disco light!")
		Global.totalCount -= (25*(discoLights+1))
		discoLights+=1
		var newDiscoLight = discoLightObject.instantiate()
		newDiscoLight.position = Vector2(rng.randi_range(75,1850),990)
		get_tree().current_scene.add_child(newDiscoLight)
	updateCosts()

func _on_disco_balls_pressed():
	if Global.totalCount >= (100*(discoBalls+1)):
		print("bought disco ball!")
		Global.totalCount -= (100*(discoBalls+1))
		discoBalls+=1
		var newDiscoBall = discoBallObject.instantiate()
		newDiscoBall.position = Vector2(rng.randi_range(50,1850),75)
		get_tree().current_scene.add_child(newDiscoBall)
	updateCosts()


func _on_reload_objects_pressed():
	if Global.totalCount >= 200 && !reloading:
		reloading=true
		print("Bought object reload!")
		Global.totalCount-= 200
		Global.resetObjects.emit()
		for i in range(discoLights):
			await get_tree().create_timer(rng.randi_range(1,6)).timeout
			var newDiscoLight = discoLightObject.instantiate()
			newDiscoLight.position = Vector2(rng.randi_range(150,1700),1080)
			get_tree().current_scene.add_child(newDiscoLight)
		for i in range(discoBalls):
			await get_tree().create_timer(rng.randi_range(1,6)).timeout
			var newDiscoBall = discoBallObject.instantiate()
			newDiscoBall.position = Vector2(rng.randi_range(150,1800),75)
			get_tree().current_scene.add_child(newDiscoBall)
		for i in range(numberRollers):
			var newNumberRoller = numberRollerObject.instantiate()
			newNumberRoller.position = Vector2(rng.randi_range(25,1750),rng.randi_range(-50,760))
			get_tree().current_scene.add_child(newNumberRoller)
			
		reloading=false
	updateCosts()


func _on_roll_speed_pressed():
	if(Global.rollSpeedReductions<19):
		if Global.totalCount >= (20*((Global.rollSpeedReductions+1)*(Global.rollSpeedReductions+1))):
			print("bough roll speed reduction!")
			Global.totalCount -= (20*((Global.rollSpeedReductions+1)*(Global.rollSpeedReductions+1)))
			Global.rollSpeedReductions+=1
	else:
		$"TabContainer/Multiplier Upgrades/rollSpeed".disabled=true
	updateCosts()


func _on_glitter_pressed():
	if Global.totalCount >= (600*(glitter+1)):
		print("bought glitter!")
		Global.totalCount -= (600*(glitter+1))
		glitter+=1
		if(!hasGlitter):
			hasGlitter=true
			var newGlitter = glitterObject.instantiate()
			get_tree().current_scene.add_child(newGlitter)
	updateCosts()


func _on_ultimate_upgrade_pressed():
	if Global.totalCount >= (100000*(numberRollers)):
		print("bought ultimate upgrade (another number counter)!")
		Global.totalCount -= (100000*(numberRollers))
		numberRollers+=1
		var newNumberRoller = numberRollerObject.instantiate()
		newNumberRoller.position = Vector2(rng.randi_range(25,1750),rng.randi_range(-50,760))
		get_tree().current_scene.add_child(newNumberRoller)
	updateCosts()
