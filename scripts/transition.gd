extends Control
class_name Transition

signal transition
signal endTransition

@onready var label: Label = $CanvasLayer/Panel/Label
@onready var panel: Panel = %Panel

func beginTransition(transitionTime : float, sceneTransition : bool = true, addText : bool = false, transitionMinTime : float = 0.2, blackScreenTime : float = 2, text : String = "") -> void:
	var tween = create_tween()
	tween.tween_property(panel, "modulate:a", 1, transitionTime)
	tween.play()
	await tween.finished
	transition.emit()
	tween.stop()
	if sceneTransition:
		await endTransition
	if addText:
		label.text = text
		await get_tree().create_timer(blackScreenTime).timeout
	tween.tween_property(panel, "modulate:a", 0, transitionTime)
	tween.play()
	await tween.finished
	label.text = ""
