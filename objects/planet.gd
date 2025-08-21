class_name Planet extends Py_Body
var obj_in_soi = []
var soi_radius

func _ready():
	super._ready()
	get_node("soi").get_child(0).disabled = soi_disabled

func _on_soi_body_entered(body: Node2D):
	if body is Planet or Py_Body:
		obj_in_soi.append(body)


func _on_soi_body_exited(body: Node2D):
	obj_in_soi.erase(body)
