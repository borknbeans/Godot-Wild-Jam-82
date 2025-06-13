extends Control

@onready var play_button: Button = %PlayButton
@onready var settings_button: Button = %SettingsButton
@onready var exit_button: Button = %ExitButton

func _ready() -> void:
	play_button.grab_focus() # Preselects the play button on start -> allows gamepad to control menus

func _on_play_button_pressed() -> void:
	print("Play button pressed")

func _on_settings_button_pressed() -> void:
	print("Settings button pressed")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
