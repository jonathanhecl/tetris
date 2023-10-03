extends CharacterBody2D

func _ready():
	self.position.x -= 8
	self.position.y -= 8
	pass

func _input(event):
	if event.is_action_pressed("ui_left"):
		self.position.x -= Global.GRID_SIZE
	elif event.is_action_pressed("ui_right"):
		self.position.x += Global.GRID_SIZE
	
	if event.is_action_released("ui_accept"):
		#if $Form.rotation == 90:
		#	$Form.rotate(90)
		#else:
		#	$Form.rotate($Form.rotation - 90)
