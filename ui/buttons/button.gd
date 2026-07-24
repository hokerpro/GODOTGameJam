extends Control

var pressed = false

func _on_button_button_down() -> void:
	if not pressed:
		pressed = true
		StorySystem.startNextStep()
