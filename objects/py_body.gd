class_name Py_Body extends CharacterBody2D
@export var g_mass = 0.0
@export var soi_disabled = true
@export var acceleration = Vector2(0,0)
@export var radius = 0.0
@export var movement = true
var sun
var physics_objects
var id
var points = []

func _ready():
	var root_node = get_viewport().get_child(0)
	print(root_node)
	for child in root_node.get_children():
		if child.name == "physics_objects":
			physics_objects = child

func _physics_process(_delta):
	if movement:
		acceleration = gravity(check_soi(self), self.position)
		#print(velocity, " ", velocity + acceleration, " ", acceleration)
		velocity += acceleration * -1
		self.position += velocity
		#trajectory_points()

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
	return sqrt(pow(x2-x1, 2) + pow(y2-y1, 2))# returns distance

func gravity(obj, location):
	var g = 6.67e-11  # gravitational constant
	var direction = location - obj.position
	var distance_sq = max(direction.length_squared(), 1e-6)
	var distance = sqrt(distance_sq)
	var force_dir = direction / distance
	var accel = g * obj.g_mass / distance_sq * force_dir
	accel /= pow(10, 9.5)
	return accel


func check_soi(itself):
	var closest = null
	var candidates = []

	# Find all planets whose SOI contains self
	for child in physics_objects.get_children():
		if child is Planet and not child == self: # skip self
			var dist = calculate_distance(child, itself)
			if dist < child.soi_radius: # inside this planet's SOI
				candidates.append(child)

	# Pick the "smallest" SOI that contains self
	for obj in candidates:
		if closest == null or calculate_distance(obj, itself) < calculate_distance(closest, itself):
			closest = obj
	return closest

func trajectory_points():
	var end_points = false

	var point_acc = acceleration
	var point_vel = velocity
	var point = Vector2()
	var last_point
	while !end_points:
		if points.size() == 0:
			point = self.position
			points.append(point)
		else:
			last_point = points[points.size() - 1]
			point_acc = gravity(check_soi(last_point), last_point)
			point_vel -= point_acc
			points.append(last_point + point_vel)
		if points.size() == 10:
			end_points = true

func _draw():
	for point in points:
		draw_circle(point, 1000, Color.WHEAT)
