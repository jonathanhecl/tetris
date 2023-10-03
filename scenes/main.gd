extends Node2D

func _ready():
	randomize()
	
	get_player_form()
	pass
	
	
func get_player_form():
	var i = randi_range(0, len(Global.FORMS)-1)
	
	var scene = PackedScene.new()
	#scene.new(Global.FORMS[i])
	scene.instantiate()
	$Player/Form.add_child(scene)
	
	
