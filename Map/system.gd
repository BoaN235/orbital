extends Node2D


var body = preload("res://objects/py_body.tscn")


func _ready():
	#
	var sun_instance = body.instantiate()
	var planet_instance = body.instantiate()

	sun_instance.g_mass = 1.989 * pow(10, 25)
	sun_instance.get_child(0).shape = sun_instance.get_child(0).shape.duplicate()
	sun_instance.get_child(0).shape.radius = 200.0
	sun_instance.movement = false

	planet_instance.velocity = Vector2(0, -18)
	planet_instance.g_mass = 5.9722 * pow(10, 24)
	planet_instance.position = Vector2(1000, 60)
	planet_instance.get_child(0).shape = planet_instance.get_child(0).shape.duplicate()
	planet_instance.get_child(0).shape.radius = 50.0

	$physics_objects.add_child(sun_instance)
	$physics_objects.add_child(planet_instance)
