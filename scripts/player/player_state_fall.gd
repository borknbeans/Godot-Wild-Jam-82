class_name PlayerStateFall
extends PlayerState

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	player.animated_sprite.play("fall")

## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	if player.is_on_floor():
		if horizontal_input != 0:
			finished.emit(RUN)
		else:
			finished.emit(IDLE)

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	move_player()
	apply_gravity()
