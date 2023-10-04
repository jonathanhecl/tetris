extends Node2D

var last_check = 0;

func _ready():
	randomize()
	
	last_check = get_viewport_rect().size.y - Global.GRID_SIZE
	$Timer.start()
	
	get_new_form()
	pass
	
	
func get_new_form():
	var i = randi_range(0, len(Global.FORMS)-1)
	$Player.get_form(i)	

func _process(delta):
	if last_check < Global.GRID_SIZE:
		last_check = get_viewport_rect().size.y
	pass

func _on_timer_timeout():
	last_check -= Global.GRID_SIZE
	$FixedBlocks/ReferenceRect.position.y = (last_check - 8)
	print(last_check)
