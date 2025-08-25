class_name Planet extends Py_Body
var obj_in_soi = []
var soi_radius
var is_sun = false

func _ready():
	super._ready()
	get_node("soi").get_child(0).disabled = soi_disabled
	$Soiimg.scale = Vector2(soi_radius/3400, soi_radius/3400)
	if is_sun:
		print("I am a sun")
		var style2 := StyleBoxFlat.new()
		style2.bg_color = Color.YELLOW
		style2.set_corner_radius_all(5000)
		# Apply only to Panel since it definitely supports "panel"
		if $Panel:
			$Panel.add_theme_stylebox_override("panel", style2)


func _on_soi_body_entered(body: Node2D):
	if body is Planet or Py_Body:
		obj_in_soi.append(body)


func _on_soi_body_exited(body: Node2D):
	obj_in_soi.erase(body)
