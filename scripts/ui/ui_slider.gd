extends UIComponent
class_name UISlider


@export var area_2d: Area2D
@export var upper_bound: Vector2
@export var lower_bound: Vector2


var is_clicked: bool = false
var previous_mouse_position = Vector2.ZERO
var player: Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	mouse_down.connect(on_mouse_down)
	mouse_up.connect(on_mouse_up)
	area_2d.body_entered.connect(on_player_entered)
	area_2d.body_exited.connect(on_player_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	
	# Dragging logic
	if is_clicked:
		var current_mouse_position = get_viewport().get_mouse_position()
		var mouse_delta = Vector2.ZERO
		if previous_mouse_position != Vector2.ZERO:
			mouse_delta = current_mouse_position - previous_mouse_position
		previous_mouse_position = current_mouse_position
		#mouse_delta = max(Vector2.ZERO, )
		position += mouse_delta
		if player:
			player.position += mouse_delta
	else:
		previous_mouse_position = Vector2.ZERO


func on_mouse_down() -> void:
	# TODO: Animate the click
	is_clicked = true


func on_mouse_up() -> void:
	# TODO: Animate the release to bounce
	is_clicked = false

func on_player_entered(body: Node2D) -> void:
	player = body as Player

func on_player_exited(body: Node2D) -> void:
	player = null
