class_name PlayerState
extends State

const IDLE: String = "PlayerStateIdle"
const RUN: String = "PlayerStateRun"
const JUMP: String = "PlayerStateJump"
const FALL: String = "PlayerStateFall"

var player: Player
var horizontal_input: float

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the Player scene. It needs the owner to be a Player node.")

func _process(delta: float) -> void:
	print(player.velocity)
	horizontal_input = _get_horizontal_input()
	
	if horizontal_input != 0:
		player.animated_sprite.flip_h = horizontal_input < 0

func move_player() -> void:
	player.velocity.x += horizontal_input * player.acceleration
	player.velocity.x = clampf(player.velocity.x, -player.max_horizontal_speed, player.max_horizontal_speed)
	
	player.move_and_slide()

func apply_gravity() -> void:
	player.velocity.y -= player.gravity
	player.velocity.y = clampf(player.velocity.y, -player.max_fall_speed, player.velocity.y)

func _get_horizontal_input() -> float:
	return Input.get_axis("move_left", "move_right")
