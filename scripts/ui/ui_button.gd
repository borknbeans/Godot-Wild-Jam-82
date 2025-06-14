extends UIComponent
class_name UIButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_down.connect(on_mouse_down)
	mouse_up.connect(on_mouse_up)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_mouse_down() -> void:
	# TODO: Animate the click
	pass


func on_mouse_up() -> void:
	# TODO: Animate the release to bounce
	pass
