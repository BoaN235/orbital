class_name Py_Body extends CharacterBody2D
const TRAJ_STEPS = 200 # Number of trajectory points
const STEP_SIZE = 1.0  # Simulation step size


@export var segments = 24.0 *2
@export var g_mass = 0.0
@export var soi_disabled = true
@export var acceleration = Vector2(0,0)
@export var radius = 0.0
@export var movement = true
var center
var physics_objects
var id
var points = []

func _ready():
	var root_node = get_viewport().get_child(0)
	for child in root_node.get_children():
		if child.name == "physics_objects":
			physics_objects = child

func _physics_process(_delta):
	if movement:
		#print(velocity, " ", velocity + acceleration, " ", acceleration,self.name,self.position)
		#trajectory_points()
		center = check_soi(self)
		acceleration = gravity(center, self.position)
		#var engine_frames = float(Engine.get_physics_frames())
		velocity += acceleration#* delta
		self.position += velocity
		move_and_collide(velocity)
		#calculate_ellipse()
		#self.queue_redraw()


func calculate_distance(obj, obj2):
	var x1
	var y1
	if obj2 is Vector2:
		x1 = obj2.x
		y1 = obj2.y
	else:
		x1 = obj2.position.x
		y1 = obj2.position.y

	var x2 = obj.position.x
	var y2 = obj.position.y
	return sqrt(pow(x2-x1, 2) + pow(y2-y1, 2))

func gravity(obj, location):
	var g = 6.67e-11  # gravitational constant
	var direction =  obj.position - location
	var distance_sq = max(direction.length_squared(), 1e-6)
	var distance = sqrt(distance_sq)
	var force_dir = direction / distance
	var accel = g * obj.g_mass / distance_sq * force_dir
	accel /= pow(10, 9.5)
	return accel


func check_soi(itself):
	var closest = null
	var candidates = []

	for child in physics_objects.get_children():
		if child is Planet and not child == self:
			var dist = calculate_distance(child, itself)
			if dist < child.soi_radius:
				candidates.append(child)

	for obj in candidates:
		if closest == null or calculate_distance(obj, itself) < calculate_distance(closest, itself):
			closest = obj
	if closest == null:
		closest = self
	return closest

func calculate_ellipse():
	points = [self.position]
	var angle
	for i in range(0, segments):
		angle = rad_to_deg(i/segments * 360)
		if i == 0:
			var x = sin(angle) * points[i].x
			var y = sin(angle) * points[i].y
			points.append(Vector2(x,y))
		else:
			var x = sin(angle) * points[i-1].x
			var y = sin(angle) * points[i-1].y
			points.append(Vector2(x,y))



func _draw():
	if points.size() >= 2:
		draw_polyline(points, Color.WHITE ,100)

func update_points():
	pass
