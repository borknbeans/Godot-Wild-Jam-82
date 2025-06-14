extends StaticBody2D
class_name UIComponent

signal mouse_down
signal mouse_up

var mouse_is_entered: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_is_entered and Input.is_action_pressed("interact_ui"):
		print("Clicked!")
		mouse_down.emit()
	elif mouse_is_entered and Input.is_action_just_released("interact_ui"):
		print("Released!")
		mouse_up.emit()


func on_mouse_entered() -> void:
	mouse_is_entered = true
	print("Mouse entered")


func on_mouse_exited() -> void:
	mouse_is_entered = false
	print("Mouse exited")
