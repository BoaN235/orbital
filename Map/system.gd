extends Node2D

const sun = preload("res://objects/sun.tscn")
const planet = preload("res://objects/planet.tscn")

var sun_instance = sun.instantiate()

func _ready():
    add_child(sun_instance)