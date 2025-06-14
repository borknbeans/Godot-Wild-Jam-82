extends UIComponent
class_name UIButton

@export var area_2d: Area2D
@export var launch_strength: float

var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	mouse_down.connect(on_mouse_down)
	mouse_up.connect(on_mouse_up)
	area_2d.body_entered.connect(on_player_entered)
	area_2d.body_exited.connect(on_player_exited)


func on_mouse_down() -> void:
	# TODO: Animate the click
	scale = Vector2(1.2, 0.8)
	pass

func on_mouse_up() -> void:
	# TODO: Animate the release to bounce
	scale = Vector2(1, 1)
	if player != null:
		player.velocity.y = -launch_strength

func on_player_entered(body: Node2D) -> void:
	player = body as Player

func on_player_exited(body: Node2D) -> void:
	player = null
