extends Node2D

var body = preload("res://objects/planet.tscn")
var planet_id = 0

func _ready():
	var scale_factor = 100.0
	var soi_scale = 20.0
	var soi
	var sun_instance = body.instantiate()
	sun_instance.g_mass = 1.989 * pow(10, 30)/scale_factor
	sun_instance.get_child(0).shape = sun_instance.get_child(0).shape.duplicate()
	#sun_instance.get_child(0).shape.radius = 1391400.0/scale_factor
	sun_instance.soi_disabled = false
	soi = sun_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	soi.shape.radius = (1391400.0/scale_factor)*125
	sun_instance.soi_disabled = false
	sun_instance.movement = false
	sun_instance.name = 'sun'
	sun_instance.id = planet_id
	sun_instance.soi_radius = soi.shape.radius
	sun_instance.is_sun = true
	$physics_objects.add_child(sun_instance)

	var mercury_instance = body.instantiate()
	mercury_instance.velocity = Vector2(0, 47.9*1.5)
	mercury_instance.g_mass = 3.30 * pow(10, 23)/scale_factor
	mercury_instance.position = Vector2(5790000/scale_factor, 0)
	mercury_instance.get_child(0).shape = mercury_instance.get_child(0).shape.duplicate()
	#mercury_instance.get_child(0).shape.radius = 48790.0/scale_factor
	mercury_instance.soi_disabled = false
	soi = mercury_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	mercury_instance.get_node("soi").get_child(0).shape.radius = (48790.0/scale_factor)*soi_scale
	mercury_instance.name = 'mercury'
	mercury_instance.id = planet_id + 1
	mercury_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(mercury_instance)

	var venus_instance  = body.instantiate()
	venus_instance.velocity = Vector2(0, 35.0*1.5)
	venus_instance.g_mass = 4.86 * pow(10, 24)/scale_factor
	venus_instance.position = Vector2(10820000/scale_factor, 0)
	venus_instance.get_child(0).shape = venus_instance.get_child(0).shape.duplicate()
	#venus_instance.get_child(0).shape.radius = 121040.0/scale_factor
	venus_instance.soi_disabled = false
	soi = venus_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	venus_instance.get_node("soi").get_child(0).shape.radius = (121040.0/scale_factor)*soi_scale
	venus_instance.name = 'venus'
	venus_instance.id = planet_id + 2
	venus_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(venus_instance)

	var earth_instance  = body.instantiate()
	earth_instance.velocity = Vector2(0, 28.8*1.5)
	earth_instance.g_mass = 5.97 * pow(10, 24)/scale_factor
	earth_instance.position = Vector2(14960000/scale_factor, 0)
	earth_instance.get_child(0).shape = earth_instance.get_child(0).shape.duplicate()
	earth_instance.soi_disabled = false
	#earth_instance.get_child(0).shape.radius = 127560.0/scale_factor
	soi = earth_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	earth_instance.get_node("soi").get_child(0).shape.radius = (127560.0/scale_factor)*soi_scale
	earth_instance.name = 'earth'
	earth_instance.id = planet_id + 3
	earth_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(earth_instance)

	var mars_instance  = body.instantiate()
	mars_instance.velocity = Vector2(0, 24.0*1.5)
	mars_instance.g_mass = 6.41 * pow(10, 23)/scale_factor
	mars_instance.position = Vector2(22790000/scale_factor, 0)
	mars_instance.get_child(0).shape = mars_instance.get_child(0).shape.duplicate()
	#mars_instance.get_child(0).shape.radius = 67920.0/scale_factor
	mars_instance.soi_disabled = false
	soi = mars_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	mars_instance.get_node("soi").get_child(0).shape.radius = (67920.0/scale_factor)*soi_scale
	mars_instance.name = "mars"
	mars_instance.id = planet_id + 4
	mars_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(mars_instance)

	var jupiter_instance  = body.instantiate()
	jupiter_instance.velocity = Vector2(0, 13.1*1.5)
	jupiter_instance.g_mass = 1.89 * pow(10, 27)/scale_factor
	jupiter_instance.position = Vector2(44860000/scale_factor, 0)
	jupiter_instance.get_child(0).shape = jupiter_instance.get_child(0).shape.duplicate()
	#jupiter_instance.get_child(0).shape.radius = 242984.0/scale_factor
	jupiter_instance.soi_disabled = false
	soi = jupiter_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	jupiter_instance.get_node("soi").get_child(0).shape.radius = (242984.0/scale_factor)*soi_scale
	jupiter_instance.name = 'jupiter'
	jupiter_instance.id = planet_id + 5
	jupiter_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(jupiter_instance)

	var saturn_instance  = body.instantiate()
	saturn_instance.velocity = Vector2(0, 9.7*1.5)
	saturn_instance.g_mass = 5.68 * pow(10, 26)/scale_factor
	saturn_instance.position = Vector2(53350000/scale_factor, 0)
	saturn_instance.get_child(0).shape = saturn_instance.get_child(0).shape.duplicate()
	#saturn_instance.get_child(0).shape.radius = 220536.0/scale_factor
	soi = saturn_instance.get_node("soi").get_child(0)
	saturn_instance.soi_disabled = false
	soi.shape = soi.shape.duplicate()
	saturn_instance.get_node("soi").get_child(0).shape.radius = (220536.0/scale_factor)*soi_scale
	saturn_instance.name = 'saturn'
	saturn_instance.id = planet_id + 6
	saturn_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(saturn_instance)

	var uranus_instance  = body.instantiate()
	uranus_instance.velocity = Vector2(0, 6.8*1.5)
	uranus_instance.g_mass = 8.68 * pow(10, 25)/scale_factor
	uranus_instance.position = Vector2(77250000/scale_factor, 0)
	uranus_instance.get_child(0).shape = uranus_instance.get_child(0).shape.duplicate()
	#uranus_instance.get_child(0).shape.radius = 111180.0/scale_factor
	uranus_instance.soi_disabled = false
	soi = uranus_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	uranus_instance.get_node("soi").get_child(0).shape.radius = (111180.0/scale_factor)*soi_scale
	uranus_instance.name = 'uranus'
	uranus_instance.id = planet_id + 7
	uranus_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(uranus_instance)

	var neptune_instance  = body.instantiate()
	neptune_instance.velocity = Vector2(0, 5.4*1.5)
	neptune_instance.g_mass = 1.02 * pow(10, 26)/scale_factor
	neptune_instance.position = Vector2(100510000/scale_factor, 0)
	neptune_instance.get_child(0).shape = neptune_instance.get_child(0).shape.duplicate()
	#neptune_instance.get_child(0).shape.radius = 99528.0/scale_factor
	neptune_instance.soi_disabled = false
	soi = neptune_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	neptune_instance.get_node("soi").get_child(0).shape.radius = (99528.0/scale_factor)*soi_scale
	neptune_instance.name = 'neptune'
	neptune_instance.id = planet_id + 8
	neptune_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(neptune_instance)

	var pluto_instance  = body.instantiate()
	pluto_instance.velocity = Vector2(0, 4.74*1.5)
	pluto_instance.g_mass = 1.02 * pow(10, 26)/scale_factor
	pluto_instance.position = Vector2(120510000/scale_factor, 0)
	pluto_instance.get_child(0).shape = pluto_instance.get_child(0).shape.duplicate()
	#pluto_instance.get_child(0).shape.radius = 118000.3/scale_factor
	pluto_instance.soi_disabled = false
	soi = pluto_instance.get_node("soi").get_child(0)
	soi.shape = soi.shape.duplicate()
	pluto_instance.get_node("soi").get_child(0).shape.radius = (118000.3/scale_factor)*soi_scale
	pluto_instance.name = 'pluto'
	pluto_instance.id = planet_id + 9
	pluto_instance.soi_radius = soi.shape.radius
	$physics_objects.add_child(pluto_instance)
