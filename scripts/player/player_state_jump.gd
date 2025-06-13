class_name PlayerStateJump
extends PlayerState

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	player.animated_sprite.play("jump")
	player.velocity.y = -player.jump_strength

## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	if player.velocity.y > 0:
		finished.emit(FALL)

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	move_player()
	apply_gravity()
