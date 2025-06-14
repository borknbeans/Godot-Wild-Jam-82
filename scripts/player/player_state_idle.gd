class_name PlayerStateIdle
extends PlayerState

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	player.animated_sprite.play("idle")
	player.velocity = Vector2.ZERO

## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	if not player.is_on_floor():
		finished.emit(FALL)
	elif Input.is_action_pressed("jump"):
		finished.emit(JUMP)
	elif horizontal_input != 0:
		finished.emit(RUN)

## Called by the state machine on the engine's physics update tick.
func physics_update(delta: float) -> void:
	player.move_and_slide()
