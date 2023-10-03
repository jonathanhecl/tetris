extends CharacterBody2D

func _ready():
	#self.position.x -= 8
	#self.position.y -= 8
	pass

func _input(event):
	if event.is_action_pressed("ui_left"):
		self.position.x -= Global.GRID_SIZE
	elif event.is_action_pressed("ui_right"):
		self.position.x += Global.GRID_SIZE
	
	if event.is_action_released("ui_accept"):
		$Form.rotation += 90
		if $Form.rotation>= 270:
			$Form.rotation = 0
		print($Form.rotation)
