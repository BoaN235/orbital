extends Py_Body



const SPEED = 500.0
var godmode = false

var g_velocity = Vector2(0,0)

var zoom_min= Vector2(.007, .007)
var zoom_max= Vector2(2.5, 2.5)
var zoom_speed = Vector2(.3, .3)

@onready var player_cam = get_node("player_cam")
@onready var map_cam = get_node("map_cam")
@onready var map_dot = get_node("map_dot")

func _physics_process(_delta: float):
	Engine.set_physics_ticks_per_second(60*10)
	if godmode:
		g_velocity = Vector2.ZERO
		var direction_x := Input.get_axis("ui_left", "ui_right")
		if direction_x:
			g_velocity.x = direction_x * SPEED
		else:
			g_velocity.x = move_toward(g_velocity.x, 0, SPEED)

		var direction_y := Input.get_axis("ui_up", "ui_down")
		if direction_y:
			g_velocity.y = direction_y * SPEED
		else:
			g_velocity.y = move_toward(g_velocity.x, 0, SPEED)
		move_and_collide(g_velocity)
	else:
		acceleration = gravity(check_soi(self), self.position)
		#print(acceleration," ", self.position, " ", check_soi())
		velocity += acceleration * -1
		move_and_collide(velocity)

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if player_cam.zoom - zoom_speed < zoom_min:
					player_cam.enabled = false
					map_cam.enabled = true
					map_dot.visible = true
				elif player_cam.zoom > zoom_min:
					player_cam.zoom -= zoom_speed
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if map_cam.enabled:
					map_cam.enabled = false
					player_cam.enabled = true
					map_dot.visible = false
				elif player_cam.zoom + zoom_speed > zoom_max:
					player_cam.zoom = zoom_max
				elif player_cam.zoom < zoom_max:
					player_cam.zoom += zoom_speed
	if event.is_action_pressed("god_mode"):
		godmode = !godmode
		velocity = Vector2.ZERO
