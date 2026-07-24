extends Control
class_name Transition

signal transition
signal endTransition

@onready var panel: Panel = %Panel

const transitionMinTime = 0.2
func beginTransition(transitionTime : float) -> void:
	var tween = create_tween()
	tween.tween_property(panel, "modulate:a", 1, transitionTime)
	tween.play()
	await tween.finished
	transition.emit()
	tween.stop()
	await endTransition
	tween.tween_property(panel, "modulate:a", 0, transitionTime)
	tween.play()
	await tween.finished
