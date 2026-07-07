extends Node2D

var discoLights=0
var discoBall=0
var shopOpen=false

func _physics_process(delta):
	$"TabContainer/Multiplier upgrades/discoLights".text = "Disco Lights (+0.25)\n%d count" % (25*(discoLights+1))


func updateMult():
	Global.currentMult = discoLights*0.25 + discoBall*2

func _on_show_show_arrow_button_button_up():
	if !shopOpen:
		shopOpen=true
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(0,0),1.0).set_trans(Tween.TRANS_CUBIC)
		print("entered!")
	elif shopOpen:
		shopOpen=false
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(-310,0),1.0).set_trans(Tween.TRANS_CUBIC)
		print("exited!")


func _on_disco_lights_button_up():
	if Global.totalCount >= (25*(discoLights+1)):
		Global.totalCount -= (25*(discoLights+1))
		discoLights+=1
