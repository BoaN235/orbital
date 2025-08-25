extends Control

@onready var parent = self.get_node("../")

func _physics_process(_delta):
	self.get_child(0).text = "Velocity:" + str(parent.velocity.x + parent.velocity.y)
