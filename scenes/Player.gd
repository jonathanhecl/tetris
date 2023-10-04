extends CharacterBody2D

var block = Block.new()
var last_position = Vector2()
#var last_rotation = 0.0

func _ready():
	pass
	
func _process(delta):
	$Form/ReferenceRect.size = $Form.size

func _input(event):
	if event.is_action_pressed("ui_left"):
		self.position.x -= Global.GRID_SIZE
		check_collider()
	elif event.is_action_pressed("ui_right"):
		self.position.x += Global.GRID_SIZE
		check_collider()
		
	if event.is_action_released("ui_up"):
		rotate_form()
	elif event.is_action_pressed("ui_down"):
		self.position.y += Global.GRID_SIZE

func get_form(i):
	var form: Node = Global.FORMS[i].instantiate()
	$Form.add_child(form)
	$Form.size = get_form_size(form)
	
	self.position.y = Global.GRID_SIZE - 8
	self.position.x = 8 + ((get_viewport_rect().size.x/2)) - Global.GRID_SIZE

func get_form_size(n: Node) -> Vector2:
	var size_x = n.data.size_x * Global.GRID_SIZE
	var size_y = n.data.size_y * Global.GRID_SIZE
	return Vector2(size_x, size_y)

func rotate_form():
	var pivot = Vector2($Form.size/2)
	if $Form.size.x != Global.GRID_SIZE:
		pivot.x = fix_grid(pivot.x)
		pivot.y = fix_grid(pivot.y)
	else:
		pivot.x = fix_grid(pivot.x)
		pivot.y = fix_grid(pivot.y) - Global.GRID_SIZE
	
	$Form.set_pivot_offset(pivot)
	$Form.rotation_degrees += 90
	
	check_collider()

func fix_grid(i) -> int:
	return floor(i / Global.GRID_SIZE) * Global.GRID_SIZE
	
func check_collider():
	print("last_position", last_position)
	#print("last_rotation", last_rotation)
	if not is_collider():
		print("no choca")
		last_position = $Form.global_position
		#last_rotation = $Form.get_global_transform()
	else:
		print("chocó")
		$Form.set_global_position(last_position)
	
func is_collider() -> bool:
	if $Form.global_position.x < 0:
		return true
	elif $Form.global_position.x > get_viewport_rect().size.x - $Form.size.x:
		return true

	print($Form.global_position)
	return false
