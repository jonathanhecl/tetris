extends Node2D

func _ready():
	randomize()
	
	get_player_form()
	pass
	
	
func get_player_form():
	var i = randi_range(0, len(Global.FORMS)-1)
	$Player/Form.add_child(Global.FORMS[i].instantiate())
	$Player.position.x = get_viewport_rect().size.x/2
	
